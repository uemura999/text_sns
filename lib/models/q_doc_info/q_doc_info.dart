import 'dart:typed_data';

import 'package:text_sns/models/public_user/public_user.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class QDocInfo {
  const QDocInfo(
      {required this.publicUser,
      required this.userImage,
      required this.postDoc});
  final PublicUser? publicUser;
  final Uint8List? userImage;
  final QDoc postDoc;
}
