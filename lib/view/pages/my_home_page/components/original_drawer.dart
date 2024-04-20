import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/theme_controller.dart';

class OriginalDrawer extends StatelessWidget {
  const OriginalDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ThemeController.to;
    return Drawer(
      child: ListView(
        children: [
          Obx(() => ListTile(
                title: const Text('Change Theme'),
                trailing: CupertinoSwitch(
                  value: controller.rxIsDarkTheme.value,
                  onChanged: controller.onSwitchChanged,
                ),
              ))
        ],
      ),
    );
  }
}
