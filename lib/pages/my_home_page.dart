import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/my_home_page_controller.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyHomePageController());
    final authController = Get.put(AuthController());
    return Scaffold(
        appBar: AppBar(
          title: Text(F.title),
        ),
        body: Obx(() {
          const style = TextStyle(fontSize: 60.0);
          if (authController.rxAuthUser.value != null) {
            return const Text(
              'Not null',
              style: style,
            );
          } else {
            return const Text(
              'Null',
              style: style,
            );
          }
        }));
  }
}
