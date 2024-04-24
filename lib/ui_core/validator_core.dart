import 'package:get/get.dart';
import 'package:text_sns/constant/validator_constant.dart';

class ValidatorCore {
  static bool isValidEmail(String email) => GetUtils.isEmail(email);
  static bool isValidPassword(String password) =>
      password.length >= ValidatorConstant.minPasswordLength;
  static bool isValidText(String text) => text.isNotEmpty;
  static String? email(String? value) {
    return isValidEmail(value!) ? null : "Please enter valid email";
  }

  static String? password(String? value) {
    const minPasswordLength = ValidatorConstant.minPasswordLength;
    return isValidPassword(value!)
        ? null
        : "Please enter password at least $minPasswordLength characters";
  }

  static String? text(String? value) {
    return isValidText(value!) ? null : "Please enter valid text";
  }
}
