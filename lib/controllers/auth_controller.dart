import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(FirebaseAuth.instance.currentUser);
  final rxIsLoginMode = true.obs;
  String email = '';
  String password = '';

  void setEmail(String? value) {
    if (value == null) return;
    email = value;
  }

  void setPassword(String? value) {
    if (value == null) return;
    password = value;
  }

  void onPositiveButtonPressed() async {
    if (GetUtils.isEmail(email.trim()) && password.trim().length > 7) {
      rxIsLoginMode.value
          ? await _signInWithEmailAndPassword()
          : await _createUserWithEmailAndPassword();
    }
  }

  Future<void> _createUserWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.createUserWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(success: (res) {
      rxAuthUser.value = res;
      UIHelper.showFlutterToast("Successfully created user");
    }, failure: () {
      UIHelper.showFlutterToast("Failed to create user");
    });
  }

  Future<void> _signInWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.signInWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(success: (res) {
      rxAuthUser.value = res;
      UIHelper.showFlutterToast("Successfully logged in");
    }, failure: () {
      UIHelper.showFlutterToast("Failed to log in");
    });
  }

  void onSignOutButtonPressed() async {
    await _signOut();
  }

  Future<void> _signOut() async {
    final repository = AuthRepository();
    final result = await repository.signOut();
    result.when(success: (_) {
      rxAuthUser.value = null;
      UIHelper.showFlutterToast("Successfully signed out");
    }, failure: () {
      UIHelper.showFlutterToast("Failed to sign out");
    });
  }

  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
  void onToggleIsLoginModeButtonPressed() => _toggleIsLoginMode();
}
