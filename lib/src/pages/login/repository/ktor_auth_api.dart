import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:workshop_gdg_cali/src/entities/user_entity.dart';
import 'package:workshop_gdg_cali/src/pages/utils/headers_api.dart';

const restBackendURL =
    'http://ec2-18-225-8-60.us-east-2.compute.amazonaws.com:8080';

class KtorAuthAPI {
  Future<UserEntity> signInWithCredentials(UserEntity user) async {
    print('usuario que llega ' + user.toJson().toString());

    var url = restBackendURL + '/login';

    final response = await http.post(url, body: json.encode(user), headers: HeadersAPI.headers(false));

    if (response.statusCode == 200) {
      return UserEntity.fromJson(json.decode(response.body));
    } else {
      throw HttpException(
          'Unexpected status code ${response.statusCode}:'
          ' ${response.reasonPhrase}',
          uri: Uri.parse(restBackendURL + '/login'));
    }
  }
}
