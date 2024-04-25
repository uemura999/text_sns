import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/posts_controller.dart';
import 'package:text_sns/models/post/post.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostsController());
    return Obx(() {
      final List<Post> posts = controller.qDocInfos
          .map((element) => Post.fromJson(element.data()))
          .toList();
      return ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            final Post post = posts[index];
            final uid = post.uid;
            return ListTile(
              title: Text(post.content),
              subtitle: Text("No. $index of post by $uid"),
            );
          });
    });
  }
}
