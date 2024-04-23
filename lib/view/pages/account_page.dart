import 'package:flutter/material.dart';
import 'package:text_sns/view/common/basic_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static const path = "/account";
  @override
  Widget build(BuildContext context) {
    return const BasicPage(
        appBarTitle: "AccountPage",
        child: Align(
            alignment: Alignment.center,
            child: Text("Information of an account")));
  }
}
