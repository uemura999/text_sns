import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/view/common/byte_image.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final authController = AuthController.to;
    const style = TextStyle(fontSize: 30.0);
    return Column(
      children: [
        Obx(
          () => Text(
            MainController.to.rxPublicUser.value?.name ?? "Null",
            style: style,
          ),
        ),
        const SizedBox(height: 20.0),
        Obx(
          () => ByteImage(bytes: MainController.to.rxUint8list.value),
        ),
        const SizedBox(height: 20.0),
        Obx(() {
          final publicUser = MainController.to.rxPublicUser.value;
          if (publicUser == null) {
            return const SizedBox.shrink();
          } else {
            final data =
                publicUser.isAppropriate ? "Appropriate" : "Inappropriate";
            return Text(data, style: style);
          }
        }),
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
