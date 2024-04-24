import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/constant/account_constant.dart';
import 'package:text_sns/controllers/update_email_controller.dart';
import 'package:text_sns/view/abstract/simple_form_state.dart';
import 'package:text_sns/view/common/basic_page.dart';

class UpdateEmailPage extends StatefulWidget {
  const UpdateEmailPage({super.key});
  static const path = "/updateEmail";
  @override
  State<UpdateEmailPage> createState() => _UpdateEmailPageState();
}

class _UpdateEmailPageState extends SimpleFormState<UpdateEmailPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateEmailController());
    return BasicPage(
        appBarTitle: AccountConstant.updateEmailPageTitle,
        child: buildWidget(controller));
  }
}
