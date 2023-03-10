

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class googleAuthservice {
  static GoogleSignIn _googleSingin = GoogleSignIn();
   Future<void> loginusergoogle () async {
   
   final GoogleSignInAccount? googleUser = await _googleSingin.signIn();
   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
   print(googleUser?.displayName);
   print(googleAuth?.accessToken);
   print(googleAuth?.idToken);


   final Credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
   );
   UserCredential  userCredential
    = await FirebaseAuth.instance.signInWithCredential(Credential);
    print(userCredential.user);
  }
  void logoutgoogle () {
    FirebaseAuth.instance.signOut().then((value) {
      _googleSingin.signOut();


    });

  }
}
