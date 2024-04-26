import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/latest_posts_controller.dart';
import 'package:text_sns/view/common/posts_screen/posts_screen.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LatestPostsController());
    return PostsScreen(controller: controller);
  }
}
