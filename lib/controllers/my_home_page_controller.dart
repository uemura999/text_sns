import 'package:get/get.dart';
import 'package:text_sns/constant/my_home_page_constant.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class MyHomePageController extends GetxController {
  final rxDoc = Rx<Doc?>(null);

  void onFloatingActionButtonPressed() async {
    await _createDoc();
  }

  Future<void> _createDoc() async {
    final repository = FirestoreRepository();
    const user = PublicUser(uid: 'core');
    final ref = DocRefCore.publicUserDocRef(user.uid);
    final data = user.toJson();
    final result = await repository.createDoc(ref, data);
    result.when(success: (_) async {
      await _readDoc(ref);
    }, failure: () {
      UIHelper.showFlutterToast(MyHomePageConstant.createUserFailureMsg);
    });
  }

  Future<void> _readDoc(DocRef ref) async {
    final repository = FirestoreRepository();
    final result = await repository.getDoc(ref);
    result.when(success: (doc) {
      rxDoc.value = doc;
      UIHelper.showFlutterToast(MyHomePageConstant.readUserSuccessMsg);
    }, failure: () {
      UIHelper.showFlutterToast(MyHomePageConstant.readUserFailureMsg);
    });
  }
}
