import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
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
  }
}
