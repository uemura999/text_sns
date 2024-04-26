import 'package:text_sns/controllers/abstract/post_controller.dart';
import 'package:text_sns/core/firestore/query_core.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class LatestPostsController extends PostController {
  @override
  MapQuery get query => QueryCore.postsCollectionQuery();
}
