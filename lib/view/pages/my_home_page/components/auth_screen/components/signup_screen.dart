import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late double? _deviceHeight;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _deviceHeight = size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          _titleWidget(),
          _signupForm(),
          _positiveButton(),
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
        key: _formKey,
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
      validator: (value) {
        return GetUtils.isEmail(value!)
            ? null
            : "Please enter a valid email address";
      },
    );
  }

  //password入力をする関数
  Widget _passwordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "password"),
      validator: (value) {
        return value!.length > 7 ? null : "Please enter at least 8 characters";
      },
    );
  }

  Widget _positiveButton() {
    return ElevatedButton(
      onPressed: () {
        //validation
        if (_formKey.currentState!.validate()) {
          //form fieldの情報を変数に保存
          _formKey.currentState!.save();
        }
      },
      child: const Text("Send"),
    );
  }
}
