import 'dart:typed_data';

import 'package:minio_new/minio.dart';
import 'package:text_sns/core/aws_s3/aws_s3_core.dart';

class AWSS3Client {
  Future<MinioByteStream> getObject(String bucket, String object) async {
    final stream = await AWSS3Core.minio.getObject(bucket, object);
    return stream;
  }

  Future<void> putObject(
      String bucket, String object, Stream<Uint8List> data) async {
    await AWSS3Core.minio.putObject(bucket, object, data);
  }

  Future<void> removeObject(String bucket, String object) async {
    await AWSS3Core.minio.removeObject(bucket, object);
  }
}
