import 'package:firebase_auth/firebase_auth.dart';
import 'package:workshop_gdg_cali/src/entities/user_entity.dart';
import 'package:workshop_gdg_cali/src/pages/login/repository/ktor_auth_api.dart';

import 'firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = FirebaseAuthAPI();
  final _ktorAuthAPI = KtorAuthAPI();

  Future<FirebaseUser> signInGoogle() => _firebaseAuthAPI.signInGoogle();
  Future<UserEntity> signInWithCredentials(UserEntity user) => _ktorAuthAPI.signInWithCredentials(user);
  signOut() => _firebaseAuthAPI.signOut();
}
