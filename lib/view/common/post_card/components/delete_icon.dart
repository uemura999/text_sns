import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/models/post/post.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({super.key, required this.post});
  final Post post;
  @override
  Widget build(BuildContext context) {
    final controller = AuthController.to;
    return Obx(() {
      final user = controller.rxAuthUser.value;
      return post.uid == user!.uid
          ? const Icon(Icons.delete)
          : const SizedBox.shrink();
    });
  }
}
