import 'package:get/get.dart';
import 'package:text_sns/view/pages/account_page.dart';
import 'package:text_sns/view/pages/create_post_page.dart';
import 'package:text_sns/view/pages/logouted_page.dart';
import 'package:text_sns/view/pages/profile_page.dart';
import 'package:text_sns/view/pages/reauthenticate_page.dart';
import 'package:text_sns/view/pages/update_email_page.dart';
import 'package:text_sns/view/pages/update_password_page.dart';
import 'package:text_sns/view/pages/user_deleted_page.dart';

class GetPages {
  static List<GetPage> value = [
    GetPage(name: AccountPage.path, page: () => const AccountPage()),
    GetPage(name: LogoutedPage.path, page: () => const LogoutedPage()),
    GetPage(name: UpdateEmailPage.path, page: () => const UpdateEmailPage()),
    GetPage(
        name: ReauthenticatePage.path, page: () => const ReauthenticatePage()),
    GetPage(
        name: UpdatePasswordPage.path, page: () => const UpdatePasswordPage()),
    GetPage(name: UserDeletedPage.path, page: () => const UserDeletedPage()),
    GetPage(name: CreatePostPage.path, page: () => const CreatePostPage()),
    GetPage(name: ProfilePage.path, page: () => const ProfilePage())
  ];
}
