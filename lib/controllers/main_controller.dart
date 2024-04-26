import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/image_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/enums/env_key.dart';
import 'package:text_sns/models/moderated_image/moderated_image.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class MainController extends ImageController {
  static MainController get to => Get.find<MainController>();
  final rxPublicUser = Rx<PublicUser?>(null);
  final deletePostIds = <String>[].obs; //削除した投稿ID
  @override
  void onInit() async {
    await _manageUserInfo();
    final publicUser = rxPublicUser.value;
    if (publicUser == null) return;
    final image = publicUser.typedImage;
    final bucket = image.bucketName;
    final object = image.fileName;
    await getObject(bucket, object);
    super.onInit();
  }

  Future<void> _manageUserInfo() async {
    final authUser = AuthController.to.rxAuthUser.value;
    if (authUser == null) return;
    final repository = FirestoreRepository();
    final uid = authUser.uid;
    final ref = DocRefCore.publicUserDocRef(uid);
    final result = await repository.getDoc(ref);
    result.when(success: (res) async {
      final json = res.data();
      if (res.exists && json != null) {
        rxPublicUser.value = PublicUser.fromJson(json);
      } else {
        //ユーザーを作成する
        await _createPublicUser(ref, uid);
      }
    }, failure: () {
      UIHelper.showFlutterToast("Failed to get user");
    });
  }

  Future<void> _createPublicUser(DocRef ref, String uid) async {
    final repository = FirestoreRepository();
    final bucketName = dotenv.get(EnvKey.AWS_S3_USER_IMAGES_BUCKET.name);
    final image = ModeratedImage(bucketName: bucketName).toJson();
    final newPublicUser = PublicUser(uid: uid, image: image);
    final json = newPublicUser.toJson();
    final result = await repository.createDoc(ref, json);
    result.when(success: (_) {
      rxPublicUser.value = newPublicUser;
      UIHelper.showFlutterToast("Successfully created user");
    }, failure: () {
      UIHelper.showFlutterToast("Failed to create user");
    });
  }
}
