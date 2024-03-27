import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/my_home_page_controller.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyHomePageController());
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.onFloatingActionButtonPressed,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(child: Obx(() {
        return Text(
          'UserId ${controller.rxDoc.value?.id ?? 'null'}',
          style: const TextStyle(fontSize: 40.0),
        );
      })),
    );
  }
}
