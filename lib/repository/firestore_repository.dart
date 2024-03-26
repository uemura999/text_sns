import 'package:text_sns/infrastructure/firestore/firestore_client.dart';
import 'package:text_sns/models/result/result.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';
import 'package:text_sns/typedefs/result_typedef.dart';

class FirestoreRepository {
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
