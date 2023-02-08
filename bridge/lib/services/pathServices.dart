import 'package:bridge/models/paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Stream<List<Paths>> readPaths()=> FirebaseFirestore.instance
.collection('Paths')
.snapshots()
.map((snapshot) => 
      snapshot.docs.map((doc) =>Paths.fromjson(doc.data())).toList())
;