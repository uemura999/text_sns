import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class UpdateEmailController extends SimpleFormController {
  @override
  String get title => "Update";
  @override
  String get hintText => "New mail address";
  @override
  String get validatorMsg => "Please enter valid mail address";
  @override
  String get positiveButtonText => "Receive Emails";
  @override
  String get successMsg => "Update email successfully";
  @override
  String get failureMsg => "Failed to update email";

  @override
  void onPositiveButtonPressed() async {
    final repository = AuthRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null || !GetUtils.isEmail(text)) return;
    final result = await repository.verifyBeforeUpdateEmail(user, text);
    result.when(success: (_) {
      UIHelper.showFlutterToast(successMsg);
      Get.back();
      Get.back(); // 2
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
