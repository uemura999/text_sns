import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find<ThemeController>();
  final rxIsDarkTheme = true.obs;
  void onSwitchChanged(bool value) => rxIsDarkTheme.value = value;
}
