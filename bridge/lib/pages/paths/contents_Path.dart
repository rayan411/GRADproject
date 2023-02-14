import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/courses.dart';
import '../../services/courseService.dart';
import '../../widgets/Buttons/buttonOfPath.dart';
import '../../widgets/Cards/headerOfContent.dart';
import '../../widgets/Cards/headerPath.dart';
import 'package:bridge/appData/app_data.dart';

class Content_Path_page extends StatelessWidget {
  static const screanRoute = '/path-course';

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    final pathId = routeArgument['id'];
    final name = routeArgument['name'];
    final description = routeArgument['description'];
    final filterdCourse =
        Provider.of<AppData>(context).Course_data.where((course) {
      return course.Paths.contains(pathId);
    }).toList();
    return Scaffold(
      backgroundColor: ColorSelect.Color1,
      body: Column(
        children: [
          //start page----------------------------------------------------------
          //headr-------------------------------------------------------
          Expanded (
            child: HeaderOfContent(
              nameOfContent: name ?? "Not Assigned",
              DescriptioContent: description,
            ),
          ),
          //Center-------------------------------------------------------

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Roadmap to become $name!',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 19),
                  ),
                  
                  const SizedBox(
                    width: 400,
                  ),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minHeight: 35.0,
                        maxHeight: 48,
                        maxWidth: 327,
                        minWidth: 300,
                      ),
                      child: StreamBuilder<List<Course>>(
                        stream: readCourse(pathId),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            final error = snapshot.error;
                            print(pathId);
                            print(snapshot.error);
                            print('========================================================');

                            return Text('has errore$error');
                          } else if (snapshot.hasData) {
                            final corseData = snapshot.data!;

                            return ListView(
                              children: corseData.map(buildCourse).toList(),
                            );
                          } else {
                            return Center(child: CircularProgressIndicator());
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 48.0,
          child: InkWell(
            onTap: (() {
              Provider.of<AppData>(context, listen: false)
                  .mangeComoletePath(pathId!);
            }),
            child: Container(
                decoration: BoxDecoration(
                    color: Provider.of<AppData>(context, listen: false).isComplete(
                            pathId!) // return true if "id" Is it in the favorites list
                        ? ColorBox.Color50
                        : ColorSelect.Color1),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Provider.of<AppData>(context, listen: false).isComplete(
                                    pathId) // return true if "id" Is it in the favorites list
                                ? Icons.star
                                : Icons.star_border_outlined,
                            color: Provider.of<AppData>(context, listen: false)
                                    .isComplete(
                                        pathId) // return true if "id" Is it in the favorites list
                                ? ColorSelect.Color1
                                : ColorBox.Color50,
                            size: 32,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text('Now, I am $name',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ]))),
          ),
        ),
      ),
    );
  }
}

Widget buildCourse(Course course) => ButtonOfPath(
    name: course.name,
    isDone: course.isDone,
    description: course.description,
    id: course.id,
    pathId: course.pathId,
    courseID: course.id,
    Paths: course.Paths);
                        // ListView.builder(
                        //   itemBuilder: (ctx, index) {
                        //     return ButtonOfPath(
                        //       id: filterdCourse[index].id,
                        //       name: filterdCourse[index].name,
                        //       description: filterdCourse[index].description,
                        //       isDone: filterdCourse[index].isDone,
                        //       pathId: filterdCourse[index].pathId,courseID: filterdCourse[index].id,
                        //     );
                        //   },
                        //   itemCount: filterdCourse.length,
                        // )