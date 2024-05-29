import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/app/themes.dart';
import 'package:text_sns/controllers/theme_controller.dart';
import 'package:text_sns/router/get_pages.dart';
import '../flavors.dart';
import '../view/pages/my_home_page/my_home_page.dart';

class App extends StatelessWidget {
  const App({super.key});
  static const path = "/";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ThemeController());
    return Obx(() => GetMaterialApp(
          title: F.title,
          getPages: GetPages.value,
          initialRoute: path,
          theme: controller.rxIsDarkTheme.value
              ? Themes.darkTheme()
              : Themes.lightTheme(),
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(),
        ));
  }
}
