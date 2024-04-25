import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/posts_controller.dart';
import 'package:text_sns/models/post/post.dart';
import 'package:text_sns/models/q_doc_info/q_doc_info.dart';
import 'package:text_sns/view/common/byte_image.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostsController());
    return Obx(() {
      final List<QDocInfo> qDocInfos = controller.qDocInfos;
      return ListView.builder(
          itemCount: qDocInfos.length,
          itemBuilder: (context, index) {
            final qDocInfo = qDocInfos[index];
            final postDoc = qDocInfo.postDoc;
            final Post post = Post.fromJson(postDoc.data());
            final publicUser = qDocInfo.publicUser;
            final userImage = qDocInfo.userImage;
            return ListTile(
              leading: ByteImage(
                bytes: userImage,
              ),
              title: Text(publicUser?.name ?? ""),
              subtitle: Text(post.content),
            );
          });
    });
  }
}
