import 'dart:io';

import 'package:bridge/models/courses.dart';
import 'package:bridge/models/paths.dart';
import 'package:bridge/widgets/Buttons/buttonOfPath.dart';
import 'package:bridge/widgets/cards/cardOfPath.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/link.dart';

import '../services/courseService.dart';
import '../services/pathServices.dart';
import '../widgets/Buttons/hyperlinkButton.dart';
import '../widgets/cards/cardLearn.dart';

class testat extends StatefulWidget {
  const testat({Key? key}) : super(key: key);

  @override
  State<testat> createState() => _testatState();
}

class _testatState extends State<testat> {
  getdata()async{
CollectionReference pathrefe=  FirebaseFirestore.instance.collection('Paths');
await pathrefe.where('isLearn', isEqualTo: true).get().then((value) => value.docs.forEach((element) {
  print(element.data());
  print('============================================================================');
})
);
}

@override
  void initState() {
getdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('klnlknlknlnl'),
      ),
     body:
 StreamBuilder<List<Paths>>(
              stream: readPaths(),
               builder: (context , snapshot) {
             if(snapshot.hasError){
              return Text('has errore');

             }
             else if (snapshot.hasData){
                final pathsData= snapshot.data!;
                return ListView(
                  children: pathsData.map(buildPaths).toList(),
                );
                //  return usersingle==null
                //? Center(child: Text('no user'),)
                //:buildPaths(usersingle);
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
           

          ),
    );
  }
}

Widget buildPaths(Paths user) => Card_inLearn(
      id: user.id,
      name: user.name,
      description: user.description,
      sourceImage: user.sourceImage,
    );

Widget buildCourse(Course course) => ButtonOfPath(
      name: course.name,
      isDone: course.isDone,
      description: course.description,
      id: course.id,
      pathId: course.pathId,
      courseID: course.id,
      Paths: course.Paths,
    );
Widget buildSourc(SourceOfCourse sourceOfCourse)=> Link(
            target: LinkTarget.blank,
            uri: Uri.parse(sourceOfCourse.link),
            builder: (context, follwlink) => hyperlinkbutton (
                  name:sourceOfCourse.name,
                  onPress: follwlink,
                  id:sourceOfCourse.id ,
                  link:sourceOfCourse.link,
                )
                );





           
      //  StreamBuilder<List<Course>>(
      //   stream: readCourse(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasError) {
      //       final error = snapshot.error;
      //       return Text('has errore$error');
      //     } else if (snapshot.hasData) {
      //       final corseData = snapshot.data!;

      //       return ListView(
      //         children: corseData.map(buildCourse).toList(),
      //       );
      //     } else {
      //       return Center(child: CircularProgressIndicator());
      //     }
      //   },
      // ),