import 'package:cloud_firestore/cloud_firestore.dart';

typedef SDMap = Map<String, dynamic>;
typedef QSnapshot = QuerySnapshot<SDMap>; // QuerySnapshot<Map<String, dynamic>>
typedef MapQuery = Query<SDMap>; // Query<Map<String, dynamic>>
typedef QDoc = QueryDocumentSnapshot<
    SDMap>; // QueryDocumentSnapshot<Map<String, dynamic>>
typedef Doc = DocumentSnapshot<SDMap>; // DocumentSnapshot<Map<String, dynamic>>

typedef FutureQSnapshot
    = Future<QSnapshot>; // Future<QuerySnapshot<Map<String, dynamic>>>
typedef FutureDoc
    = Future<Doc>; // Future<DocumentSnapshot<Map<String, dynamic>>>

typedef DocRef
    = DocumentReference<SDMap>; // DocumentReference<Map<String, dynamic>>
typedef ColRef
    = CollectionReference<SDMap>; // CollectionReference<Map<String, dynamic>>
