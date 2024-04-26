import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:text_sns/constant/image_constant.dart';
import 'package:text_sns/controllers/abstract/post_controller.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/core/firestore/query_core.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/repository/aws_s3_repository.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/view/pages/profile_page.dart';

class ProfileController extends PostController {
  final rxPublicUser = Rx<PublicUser?>(null);
  final rxUint8list = Rx<Uint8List?>(null);
  @override
  MapQuery get query =>
      QueryCore.userPostsQuery(Get.parameters[ProfilePage.uidKey]!);
  //useEffectで呼び出す
  void init() async {
    await _fetchUser();
    final publicUser = rxPublicUser.value;
    if (publicUser == null) return;
    final image = publicUser.typedImage;
    final bucket = image.bucketName;
    final object = image.fileName;
    await getObject(bucket, object); //画像の設定
  }

  Future<void> _fetchUser() async {
    final String? uid = Get.parameters[ProfilePage.uidKey];
    if (uid == null) return;
    final repository = FirestoreRepository();
    final ref = DocRefCore.publicUserDocRef(uid);
    final result = await repository.getDoc(ref);
    result.when(success: (res) {
      if (res.exists) {
        final publicUser = PublicUser.fromJson(res.data()!);
        rxPublicUser.value = publicUser;
      }
    }, failure: () {
      UIHelper.showFlutterToast("Failed to get user");
    });
  }

  Future<void> getObject(String bucket, String object) async {
    final repository = AWSS3Repository();
    final result = await repository.getObject(bucket, object);
    result.when(success: (res) {
      rxUint8list.value = res;
    }, failure: () {
      UIHelper.showFlutterToast(ImageConstant.getObjectFailureMsg);
    });
  }
}
