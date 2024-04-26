import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_sns/core/firestore/col_ref_core.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class QueryCore {
  static MapQuery publicUsersOrderByFollowerCount() =>
      ColRefCore.publicUsersColRef().orderBy("followerCount", descending: true);

  static MapQuery postsCollectionQuery() => FirebaseFirestore.instance
      .collectionGroup("posts")
      .orderBy("createdAt", descending: true)
      .limit(10);

  static MapQuery whereInUsersQuery(List<String> uids) =>
      ColRefCore.publicUsersColRef().where('uid', whereIn: uids);

  static MapQuery userPostsQuery(String uid) =>
      ColRefCore.postsColRef(uid).limit(10);
}
