import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:text_sns/models/public_user/public_user.dart';
import '../flavors.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final firstUserDoc = await FirebaseFirestore.instance
                .collection('public_users')
                .doc("first")
                .get();

            final firstUserJson = firstUserDoc.data();
            if (firstUserJson == null) {
              debugPrint("The first user is null");
              return;
            } else {
              final firstUser = PublicUser.fromJson(firstUserJson);
              debugPrint("UserId: ${firstUser.uid}");
            }

            debugPrint("Successfully fetched data");
          } catch (e) {
            debugPrint("The access was denied: $e");
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          'Hello ${F.title}',
        ),
      ),
    );
  }
}
