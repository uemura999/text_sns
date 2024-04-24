import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/core/id_core/id_core.dart';
import 'package:text_sns/models/post/post.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/ui_core/validator_core.dart';

class CreatePostController extends SimpleFormController {
  @override
  String get title => "Create post";
  @override
  String get hintText => "Content";
  @override
  String? Function(String?)? get validator => ValidatorCore.text;
  @override
  String get positiveButtonText => "Create";
  @override
  String get successMsg => "Create post successfully";
  @override
  String get failureMsg => "Failed to create post";
  @override
  void onPositiveButtonPressed() async {
    if (!ValidatorCore.isValidText(text)) return;
    final repository = FirestoreRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null) return;
    final uid = user.uid;
    final postId = IDCore.uuidV4();
    final ref = DocRefCore.postDocRef(uid, postId);
    final now = Timestamp.now();
    final parentDocRef = DocRefCore.publicUserDocRef(uid);
    final post = Post(
        content: text, createdAt: now, parentDocRef: parentDocRef, uid: uid);
    final data = post.toJson();
    final result = await repository.createDoc(ref, data);
    result.when(success: (_) {
      UIHelper.showFlutterToast(successMsg);
      Get.back();
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
