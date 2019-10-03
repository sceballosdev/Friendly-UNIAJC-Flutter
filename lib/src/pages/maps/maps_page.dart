import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    userBloc = BlocProvider.of<UserBloc>(context);

    /*return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if (!snapshot.hasData || snapshot.hasError) {
          return LoginPage();
        } else {
          return mapPageUI();
        }
      },
    );*/

    return mapPageUI();
  }

  Widget mapPageUI() {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
}
