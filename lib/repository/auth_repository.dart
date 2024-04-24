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

  FutureResult<bool> signOut() async {
    final client = AuthClient();
    try {
      await client.signOut();
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> sendEmailVerification(User user) async {
    final client = AuthClient();
    try {
      await client.sendEmailVerification(user);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> reauthenticateWithCredential(
      User user, String password) async {
    final client = AuthClient();
    try {
      await client.reauthenticateWithCredential(user, password);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> verifyBeforeUpdateEmail(User user, String newEmail) async {
    final client = AuthClient();
    try {
      await client.verifyBeforeUpdateEmail(user, newEmail);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }
}
