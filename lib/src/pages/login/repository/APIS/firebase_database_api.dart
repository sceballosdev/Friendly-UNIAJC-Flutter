import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:workshop_gdg_cali/src/entities/user_entity.dart';

class FirebaseDatabaseAPI {
  final String USERS = "users";
  final String TOKENS = "fcmTokens";
  final String PLACES = "places";

  final Firestore _db = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(UserEntity user) async{
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'name': user.username,
      'email': user.email,
      'photoURL': user.photoURL,
      'lastSignIn': DateTime.now()

    }, merge: true);

  }

  void updateUserToken(String token, String uid) async{
    DocumentReference ref = _db.collection(TOKENS).document(token);
    return await ref.setData({
      'uid': uid,
    }, merge: true);

  }
}