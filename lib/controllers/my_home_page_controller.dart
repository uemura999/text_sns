import 'package:get/get.dart';
import 'package:text_sns/view/pages/create_post_page.dart';

class MyHomePageController extends GetxController {
  void onFloatingActionButtonPressed() {
    Get.toNamed(CreatePostPage.path);
  }
}
