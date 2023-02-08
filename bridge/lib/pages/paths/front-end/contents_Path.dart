import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/Buttons/buttonOfPath.dart';
import '../../../widgets/Cards/headerPath.dart';
import 'package:bridge/appData/app_data.dart';

class Contents_Path_page extends StatelessWidget {
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
      return course.Psths.contains(pathId);
    }).toList();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
        //start page----------------------------------------------------------
           
            //headr-------------------------------------------------------
            HeaderOfPath(
              nameOfPath: name ?? "Not Assigned",
              DescriptioPath: description,
            ),
            //Center-------------------------------------------------------
            Text(
              'Roadmap to become $name!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 35.0,
                    maxHeight: 48,
                    maxWidth: 327,
                    minWidth: 2,
                  ),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) {
                      return ButtonOfPath(
                        id: filterdCourse[index].id,
                        name: filterdCourse[index].name,
                        description: filterdCourse[index].description,
                        isDone: filterdCourse[index].isDone,
                      );
                    },
                    itemCount: filterdCourse.length,
                  )),
            ),
            //end page{bottom now i am  developer }------------------------------------------------
            InkWell(
              onTap: (() {
                Provider.of<AppData>(context, listen: false)
                    .mangeComoletePath(pathId!);
              }),
              child: Container(
                  height: 48,
                  width: 327,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: ColorBox.Color50,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Provider.of<AppData>(context, listen: false)
                                      .isComplete(
                                          pathId!) // return true if "id" Is it in the favorites list
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              color: ColorSelect.Color1,
                            ),
                            Text('Now, I am $name',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]))),
            ),
            SizedBox(
              height: 8,
            )
            //=====
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Provider.of<AppData>(context, listen: false).isLearned(
                      pathId) // return true if "id" Is it in the favorites list
                  ? Icons.delete
                  : Icons.add,
            ),
            onPressed: () => Provider.of<AppData>(context, listen: false)
                .mangeLearn(pathId)),
      ),
    );
  }
}
