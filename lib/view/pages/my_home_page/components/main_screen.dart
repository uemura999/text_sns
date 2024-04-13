import 'package:flutter/material.dart';
import 'package:text_sns/controllers/auth_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 30.0);
    return ElevatedButton(
        onPressed: authController.onSignOutButtonPressed,
        child: const Text(
          "Sign out",
          style: style,
        ));
  }
}
