import 'package:flutter/material.dart';
import 'package:text_sns/constant/auth_constant.dart';
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
      AuthConstant.loginTitle,
      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget toggleLoginModeButton() {
    const style = TextStyle(fontSize: 15.0, color: Colors.purple);
    return TextButton(
        onPressed: AuthController.to.onToggleIsLoginModeButtonPressed,
        child: const Text(
          AuthConstant.toSignupScreenText,
          style: style,
        ));
  }
}
