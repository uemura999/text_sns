import 'package:text_sns/core/firestore/col_ref_core.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class QueryCore {
  static MapQuery publicUsersOrderByFollowerCount() =>
      ColRefCore.publicUsersColRef().orderBy("followerCount", descending: true);
}
