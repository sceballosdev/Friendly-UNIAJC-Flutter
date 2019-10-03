import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:workshop_gdg_cali/src/entities/login_entity.dart';
import 'package:workshop_gdg_cali/src/entities/user_entity.dart';
import 'package:workshop_gdg_cali/src/pages/login/repository/auth_repository.dart';
import 'package:workshop_gdg_cali/src/pages/login/repository/database_repository.dart';

class UserBloc implements Bloc {

  // Repository instances
  final _auth_repository = AuthRepository();
  final _database_repository = DatabaseRepository();

  //Flujo de datos - Streams
  //Stream - Firebase
  //StreamController
  Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();

  //Casos uso
  //1. SignIn a la aplicación Google
  Future<FirebaseUser> signInGoogle() => _auth_repository.signInGoogle();

  //2. SignIn con las credenciales correo y password
  Future<UserEntity> signInWithCredentials(LoginEntity user) =>
      _auth_repository.signInWithCredentials(user);

  //3. SignIn Anonymously
  Future<FirebaseUser> signInAnonymously() => _auth_repository.signInAnonymously();

  //3. Update user data firestore
  void updateUserData(UserEntity user) => _database_repository.updateUserDataFirestore(user);

  //4. Registar al usuario en el back ktor
  Future<UserEntity> registerUser(UserEntity user) => _database_repository.registerUser(user);

  //5. Logout
  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {}
}
