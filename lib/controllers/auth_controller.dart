import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(null);
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

  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
  void onToggleIsLoginMode() => _toggleIsLoginMode();
}
