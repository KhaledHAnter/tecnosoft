import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> loginUser(
    {required String? email, required String? password}) async {
  UserCredential user = await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: email!, password: password!);
}

Future<void> registerUser(
    {required String? email, required String? password}) async {
  UserCredential user = await FirebaseAuth.instance
      .createUserWithEmailAndPassword(email: email!, password: password!);
}

Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
