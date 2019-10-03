import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:workshop_gdg_cali/src/entities/user_entity.dart';
import 'package:workshop_gdg_cali/src/pages/utils/headers_api.dart';

const restBackendURL = 'http://130.211.215.145:8080/ktorbackend-0.0.1';

class KtorDatabaseAPI {
  Future<UserEntity> registerUser(UserEntity user) async {
    var url = restBackendURL + '/register';

    final response = await http.post(url,
        body: json.encode(user), headers: HeadersAPI.headers(false));

    if (response.statusCode == 200) {
      return UserEntity.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(restBackendURL + '/register'));
    }
  }
}
