import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:text_sns/controllers/profile_controller.dart';
import 'package:text_sns/view/common/basic_page.dart';
import 'package:get/get.dart';
import 'package:text_sns/view/common/byte_image.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});
  static const uidKey = "uid";
  static const path = "/profile/:$uidKey";
  static String generatePath(String uid) => "/profile/$uid";
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    useEffect(() {
      controller.init();
      return;
    }, []);
    const style = TextStyle(fontSize: 30.0);
    return BasicPage(
        appBarTitle: "Profile",
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Obx(
                () => Text(
                  controller.rxPublicUser.value?.name ?? "Null",
                  style: style,
                ),
              ),
              const SizedBox(height: 20.0),
              Obx(
                () => ByteImage(
                  length: 120.0,
                  bytes: controller.rxUint8list.value,
                ),
              ),
              const SizedBox(height: 20.0),
              Obx(() {
                final publicUser = controller.rxPublicUser.value;
                if (publicUser == null) {
                  return const SizedBox.shrink();
                } else {
                  final data = publicUser.isAppropriate
                      ? "Appropriate"
                      : "Inappropriate";
                  return Text(data, style: style);
                }
              }),
              const SizedBox(height: 20.0),
            ],
          ),
        ));
  }
}
