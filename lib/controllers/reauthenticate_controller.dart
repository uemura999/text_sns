import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/ui_core/validator_core.dart';
import 'package:text_sns/view/pages/update_email_page.dart';

class ReauthenticateController extends SimpleFormController {
  @override
  String get title => "Reauthenticate";
  @override
  String get hintText => "Password";
  @override
  String? Function(String?)? get validator => ValidatorCore.password;
  @override
  String get positiveButtonText => "Send";
  @override
  String get successMsg => "Successfully reauthenticate";
  @override
  String get failureMsg => "Failed to reauthenticate";
  @override
  bool get obscureText => true;

  @override
  void onPositiveButtonPressed() async {
    if (!ValidatorCore.isValidPassword(text)) return;
    final repository = AuthRepository();
    final user = AuthController.to.rxAuthUser.value;
    if (user == null) return;
    final result = await repository.reauthenticateWithCredential(user, text);
    result.when(success: (_) {
      final purpose = Get.parameters['purpose'];
      if (purpose == "updateEmail") {
        Get.toNamed(UpdateEmailPage.path);
      }
      UIHelper.showFlutterToast(successMsg);
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
