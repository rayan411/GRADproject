import 'package:bridge/appData/app_data.dart';
import 'package:bridge/models/courses.dart';
import 'package:bridge/pages/paths/front-end/contents_Path.dart';
import 'package:bridge/widgets/Buttons/hyperlinkButton.dart';
import 'package:bridge/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/link.dart';
import '../../../widgets/Cards/headerOfContent.dart';
import 'package:bridge/models/courses.dart';

class Course_details extends StatefulWidget {
  //screenRoute------------------------------
  static const screenRoute = '/Course-details';

  @override
  State<Course_details> createState() => _Course_detailsState();
}

class _Course_detailsState extends State<Course_details> {
  bool _active = true;
  // void _handleTap() {

  void _handleTap() {
    setState(() {
      _active = !_active;
    });}
  @override
  Widget build(BuildContext context) {
  //varible to get data-------------------------------------
    // final pathId= 
    //     ModalRoute.of(context)!.settings.arguments as Map<String, String?>;
    // final selectedCourse = 
    //   subCourse_data.firstWhere(((subCourse_data) =>subCourse_data.id == pathId));  //true or false for check
    // final  = routeArgument['id'];

     final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    final courseID = routeArgument['id'];
    final name = routeArgument['name'];
    final description = routeArgument['description'];
    final link = routeArgument['link'];
    final filterdSubCourse = Provider.of<AppData>(context).subCourse_data.where((course) {
      return course.Course.contains(courseID);
    }).toList();

    return Scaffold(
      //bottom-Bar------------------------------------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: _handleTap,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            child: Container(
              height: 32,
              width: 100,
              color: _active
                  ? Colors.lightGreen[700]
                  : Color.fromARGB(255, 203, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done,
                    color: ColorSelect.Color5,
                  ),
                  Text(_active ? 'Mark as done!' : 'Mark as pending',
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
      appBar: AppBar(
        backgroundColor: ColorBox.Color50,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
      ),

      body: Column(children: [
        //Header-------------------------------------------------------

         HeaderOfContent(
            nameOfContent: name,
            DescriptioContent:description
                ),

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
                child: 
                ListView.builder(
              itemCount:filterdSubCourse.length,
              itemBuilder: ( ctx , index) 
              {
                return Link(
            target: LinkTarget.blank,
            uri: Uri.parse(filterdSubCourse[index].link),
            builder: (context, follwlink) => hyperlinkbutton (
                  name: filterdSubCourse[index].name,
                  onPress: follwlink,
                  id:filterdSubCourse[index].id ,
                  link: filterdSubCourse[index].link,
                )
                );
              },
              )
              ),
            ),
      ]),
    );



  }
}
        // return Center(child: Text('this is $pathId'),);

        // Link(
        //     target: LinkTarget.blank,
        //     uri: Uri.parse("https://www.w3schools.com/html/html_intro.asp"),
        //     builder: (context, follwlink) => hyperlinkbutton(
        //           enterText: "w3schools",
        //           onPress: follwlink,
        //         )),
        // SizedBox(
        //   height: 8,
        // ),

        // Link(
        //     target: LinkThyperlinkbuttonarget.blank,
        //     uri: Uri.parse("https://www.codecademy.com/learn/learn-html"),
        //     builder: (context, follwlink) => (
        //           enterText: "codecademy",
        //           onPress: follwlink,
        //         )),
        // SizedBox(
        //   height: 8,
        // ),
        // Link(
        //     target: LinkTarget.blank,
        //     uri: Uri.parse("https://htmlreference.io/"),
        //     builder: (context, follwlink) => hyperlinkbutton(
        //           enterText: "htmlreference",
        //           onPress: follwlink,
        //         )),