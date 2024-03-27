import 'package:fluttertoast/fluttertoast.dart';

class UIHelper {
  static Future<void> showFlutterToast(String msg) async {
    await Fluttertoast.showToast(msg: msg);
  }
}
