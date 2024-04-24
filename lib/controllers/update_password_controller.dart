import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/ui_core/validator_core.dart';

class UpdatePasswordController extends SimpleFormController {
  @override
  String get title => "Update password";
  @override
  String get hintText => "New password";
  @override
  String? Function(String?)? get validator => ValidatorCore.password;
  @override
  String get positiveButtonText => "Update";
  @override
  String get successMsg => "Successfully update password";
  @override
  String get failureMsg => "Failed to update password";
  @override
  bool get obscureText => true;

  @override
  void onPositiveButtonPressed() async {
    if (!ValidatorCore.isValidPassword(text)) return;
    final repository = AuthRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null) return;
    final result = await repository.updatePassword(user, text);
    result.when(success: (_) {
      UIHelper.showFlutterToast(successMsg);
      Get.back();
      Get.back();
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
