import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workshop_gdg_cali/src/entities/user_entity.dart';
import 'package:workshop_gdg_cali/src/pages/login/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signInGoogle() {
    return _auth_repository.signInGoogle();
  }

  //3. SignIn con las credenciales correo y password
  Future<UserEntity> signInWithCredentials(UserEntity user) {
    return _auth_repository.signInWithCredentials(user);
  }

  @override
  void dispose() {}
}
