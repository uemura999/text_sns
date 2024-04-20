import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:text_sns/constant/image_constant.dart';
import 'package:text_sns/repository/aws_s3_repository.dart';
import 'package:text_sns/ui_core/ui_helper.dart';

class ImageController extends GetxController {
  final rxUint8list = Rx<Uint8List?>(null);
  Future<void> getObject(String bucket, String object) async {
    final repository = AWSS3Repository();
    final result = await repository.getObject(bucket, object);
    result.when(success: (res) {
      rxUint8list.value = res;
    }, failure: () {
      UIHelper.showFlutterToast(ImageConstant.getObjectFailureMsg);
    });
  }
}
