import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/view/pages/my_home_page/components/main_screen/components/content_screen.dart';
import 'package:text_sns/view/pages/my_home_page/components/main_screen/components/edit_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainController());
    return Obx(() {
      final publicUser = controller.rxPublicUser.value;
      if (publicUser == null) {
        return const CircularProgressIndicator();
      } else {
        return publicUser.name.isEmpty
            ? const EditScreen()
            : const ContentScreen();
      }
    });
  }
}
