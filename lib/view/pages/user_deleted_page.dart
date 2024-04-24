import 'package:flutter/material.dart';
import 'package:text_sns/constant/account_constant.dart';
import 'package:text_sns/view/common/basic_page.dart';

class UserDeletedPage extends StatelessWidget {
  const UserDeletedPage({super.key});
  static const path = "/userDeleted";
  @override
  Widget build(BuildContext context) {
    return const BasicPage(
        child: Align(
            alignment: Alignment.center,
            child: Text(
              AccountConstant.userDeletedPageTitle,
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            )));
  }
}
