import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/app/themes.dart';
import 'package:text_sns/controllers/theme_controller.dart';
import '../flavors.dart';
import '../view/pages/my_home_page/my_home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final controlller = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          title: F.title,
          theme: controlller.rxIsDarkTheme.value
              ? Themes.darkTheme()
              : Themes.lightTheme(),
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        ));
  }
}
