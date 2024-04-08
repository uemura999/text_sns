import 'package:flutter/material.dart';
import 'package:text_sns/constant/auth_constant.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/view/abstract/auth_state.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends AuthState<SignupScreen> {
  @override
  Widget titleWidget() {
    return const Text(
      AuthConstant.signupTitle,
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  @override
  Widget toggleLoginModeButton() {
    const style = TextStyle(fontSize: 25.0, color: Colors.purple);
    return TextButton(
        onPressed: AuthController.to.onToggleIsLoginModeButtonPressed,
        child: const Text(
          AuthConstant.toLoginScreenText,
          style: style,
        ));
  }
}
