import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:text_sns/constant/verify_email_constant.dart';
import 'package:text_sns/controllers/auth_controller.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class VerifyEmailController extends GetxController {
  Timer? timer;
  @override
  void onInit() async {
    final user = AuthController.to.rxAuthUser.value;
    if (user == null) return;
    await _sendEmailVerification(user);
    super.onInit();
  }

  Future<void> _sendEmailVerification(User user) async {
    final repository = AuthRepository();
    final result = await repository.sendEmailVerification(user);
    result.when(success: (_) {
      _startTimer(user);
      UIHelper.showFlutterToast(VerifyEmailConstant.sentVerificationEmailMsg);
    }, failure: () {
      UIHelper.showFlutterToast(
          VerifyEmailConstant.failedToSendVerificationEmailMsg);
    });
  }

  void _startTimer(User user) {
    timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      //1秒ごとに行いたい処理
      await user.reload(); //メールが検証されたかどうかを確認するためにリロード
      final newUser = FirebaseAuth.instance.currentUser;
      if (newUser!.emailVerified) {
        AuthController.to.rxAuthUser.value = newUser;
        timer?.cancel();
      }
    });
  }
}
