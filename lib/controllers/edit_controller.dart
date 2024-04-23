import 'dart:typed_data';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:text_sns/constant/edit_constant.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/core/id_core/id_core.dart';
import 'package:text_sns/enums/env_key.dart';
import 'package:text_sns/models/moderated_image/moderated_image.dart';
import 'package:text_sns/models/user_update_log/user_update_log.dart';
import 'package:text_sns/repository/aws_s3_repository.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/ui_core/file_core.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';

class EditController extends SimpleFormController {
  static EditController get to => Get.find<EditController>();
  final rxUint8list = Rx<Uint8List?>(null);

  @override
  String get title => EditConstant.title;
  @override
  String get hintText => EditConstant.hintText;
  @override
  String get validatorMsg => EditConstant.validatorMsg;
  @override
  String get positiveButtonText => EditConstant.positiveButtonText;
  @override
  String get successMsg => EditConstant.successMsg;
  @override
  String get failureMsg => EditConstant.failureMsg;

  @override
  void onPositiveButtonPressed() async {
    final uint8list = rxUint8list.value;
    if (text.trim().isEmpty && uint8list == null) return;
    //画像をアップロードする
    final repository = AWSS3Repository();
    final bucket = dotenv.get(EnvKey.AWS_S3_USER_IMAGES_BUCKET.name);
    final object = "${IDCore.uuidV4()}.jpg";
    final data = Stream.value(uint8list!);
    final result = await repository.putObject(bucket, object, data);
    result.when(success: (_) async {
      await _updatePublicUser(bucket, object);
    }, failure: () {
      UIHelper.showFlutterToast(EditConstant.uploadImageFailureMsg);
    });
  }

  Future<void> _updatePublicUser(String bucketName, String fileName) async {
    final repository = FirestoreRepository();
    final uid = AuthController.to.rxAuthUser.value!.uid;
    final logId = IDCore.uuidV4();
    final ref = DocRefCore.userUpdateLogDocRef(uid, logId);
    final image =
        ModeratedImage(bucketName: bucketName, fileName: fileName).toJson();
    final data = UserUpdateLog(image: image, name: text, uid: uid).toJson();
    final result = await repository.createDoc(ref, data);
    result.when(success: (_) {
      final oldPublicUser = MainController.to.rxPublicUser.value;
      if (oldPublicUser == null) return;
      final newPublicUser = oldPublicUser.copyWith(name: text); //1部分のみ更新
      MainController.to.rxPublicUser.value = newPublicUser;
      UIHelper.showFlutterToast(EditConstant.successMsg);
    }, failure: () {
      UIHelper.showFlutterToast(EditConstant.failureMsg);
    });
  }

  void onImageIconTapped() async {
    final result = await FileCore.getImage();
    rxUint8list.value = result;
  }
}
