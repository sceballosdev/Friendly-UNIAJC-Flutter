import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:workshop_gdg_cali/src/pages/utils/api_key.dart';
import 'package:workshop_gdg_cali/src/pages/utils/local_storage_service.dart';
import 'package:workshop_gdg_cali/src/pages/utils/locator.dart';

class StoreListTile extends StatefulWidget {
  const StoreListTile({
    Key key,
    @required this.document,
    @required this.mapController,
  }) : super(key: key);

  final DocumentSnapshot document;
  final Completer<GoogleMapController> mapController;

  @override
  State<StatefulWidget> createState() {
    return _StoreListTileState();
  }
}

final _placesApiClient = GoogleMapsPlaces(apiKey: googleMapsApiKey);

class _StoreListTileState extends State<StoreListTile> {
  String _placePhotoUrl = '';
  bool _disposed = false;
  final _localStorageService = locator<LocalStorageService>();

  @override
  void initState() {
    super.initState();
    _retrievePlacesDetails();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> _retrievePlacesDetails() async {
    final details =
        await _placesApiClient.getDetailsByPlaceId(widget.document['placeId']);
    if (!_disposed) {
      setState(() {
        if (details.result != null) {
          _placePhotoUrl = _placesApiClient.buildPhotoUrl(
            photoReference: details.result.photos[0].photoReference,
            maxHeight: 300,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.document['name']),
      subtitle: Text(widget.document['address']),
      leading: Container(
        child: widget.document['photoUrl'].isNotEmpty
            // ? CircleAvatar(backgroundImage: NetworkImage(_placePhotoUrl))
            ? ClipRRect(
                child: Image.network(widget.document['photoUrl'], fit: BoxFit.cover),
                borderRadius: const BorderRadius.all(Radius.circular(2)),
              )
            : CircleAvatar(
                child: Icon(
                  Icons.android,
                  color: Colors.white,
                ),
                backgroundColor: Colors.pink,
              ),
        width: 100,
        height: 60,
      ),
      onTap: () async {
        final controller = await widget.mapController.future;
        await controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                widget.document['location'].latitude,
                widget.document['location'].longitude,
              ),
              zoom: 16,
            ),
          ),
        );
      },
    );
  }
}
