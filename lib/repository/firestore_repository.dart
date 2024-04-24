import 'package:text_sns/infrastructure/firestore/firestore_client.dart';
import 'package:text_sns/models/result/result.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/typedefs/result_typedef.dart';

class FirestoreRepository {
  FutureResult<bool> createDoc(DocRef ref, SDMap data) async {
    final client = FirestoreClient();
    try {
      await client.createDoc(ref, data);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> updateDoc(DocRef ref, SDMap data) async {
    final client = FirestoreClient();
    try {
      await client.updateDoc(ref, data);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> deleteDoc(DocRef ref) async {
    final client = FirestoreClient();
    try {
      await client.deleteDoc(ref);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<Doc> getDoc(DocRef ref) async {
    final client = FirestoreClient();
    try {
      final Doc doc = await client.getDoc(ref);
      return Result.success(doc);
    } catch (e) {
      return const Result.failure();
    }
  }
}
