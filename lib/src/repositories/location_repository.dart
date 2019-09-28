import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:workshop_gdg_cali/src/entities/location_entity.dart';

const googleLocationsURL = 'https://about.google/static/data/locations.json';

class LocationRepository {
  Future<Locations> getGoogleOffices() async {
    // Retrieve the locations of Google offices
    final response = await http.get(googleLocationsURL);
    if (response.statusCode == 200) {
      return Locations.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(googleLocationsURL));
    }
  }
}
