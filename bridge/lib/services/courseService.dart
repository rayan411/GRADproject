import 'package:bridge/models/courses.dart';
import 'package:bridge/models/paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future creatCourse(Course course) async {
    // Reference to documnt in firebase
    final docCourse = FirebaseFirestore.instance.collection('Paths').doc(course.pathId).collection('course').doc(course.id);
  //  path.id = docPath.id;
    final json = course.toJson();
    //creat document and writer data to firebase
    await docCourse.set(json);
  }





Stream<List<Course>> readCourse(course)=> FirebaseFirestore.instance
.collection('Paths').doc(course).collection('course').snapshots()
.map((snapshot) => 
      snapshot.docs.map((doc) =>Course.fromjson(doc.data())).toList())
;

//-----------------------------------------------                    Source Of Course                      ------------------------------------------------------------


Future creatSourceCourse(SourceOfCourse SourceOfCourse) async {
    // Reference to documnt in firebase
    final docCourse = FirebaseFirestore.instance.collection('Paths').doc(SourceOfCourse.pathId).collection('course').doc(SourceOfCourse.courseId).collection("Source Of Course").doc(SourceOfCourse.id);
  //  path.id = docPath.id;
    final json = SourceOfCourse.toJsonCustom();
    //creat document and writer data to firebase
    await docCourse.set(json);
  }

Stream<List<SourceOfCourse>> readSourceCourse(pathId ,courseId)=> FirebaseFirestore.instance
.collection('Paths').doc(pathId).collection('course').doc(courseId).collection("Source Of Course")
.snapshots()
.map((snapshot) => 
      snapshot.docs.map((doc) =>SourceOfCourse.fromjson(doc.data())).toList())
;