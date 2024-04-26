import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:text_sns/constant/post_constant.dart';
import 'package:text_sns/core/firestore/query_core.dart';
import 'package:text_sns/models/moderated_image/moderated_image.dart';
import 'package:text_sns/models/post/post.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/models/q_doc_info/q_doc_info.dart';
import 'package:text_sns/repository/aws_s3_repository.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

abstract class PostController extends GetxController {
  final qDocInfos = <QDocInfo>[].obs;
  MapQuery get query;
  @override
  void onInit() async {
    final repository = FirestoreRepository();
    final result = await repository.getDocs(query);
    result.when(success: (res) async {
      final userDocs = await _getUsersFromPosts(res);
      for (final postDoc in res) {
        // qDocInfosにユーザー情報、ユーザーの画像を追加
        final Post post = Post.fromJson(postDoc.data());
        final userDoc =
            userDocs.firstWhere((element) => element.id == post.uid);
        final publicUser = PublicUser.fromJson(userDoc.data());
        final userImage = await _getImage(publicUser.typedImage);
        final qDocInfo = QDocInfo(
            publicUser: publicUser, userImage: userImage, postDoc: postDoc);
        qDocInfos.add(qDocInfo);
      }
    }, failure: () {
      UIHelper.showFlutterToast(PostConstant.getPostFailureMsg);
    });
    super.onInit();
  }

  Future<List<QDoc>> _getUsersFromPosts(List<QDoc> postDocs) async {
    final repository = FirestoreRepository();
    final List<Post> posts =
        postDocs.map((e) => Post.fromJson(e.data())).toList();
    final List<String> uids = posts.map((e) => e.uid).toList();
    final query = QueryCore.whereInUsersQuery(uids);
    final result = await repository.getDocs(query);
    late List<QDoc> userDocs;
    result.when(success: (res) {
      userDocs = res;
    }, failure: () {
      userDocs = [];
    });
    return userDocs;
  }

  Future<Uint8List?> _getImage(ModeratedImage image) async {
    final repository = AWSS3Repository();
    final bucket = image.bucketName;
    final object = image.fileName;
    final result = await repository.getObject(bucket, object);
    late Uint8List? uint8list;
    result.when(success: (res) {
      uint8list = res;
    }, failure: () {
      uint8list = null;
    });
    return uint8list;
  }
}
