import 'package:get/get.dart';
import 'package:text_sns/core/firestore/query_core.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class PostsController extends GetxController {
  final qDocInfos = <QDoc>[].obs;
  @override
  void onInit() async {
    final repository = FirestoreRepository();
    final query = QueryCore.postsCollectionQuery();
    final result = await repository.getDocs(query);
    result.when(success: (res) {
      qDocInfos.addAll(res);
    }, failure: () {
      UIHelper.showFlutterToast("Failed to get posts");
    });
    super.onInit();
  }
}
