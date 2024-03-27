import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:text_sns/typedefs/firestore_typedef.dart';

class ColRefCore {
  static ColRef publicUsersColRef() =>
      FirebaseFirestore.instance.collection('public_users');
}
