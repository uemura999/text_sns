import 'package:flutter/material.dart';
import 'package:text_sns/constant/account_constant.dart';
import 'package:text_sns/view/common/basic_page.dart';

class LogoutedPage extends StatelessWidget {
  const LogoutedPage({super.key});
  static const path = "/logouted";
  @override
  Widget build(BuildContext context) {
    return const BasicPage(
        child: Align(
      alignment: Alignment.center,
      child: Text(
        AccountConstant.logoutedPageMsg,
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    ));
  }
}
