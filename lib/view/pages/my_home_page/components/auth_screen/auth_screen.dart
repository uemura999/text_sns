import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/view/pages/my_home_page/components/auth_screen/components/login_screen.dart';
import 'package:text_sns/view/pages/my_home_page/components/auth_screen/components/signup_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Obx(() {
      if (controller.rxIsLoginMode.value) {
        return const LoginScreen();
      } else {
        return const SignupScreen();
      }
    });
  }
}
