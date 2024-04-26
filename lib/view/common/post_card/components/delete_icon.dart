import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/core/post/post_core.dart';
import 'package:text_sns/models/post/post.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({super.key, required this.postDoc});
  final QDoc postDoc;
  @override
  Widget build(BuildContext context) {
    final controller = AuthController.to;
    return Obx(() {
      final user = controller.rxAuthUser.value;
      final post = Post.fromJson(postDoc.data());
      return post.uid == user!.uid
          ? IconButton(
              onPressed: () {
                PostCore.onDeleteButtonPressed(postDoc);
              },
              icon: const Icon(Icons.delete),
            )
          : const SizedBox.shrink();
    });
  }
}
