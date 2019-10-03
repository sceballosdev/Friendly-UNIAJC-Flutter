import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<FirebaseUser> signInGoogle() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    AuthResult authResult = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: gSA.idToken, accessToken: gSA.accessToken));

    FirebaseUser user = await authResult.user;

    return user;
  }

  Future<FirebaseUser> signInAnonymously() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    AuthResult authResult = await _auth.signInAnonymously();

    FirebaseUser user = await authResult.user;
    print("Signed in ${user.uid}");
    return user;
  }

  /*Future<FirebaseUser> signInFacebook() async {
    var facebookLogin = FacebookLogin();
    var result = await facebookLogin.logIn(['email']);

    FirebaseUser user;

    print(result.status.toString());

    if (result.status == FacebookLoginStatus.loggedIn) {
      print('entro al if correcto login');
      AuthResult authResult = await _auth.signInWithCredential(
          FacebookAuthProvider.getCredential(
              accessToken: result.accessToken.token));

      user = await authResult.user;
    }else{
      print('entro al else incorrecto login');
    }

    return user;
  }*/

  signOut() async {
    await _auth.signOut().then((onValue) => print("Sesión cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }
}
