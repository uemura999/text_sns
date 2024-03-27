import 'package:text_sns/core/firestore/col_ref_core.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class DocRefCore {
  static DocRef publicUserDocRef(String uid) =>
      ColRefCore.publicUsersColRef().doc(uid);
}
