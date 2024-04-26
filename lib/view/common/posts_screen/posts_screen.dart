import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:text_sns/controllers/abstract/post_controller.dart';
import 'package:text_sns/models/q_doc_info/q_doc_info.dart';
import 'package:text_sns/view/common/post_card/post_card.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key, required this.controller});
  final PostController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final List<QDocInfo> qDocInfos = controller.qDocInfos;
      return ListView.builder(
          itemCount: qDocInfos.length,
          itemBuilder: (context, index) {
            final qDocInfo = qDocInfos[index];
            return PostCard(qDocInfo: qDocInfo);
          });
    });
  }
}
