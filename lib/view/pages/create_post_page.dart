import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/create_post_controller.dart';
import 'package:text_sns/view/abstract/simple_form_state.dart';
import 'package:text_sns/view/common/basic_page.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({super.key});
  static const path = "/createPost";
  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends SimpleFormState<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreatePostController());
    return BasicPage(
        appBarTitle: "Create post", child: buildWidget(controller));
  }
}
