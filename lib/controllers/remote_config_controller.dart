import 'package:get/get.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:text_sns/constant/remote_config_constant.dart';

class RemoteConfigController extends GetxController {
  final rxIsMaintenanceMode = false.obs;
  @override
  void onInit() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    //オブジェクトをサーバーから取得
    final remoteConfigSettings = RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(minutes: 15));
    await remoteConfig.setConfigSettings(remoteConfigSettings);
    const key = RemoteConfigConstant.maintenanceModeKey;
    //アプリ内で使用するデフォルトの値を設定
    await remoteConfig.setDefaults({
      key: false, //maintenance_mode: false,
    });
    //値を取得
    await remoteConfig.fetchAndActivate();
    rxIsMaintenanceMode.value = remoteConfig.getBool(key);
    super.onInit();
  }
}
