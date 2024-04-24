import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:text_sns/constant/auth_constant.dart';
import 'package:text_sns/controllers/main_controller.dart';
import 'package:text_sns/core/firestore/doc_ref_core.dart';
import 'package:text_sns/enums/reauthenticate_purpose.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/repository/auth_repository.dart';
import 'package:text_sns/repository/aws_s3_repository.dart';
import 'package:text_sns/repository/firestore_repository.dart';
import 'package:text_sns/ui_core/dialog_core.dart';
import 'package:text_sns/ui_core/ui_helper.dart';
import 'package:text_sns/view/pages/logouted_page.dart';
import 'package:text_sns/view/pages/reauthenticate_page.dart';
import 'package:text_sns/view/pages/user_deleted_page.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find<AuthController>();
  final rxAuthUser = Rx<User?>(FirebaseAuth.instance.currentUser);
  final rxIsLoginMode = true.obs;
  String email = '';
  String password = '';

  void setEmail(String? value) {
    if (value == null) return;
    email = value;
  }

  void setPassword(String? value) {
    if (value == null) return;
    password = value;
  }

  void onPositiveButtonPressed() async {
    if (GetUtils.isEmail(email.trim()) && password.trim().length > 7) {
      rxIsLoginMode.value
          ? await _signInWithEmailAndPassword()
          : await _createUserWithEmailAndPassword();
    }
  }

  Future<void> _createUserWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.createUserWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(success: (res) {
      rxAuthUser.value = res;
      UIHelper.showFlutterToast(AuthConstant.signupSuccessMsg);
    }, failure: () {
      UIHelper.showFlutterToast(AuthConstant.signupFailureMsg);
    });
  }

  Future<void> _signInWithEmailAndPassword() async {
    final repository = AuthRepository();
    final result = await repository.signInWithEmailAndPassword(
        email.trim(), password.trim());
    result.when(success: (res) {
      rxAuthUser.value = res;
      UIHelper.showFlutterToast(AuthConstant.loginSuccessMsg);
    }, failure: () {
      UIHelper.showFlutterToast(AuthConstant.loginFailureMsg);
    });
  }

  void onSignOutButtonPressed() async {
    DialogCore.cupertinoAlertDialog(
        AuthConstant.confirmLogoutContent, AuthConstant.confirmLogoutTitle,
        () async {
      await _signOut();
    });
  }

  Future<void> _signOut() async {
    final repository = AuthRepository();
    final result = await repository.signOut();
    result.when(success: (_) {
      Get.toNamed(LogoutedPage.path);
      UIHelper.showFlutterToast(AuthConstant.signoutSuccessMsg);
    }, failure: () {
      UIHelper.showFlutterToast(AuthConstant.signoutFailureMsg);
    });
  }

  void _toggleIsLoginMode() => rxIsLoginMode.value = !rxIsLoginMode.value;
  void onToggleIsLoginModeButtonPressed() => _toggleIsLoginMode();

  void onEditEmailButtonPressed() {
    final String purpose = ReauthenticatePurpose.updateEmail.name;
    final String path = ReauthenticatePage.generatePath(purpose);
    Get.toNamed(path);
  }

  void onUpdatePasswordTileTapped() {
    final String purpose = ReauthenticatePurpose.updatePassword.name;
    final String path = ReauthenticatePage.generatePath(purpose);
    Get.toNamed(path);
  }

  void onDeleteUserTileTapped() {
    final String purpose = ReauthenticatePurpose.deleteUser.name;
    final String path = ReauthenticatePage.generatePath(purpose);
    Get.toNamed(path);
  }

  Future<void> deleteUser() async {
    final authUser = rxAuthUser.value;
    final publicUser = MainController.to.rxPublicUser.value;
    if (authUser == null || publicUser == null) return;
    final uid = authUser.uid;
    final firestoreRepository = FirestoreRepository();
    final ref = DocRefCore.publicUserDocRef(uid);
    final result = await firestoreRepository.deleteDoc(ref);
    result.when(success: (res) {
      UIHelper.showFlutterToast("Success to delete user");
      //FirebaseAuthのユーザーを削除
      _deleteAuthUser(authUser);
      //AWSのS3の画像を削除
      _removeObject(publicUser);
      Get.toNamed(UserDeletedPage.path);
    }, failure: () {
      UIHelper.showFlutterToast("Failed to delete user");
    });
  }

  Future<void> _deleteAuthUser(User user) async {
    final repository = AuthRepository();
    await repository.delete(user);
  }

  Future<void> _removeObject(PublicUser publicUser) async {
    final repository = AWSS3Repository();
    final image = publicUser.typedImage;
    final String bucket = image.bucketName;
    final String object = image.fileName;
    await repository.removeObject(bucket, object);
  }
}
