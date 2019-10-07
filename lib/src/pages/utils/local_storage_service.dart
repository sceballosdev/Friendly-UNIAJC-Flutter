import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService _instance;
  static SharedPreferences _preferences;

  final String _kJWTToken = "jwtToken";
  final String _kEmail = "email";
  final String _kFullname = "fullname";
  final String _kPhotoURL = "photoURL";

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _instance = LocalStorageService();
    }

    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }

    return _instance;
  }

  set jwtToken(String jwtToken) => _preferences.setString(_kJWTToken, jwtToken);

  String get jwtToken => _preferences.getString(_kJWTToken);


  set email(String email) => _preferences.setString(_kEmail, email);

  String get email => _preferences.getString(_kEmail);

  set fullname(String fullname) => _preferences.setString(_kFullname, fullname);

  String get fullname => _preferences.getString(_kFullname);

  set photoURL(String photoURL) => _preferences.setString(_kPhotoURL, photoURL);

  String get photoURL => _preferences.getString(_kPhotoURL);

}
