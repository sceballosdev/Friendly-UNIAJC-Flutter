import 'package:firebase_auth/firebase_auth.dart';
import 'package:workshop_gdg_cali/src/entities/login_entity.dart';
import 'package:workshop_gdg_cali/src/entities/user_entity.dart';
import 'package:workshop_gdg_cali/src/pages/login/repository/APIS/ktor_auth_api.dart';

import 'APIS/firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();
  final _ktorAuthAPI = KtorAuthAPI();

  // Firebase
  Future<FirebaseUser> signInGoogle() => _firebaseAuthAPI.signInGoogle();
  Future<FirebaseUser> signInAnonymously() => _firebaseAuthAPI.signInAnonymously();
  //Future<FirebaseUser> signInFacebook() => _firebaseAuthAPI.signInFacebook();
  signOut() => _firebaseAuthAPI.signOut();

  // Ktor
  Future<UserEntity> signInWithCredentials(LoginEntity user) => _ktorAuthAPI.signInWithCredentials(user);
}
