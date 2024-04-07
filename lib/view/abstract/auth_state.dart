import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';

abstract class AuthState<T extends StatefulWidget> extends State<T> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          titleWidget(),
          _signupForm(),
          _positiveButton(),
          toggleLoginModeButton(),
        ],
      ),
    );
  }

//タイトル関数
  Widget titleWidget();

  //入力フォーム関数
  Widget _signupForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _emailTextField(),
          _passwordTextField(),
        ],
      ),
    );
  }

  //email入力をする関数
  Widget _emailTextField() {
    final controller = AuthController.to;
    return TextFormField(
      decoration: const InputDecoration(hintText: "mail address"),
      onSaved: controller.setEmail,
      validator: (value) {
        return GetUtils.isEmail(value!)
            ? null
            : "Please enter a valid email address";
      },
    );
  }

  //password入力をする関数
  Widget _passwordTextField() {
    final controller = AuthController.to;
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(hintText: "password"),
      onSaved: controller.setPassword,
      validator: (value) {
        return value!.length > 7 ? null : "Please enter at least 8 characters";
      },
    );
  }

  Widget _positiveButton() {
    return ElevatedButton(
      onPressed: () async {
        //validation
        if (_formKey.currentState!.validate()) {
          //form fieldの情報を変数に保存
          _formKey.currentState!.save();
        }
        AuthController.to.onPositiveButtonPressed();
      },
      child: const Text("Send"),
    );
  }

  Widget toggleLoginModeButton();
}
