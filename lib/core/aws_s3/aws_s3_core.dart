import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:minio_new/minio.dart';
import 'package:text_sns/enums/env_key.dart';

class AWSS3Core {
  static const String _endPoint = "s3-ap-northeast-1.amazonaws.com";
  static const String _region = "ap-northeast-1";
  static String _accessKey() => dotenv.get(EnvKey.AWS_ACCESS_KEY.name);
  static String _secretKey() => dotenv.get(EnvKey.AWS_SECRET_ACCESS_KEY.name);

  static final minio = Minio(
      endPoint: _endPoint,
      region: _region,
      accessKey: _accessKey(),
      secretKey: _secretKey());
}
