import 'package:get/get.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/ui_core/dialog_core.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class PostCore {
  static void onDeleteButtonPressed(QDoc postDoc) {
    DialogCore.cupertinoAlertDialog(
        "Are you sure want to delete this post ?", "Delete post", () async {
      Get.back();
      await _deletePost(postDoc);
    });
  }

  static Future<void> _deletePost(QDoc postDoc) async {
    final repository = FirestoreRepository();
    final ref = postDoc.reference;
    final result = await repository.deleteDoc(ref);
    result.when(success: (_) {
      MainController.to.deletePostIds.add(postDoc.id);
      UIHelper.showFlutterToast("Success to delete post");
    }, failure: () {
      UIHelper.showFlutterToast("Failed to delete post");
    });
  }
}
