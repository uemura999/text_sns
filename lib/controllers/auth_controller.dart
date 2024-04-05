import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final rxAuthUser = Rx<User?>(null);
  final rxIsLoginMode = true.obs;

  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
  void onToggleIsLoginMode() => _toggleIsLoginMode();
}
