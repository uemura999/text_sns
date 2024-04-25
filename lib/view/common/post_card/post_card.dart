import 'package:flutter/material.dart';
import 'package:text_sns/models/q_doc_info/q_doc_info.dart';
import 'package:text_sns/models/post/post.dart';
import 'package:text_sns/view/common/byte_image.dart';
import 'package:text_sns/view/common/post_card/components/delete_icon.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.qDocInfo});
  final QDocInfo qDocInfo;
  @override
  Widget build(BuildContext context) {
    final postDoc = qDocInfo.postDoc;
    final Post post = Post.fromJson(postDoc.data());
    final publicUser = qDocInfo.publicUser;
    final userImage = qDocInfo.userImage;
    return Card(
      color: Theme.of(context).primaryColor.withOpacity(0.2),
      child: ListTile(
        leading: ByteImage(
          bytes: userImage,
        ),
        title: Text(
          publicUser?.name ?? "",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(post.content),
        trailing: DeleteIcon(post: post),
      ),
    );
  }
}
