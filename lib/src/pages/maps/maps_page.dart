import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:geolocator/geolocator.dart' as geolocation;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:workshop_gdg_cali/src/pages/login/bloc/bloc_user.dart';
import 'package:workshop_gdg_cali/src/pages/maps/widgets/store_carousel.dart';
import 'package:workshop_gdg_cali/src/pages/maps/widgets/store_map.dart';

class MapsPage extends StatefulWidget {
  static const String routeName = "/maps";

  const MapsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Stream<QuerySnapshot> _userLocations;
  final Completer<GoogleMapController> _mapController = Completer();
  Location _locationService = Location();
  geolocation.Geolocator geolocator;
  geolocation.Position position;
  int selectedIndex = 0;
  UserBloc userBloc;

  @override
  void initState() {
    super.initState();
    _userLocations = Firestore.instance
        .collection('userLocations')
        .orderBy('name')
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onItemTapped,
        currentIndex: selectedIndex,
        fixedColor: Colors.indigo,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.rotate_left, color: Colors.indigo),
              title: Text("Izquierda")),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_searching, color: Colors.indigo),
              title: Text("Compartir ubicación")),
          BottomNavigationBarItem(
              icon: Icon(Icons.rotate_right, color: Colors.indigo),
              title: Text("Derecha"))
        ],
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _userLocations,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return Center(child: const Text('Loading...'));
          }

          return Stack(
            children: <Widget>[
              StoreMap(
                documents: snapshot.data.documents,
                initialPosition: const LatLng(3.4224353, -76.5374749),
                mapController: _mapController,
              ),
              StoreCarousel(
                documents: snapshot.data.documents,
                mapController: _mapController,
              ),
            ],
          );
        },
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      switch (selectedIndex) {
        case 0:
          break;
        case 1:
          _showAlert("¿Deseas compartir tu ubicación?");
          break;
        case 2:
          break;
        default:
      }
    });
  }

  void _showAlert(String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Compartir Ubicación"),
          content: Text(value),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Confirmar"),
              onPressed: () {
                Navigator.of(context).pop();
                shareLocation();
              },
            )
          ],
        );
      },
    );
  }

  void shareLocation() async {
    try {
      var locationActive = await _locationService.requestService();
      if (locationActive) {
        geolocator = geolocation.Geolocator();
        position = await geolocator.getCurrentPosition(
            desiredAccuracy: geolocation.LocationAccuracy.best);

        await userBloc.currentUser.then((FirebaseUser user) {
          Firestore.instance
              .collection('userLocations')
              .document(user.uid)
              .setData({
            'address': 'Ubicación actual de ' + user.displayName,
            'location': GeoPoint(position.latitude, position.longitude),
            'name': user.displayName,
            'photoUrl': user.photoUrl,
            'placeId': 'ChIJkSr7GyqnMI4ReLXQnyDN3hM',
          });
        });
      } else {
        _showDialogNoActivo(
            "Alerta", "Para compartir la ubicacion debe activar su gps");
      }
    } catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        print('Permission denied');
      } else if (e.code == "PERMISSION_DENIED_NEVER_ASK") {
        print('Permission denied');
      }
    }
  }

  void _showDialogNoActivo(title, body) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text("Aceptar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
