import 'package:bridge/models/paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future creatPath(Paths path) async {
    // Reference to documnt in firebase
    final docPath = FirebaseFirestore.instance.collection('Paths').doc(path.id);
  //  path.id = docPath.id;
    final json = path.toJson();
    //creat document and writer data to firebase
    await docPath.set(json);
  }





Stream<List<Paths>> readPaths()=> FirebaseFirestore.instance
.collection('Paths')
.snapshots()
.map((snapshot) => 
      snapshot.docs.map((doc) =>Paths.fromjson(doc.data())).toList())
;






