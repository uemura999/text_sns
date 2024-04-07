import 'package:flutter/material.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/view/abstract/auth_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends AuthState<LoginScreen> {
  @override
  Widget titleWidget() {
    return const Text(
      "Log in",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget toggleLoginModeButton() {
    const style = TextStyle(fontSize: 25.0, color: Colors.purple);
    return TextButton(
        onPressed: AuthController.to.onToggleIsLoginModeButtonPressed,
        child: const Text(
          "Signup",
          style: style,
        ));
  }
}
