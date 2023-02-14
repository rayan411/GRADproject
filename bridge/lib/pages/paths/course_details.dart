import 'package:bridge/appData/app_data.dart';
import 'package:bridge/models/courses.dart';
import 'package:bridge/widgets/Buttons/hyperlinkButton.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';
import '../../services/courseService.dart';
import '../../widgets/Cards/headerOfContent.dart';

class Course_details extends StatefulWidget {
  //screenRoute------------------------------
  static const screenRoute = '/Course-details';

  @override
  State<Course_details> createState() => _Course_detailsState();
}

class _Course_detailsState extends State<Course_details> {
  // void _handleTap() {

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic?>;

    final courseID = routeArgument['id'];
    final name = routeArgument['name'];
    final description = routeArgument['description'];
    final link = routeArgument['link'];
    final pathId = routeArgument['pathId'];
    var isDone = routeArgument['isDone'];
    final filterdSubCourse =
        Provider.of<AppData>(context).subCourse_data.where((course) {
      return course.Course.contains(courseID);
    }).toList();

    //late bool isDonee =isDone as bool;
    void doneCourse() {
      setState(() {
        isDone = !isDone;
      });

      final docCourse = FirebaseFirestore.instance
          .collection('Paths')
          .doc(pathId)
          .collection('course')
          .doc(courseID);
      docCourse.update({
        'isDone': isDone,
      });
    
    }


      // Final d= Provider.of<AppData>(context, listen: false).Course_data[index].isDone;
    return Scaffold(
      //bottom-Bar------------------------------------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: 
        (){
          setState(() {
            
          doneCourse();
          });
        },
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            child: Container(
              height: 32,
              width: 100,
              color: isDone
                  ? ColorBox.Color50
                  :ColorSelect.Color1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done,
                    color: ColorSelect.Color5,
                  ),
                  Text(isDone ? 'Mark as pending' : 'Mark as done!',
                      style: TextStyle(
                        color: ColorSelect.Color5,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      //app-Bar-------------------------------------------------------

      body: Column(children: [
        SizedBox(
          height: 16,
        ),
        //Header-------------------------------------------------------

        HeaderOfContent(nameOfContent: name, DescriptioContent: description),

        //center-------------------------------------------------------

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Visit the following resources to learn :",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 35.0,
              maxHeight: 48,
              maxWidth: 327,
              minWidth: 2,
            ),
            child: StreamBuilder<List<SourceOfCourse>>(
              stream: readSourceCourse(pathId, courseID),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (snapshot.hasData) {
                  final pathsData = snapshot.data!;
                  return ListView(
                    children: pathsData.map(buildSourc).toList(),
                  );
                  //  return usersingle==null
                  //? Center(child: Text('no user'),)
                  //:buildPaths(usersingle);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ]),
    );
  }
}

Widget buildSourc(SourceOfCourse sourceOfCourse) => Link(
    target: LinkTarget.blank,
    uri: Uri.parse(sourceOfCourse.link),
    builder: (context, follwlink) => hyperlinkbutton(
          name: sourceOfCourse.name,
          onPress: follwlink,
          id: sourceOfCourse.id,
          link: sourceOfCourse.link,
        ));


            //     ListView.builder(
            //   itemCount:filterdSubCourse.length,
            //   itemBuilder: ( ctx , index) 
            //   {
            //     return Link(
            // target: LinkTarget.blank,
            // uri: Uri.parse(filterdSubCourse[index].link),
            // builder: (context, follwlink) => hyperlinkbutton (
            //       name: filterdSubCourse[index].name,
            //       onPress: follwlink,
            //       id:filterdSubCourse[index].id ,
            //       link: filterdSubCourse[index].link,
            //     )
            //     );
            //   },
            //   )