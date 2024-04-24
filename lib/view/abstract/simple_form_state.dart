import 'package:flutter/material.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/view/common/rounded_button.dart';
import 'package:text_sns/view/common/text_field_container.dart';

abstract class SimpleFormState<T extends StatefulWidget> extends State<T> {
  final _formKey = GlobalKey<FormState>();
  //全要素
  Widget buildWidget(SimpleFormController controller) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleWidget(controller),
        form(controller),
        positiveButton(controller),
      ],
    );
  }

  //タイトル関数
  Widget titleWidget(SimpleFormController controller) {
    return Text(
      controller.title,
      style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
    );
  }

  //入力フォーム関数
  Widget form(SimpleFormController controller) {
    return Form(
      key: _formKey,
      child: textField(controller),
    );
  }

  //文字の入力をする関数
  Widget textField(SimpleFormController controller) {
    return TextFieldContainer(
        child: TextFormField(
      obscureText: controller.obscureText,
      decoration: InputDecoration(hintText: controller.hintText),
      onSaved: controller.setText,
      validator: controller.validator,
    ));
  }

  //送信ボタン
  Widget positiveButton(SimpleFormController controller) {
    return RoundedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
        }
        controller.onPositiveButtonPressed();
      },
      textValue: controller.positiveButtonText,
      buttonColor: Colors.green,
    );
  }
}
