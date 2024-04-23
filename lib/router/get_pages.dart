import 'package:get/get.dart';
import 'package:text_sns/view/pages/account_page.dart';

class GetPages {
  static List<GetPage> value = [
    GetPage(name: AccountPage.path, page: () => const AccountPage())
  ];
}
