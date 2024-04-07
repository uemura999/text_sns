import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late double? _deviceHeight;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _deviceHeight = size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          _titleWidget(),
          _signupForm(),
        ],
      ),
    );
  }

//タイトル関数
  Widget _titleWidget() {
    return const Text(
      "Sign up",
      style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  //入力フォーム関数
  Widget _signupForm() {
    return SizedBox(
      height: _deviceHeight! * 0.30,
      child: Form(
        child: Column(
          children: [
            _emailTextField(),
            _passwordTextField(),
          ],
        ),
      ),
    );
  }

  //email入力をする関数
  Widget _emailTextField() {
    return TextFormField(
      decoration: const InputDecoration(hintText: "mail address"),
    );
  }

  //password入力をする関数
  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "password"),
    );
  }
}
