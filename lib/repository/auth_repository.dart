import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:text_sns/infrastructure/auth/auth_client.dart';
import 'package:text_sns/models/result/result.dart';
import 'package:text_sns/typedefs/result_typedef.dart';

class AuthRepository {
  FutureResult<User> createUserWithEmailAndPassword(
      String email, String password) async {
    final client = AuthClient();
    try {
      final res = await client.createUserWithEmailAndPassword(email, password);
      final user = res.user;
      return (user == null) ? const Result.failure() : Result.success(user);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }

  FutureResult<User> signInWithEmailAndPassword(
      String email, String password) async {
    final client = AuthClient();
    try {
      final res = await client.signInWithEmailAndPassword(email, password);
      final user = res.user;
      return (user == null) ? const Result.failure() : Result.success(user);
    } catch (e) {
      debugPrint(e.toString());
      return const Result.failure();
    }
  }
}
