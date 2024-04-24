import 'package:text_sns/controllers/abstract/simple_form_controller.dart';

class ReauthenticateController extends SimpleFormController {
  @override
  String get title => "Reauthenticate";
  @override
  String get hintText => "Password";
  @override
  String get validatorMsg => "Please enter valid password";
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
    if (text.length < 8) return;
  }
}
