import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/view/common/basic_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static const path = "/account";
  @override
  Widget build(BuildContext context) {
    final controller = AuthController.to;
    return BasicPage(
        appBarTitle: "AccountPage",
        child: ListView(
          children: [
            Obx(() {
              final authUser = controller.rxAuthUser.value;
              final data = authUser == null ? "Null" : authUser.email!;
              return ListTile(
                title: Text(data),
                trailing: InkWell(
                  onTap: controller.onEditEmailButtonPressed,
                  child: const Icon(Icons.edit),
                ),
              );
            }),
            ListTile(
              title: const Text("Update password"),
              onTap: controller.onUpdatePasswordTileTapped,
            ),
            ListTile(
                title: const Text("Sign out"),
                onTap: controller.onSignOutButtonPressed)
          ],
        ));
  }
}
