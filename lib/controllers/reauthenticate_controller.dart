import 'package:get/get.dart';
import 'package:text_sns/controllers/abstract/simple_form_controller.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/enums/reauthenticate_purpose.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/ui_core/validator_core.dart';
import 'package:text_sns/view/pages/reauthenticate_page.dart';
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
      const key = ReauthenticatePage.purposeKey;
      final purpose = Get.parameters[key];
      if (purpose == null) return;
      final enumPurpose = ReauthenticatePurpose.values.byName(purpose);
      //"updateEmail"が渡されたら ReauthenticatePurpose.updateEmail
      switch (enumPurpose) {
        case ReauthenticatePurpose.updateEmail:
          Get.toNamed(UpdateEmailPage.path);
          break;
        case ReauthenticatePurpose.updatePassword:
          //TODO:パスワードを変更するページに遷移
          break;
        case ReauthenticatePurpose.deleteUser:
          //TODO: ユーザーを削除する処理
          break;
      }
      UIHelper.showFlutterToast(successMsg);
    }, failure: () {
      UIHelper.showFlutterToast(failureMsg);
    });
  }
}
