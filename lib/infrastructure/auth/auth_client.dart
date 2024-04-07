import 'package:firebase_auth/firebase_auth.dart';

class AuthClient {
  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential;
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return credential;
  }
}