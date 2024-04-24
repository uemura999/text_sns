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

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> sendEmailVerification(User user) async {
    await user.sendEmailVerification();
  }

  Future<void> reauthenticateWithCredential(User user, String password) async {
    final email = user.email;
    final credential =
        EmailAuthProvider.credential(email: email!, password: password);
    await user.reauthenticateWithCredential(credential);
  }

  Future<void> verifyBeforeUpdateEmail(User user, String newEmail) async {
    await user.verifyBeforeUpdateEmail(newEmail);
  }

  Future<void> updatePassword(User user, String newPassword) async {
    await user.updatePassword(newPassword);
  }
}
