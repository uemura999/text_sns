import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/reauthenticate_controller.dart';
import 'package:text_sns/view/abstract/simple_form_state.dart';
import 'package:text_sns/view/common/basic_page.dart';

class ReauthenticatePage extends StatefulWidget {
  const ReauthenticatePage({super.key});
  static const purposeKey = "purpose";
  static const path = "/reauthenticate/:$purposeKey";
  static String generatePath(String purpose) => "/reauthenticate/$purpose";
  @override
  State<ReauthenticatePage> createState() => _ReauthenticatePageState();
}

class _ReauthenticatePageState extends SimpleFormState<ReauthenticatePage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReauthenticateController());
    return BasicPage(
        appBarTitle: "Reauthenticate", child: buildWidget(controller));
  }
}
