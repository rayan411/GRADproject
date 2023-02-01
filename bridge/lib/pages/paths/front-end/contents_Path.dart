import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../../widgets/Buttons/buttonOfPath.dart';
import '../../../widgets/Cards/headerPath.dart';
import 'package:bridge/app_data.dart';

class Contents_Path_page extends StatelessWidget {
  static const screanRoute='/path-course';

  final Function mangeFavorite;
  final Function isFavorite;
  Contents_Path_page( this.mangeFavorite, this.isFavorite);

  //Contents_Path_page();
  //  final String? pathId;
  //  final String? name;
  //  final String? path_Description;
  //  final String? sourceImage;
  //Contents_Path({required this.pathId, required this.name,required this.path_Description, this.sourceImage});
  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)!.settings.arguments as Map<String, String?>;

    final pathId = routeArgument['id'];
    final name = routeArgument['name'];
    final description = routeArgument['description'];
    final filterdCourse = Course_data.where((course) {
      return course.Psths.contains(pathId);
    }).toList();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorBox.Color50,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
        ),
        //start page----------------------------------------------------------
        body: Column(
          children: [
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
                child: 
                ListView.builder(
              itemBuilder: ( ctx , index) 
              {
                return ButtonOfPath(
                  id: filterdCourse[index].id,
                  name: filterdCourse[index].name,
                  description: filterdCourse[index].description,
                );
              },
              itemCount: filterdCourse.length,
              )
              ),
            ),
            //end page{bottom now i am  developer }------------------------------------------------
            Container(
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
                              Icons.bolt,
                              color: ColorSelect.Color1,
                            ),
                            Text('Now, I am $name',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                )),]))),
                        SizedBox(height: 8,)
                   //=====
                      ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            isFavorite(pathId) // return true if "id" Is it in the favorites list
            ?   Icons.star:  Icons.star_border,
                     ),
          onPressed:() => mangeFavorite(pathId) 
          ),
      ),
    );
  }
}

                // ListView(
                //   scrollDirection: Axis.vertical,
                //   children:
                //    [
                //     Icon(
                //       Icons.golf_course,
                //       size: 32,
                //       color: ColorBox.Color50,
                //     ),
                //     ButtonOfPath(
                //         enterText: "HTML",
                //         onPress: () {
                //           Navigator.push(
                //             context,
                //             MaterialPageRoute(
                //                 builder: (context) => const Html()),
                //           );
                //         }),
                //     Icon(
                //       Icons.keyboard_double_arrow_down,
                //       size: 32,
                //       color: ColorBox.Color50,
                //     ),
                //     ButtonOfPath(enterText: "CSS", onPress: () {}),
                //     Icon(
                //       Icons.keyboard_double_arrow_down,
                //       size: 32,
                //       color: ColorBox.Color50,
                //     ),
                //     ButtonOfPath(enterText: "JAVASCRIPT", onPress: () {}),
                //     Icon(
                //       Icons.keyboard_double_arrow_down,
                //       size: 32,
                //       color: ColorBox.Color50,
                //     ),
                //     ButtonOfPath(enterText: "GIT", onPress: () {}),
                //     Icon(
                //       Icons.keyboard_double_arrow_down,
                //       size: 32,
                //       color: ColorBox.Color50,
                //     ),

                //     //end----------------------------------------------
                    // Container(
                    //   height: 48,
                    //   width: 327,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(
                    //       Radius.circular(8),
                    //     ),
                    //     color: ColorBox.Color50,
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Icon(
                    //           Icons.bolt,
                    //           color: ColorSelect.Color1,
                    //         ),
                    //         Text('Now, I am front end developer',
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.bold,
                    //             )),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ],
                // ),