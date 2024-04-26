import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/image_controller.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/view/pages/profile_page.dart';

class ProfileController extends ImageController {
  final rxPublicUser = Rx<PublicUser?>(null);
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
}
