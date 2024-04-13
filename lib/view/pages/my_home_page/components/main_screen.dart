import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/main_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final mainController = Get.put(MainController());
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 30.0);
    return Column(
      children: [
        Obx(
          () => Text(
            mainController.rxPublicUser.value?.uid ?? "Null",
            style: style,
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
            onPressed: authController.onSignOutButtonPressed,
            child: const Text(
              "Sign out",
              style: style,
            )),
      ],
    );
  }
}
