import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  const BasicPage({super.key, required this.appBarTitle, required this.child});
  final String appBarTitle;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    ));
  }
}
