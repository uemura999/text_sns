import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DialogCore {
  static void cupertinoAlertDialog(
      String content, String title, void Function()? positiveAction) {
    Get.dialog(CupertinoAlertDialog(
      content: Text(content),
      title: Text(title),
      actions: [
        CupertinoDialogAction(onPressed: Get.back, child: const Text("Cancel")),
        CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: positiveAction,
            child: const Text("OK"))
      ],
    ));
  }
}
