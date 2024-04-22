import 'package:uuid/uuid.dart';

class IDCore {
  static String uuidV4() {
    const uuid = Uuid();
    final result = uuid.v4();
    return result;
  }
}
