import 'dart:typed_data';

import 'package:text_sns/infrastructure/aws_s3/aws_s3_client.dart';
import 'package:text_sns/models/result/result.dart';
import 'package:text_sns/typedefs/result_typedef.dart';

class AWSS3Repository {
  FutureResult<Uint8List> getObject(String bucket, String object) async {
    final client = AWSS3Client();
    try {
      final stream = await client.getObject(bucket, object);
      List<int> memory = [];
      await for (var value in stream) {
        memory.addAll(value);
      }
      final result = Uint8List.fromList(memory);
      return Result.success(result);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> putObject(
      String bucket, String object, Stream<Uint8List> data) async {
    final client = AWSS3Client();
    try {
      await client.putObject(bucket, object, data);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }

  FutureResult<bool> removeObject(String bucket, String object) async {
    final client = AWSS3Client();
    try {
      await client.removeObject(bucket, object);
      return const Result.success(true);
    } catch (e) {
      return const Result.failure();
    }
  }
}
