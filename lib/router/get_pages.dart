import 'package:get/get.dart';
import 'package:text_sns/view/pages/account_page.dart';
import 'package:text_sns/view/pages/logouted_page.dart';

class GetPages {
  static List<GetPage> value = [
    GetPage(name: AccountPage.path, page: () => const AccountPage()),
    GetPage(name: LogoutedPage.path, page: () => const LogoutedPage())
  ];
}
