import 'package:workshop_gdg_cali/src/entities/user_entity.dart';
import 'package:workshop_gdg_cali/src/pages/login/repository/APIS/firebase_database_api.dart';
import 'package:workshop_gdg_cali/src/pages/login/repository/APIS/ktor_database_api.dart';

class DatabaseRepository {
  final _firebaseDatabaseAPI = FirebaseDatabaseAPI();
  final _ktorDatabaseAPI = KtorDatabaseAPI();

  void updateUserDataFirestore(UserEntity user) => _firebaseDatabaseAPI.updateUserData(user);
  Future<UserEntity> registerUser(UserEntity user) => _ktorDatabaseAPI.registerUser(user);
}