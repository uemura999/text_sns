import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:text_sns/controllers/edit_controller.dart';
import 'package:text_sns/view/abstract/simple_form_state.dart';
import 'package:text_sns/view/common/byte_image.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends SimpleFormState<EditScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditController());
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        titleWidget(controller),
        form(controller),
        positiveButton(controller),
        _image()
      ],
    );
  }

  //画像を選択するアイコン
  Widget _image() {
    return Obx(() {
      final uint8list = EditController.to.rxUint8list.value;
      return uint8list == null
          ? InkWell(
              onTap: EditController.to.onImageIconTapped,
              child: const Icon(
                Icons.image,
                size: 60.0,
              ),
            )
          : InkWell(
              onTap: EditController.to.onImageIconTapped,
              child: ByteImage(bytes: uint8list));
    });
  }
}
