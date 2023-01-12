import 'package:bridge/pages/paths/front-end/html.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/Buttons/buttonOfPath.dart';
import '../../widgets/Cards/headerPath.dart';

class FrontEndPath extends StatelessWidget {
  const FrontEndPath({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              nameOfPath: "Front End Devloper",
              DescriptioPath:
                  "front-end developer architects and develops websites and applications using web technologies (i.e., HTML, CSS, DOM, and JavaScript), which run on the Open Web",
              onPress: () {},
            ),
            //Center-------------------------------------------------------
            const Text(
              "Roadmap to become Frontend developer!",
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
                  minWidth: 2 ,
                ),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                     Icon(Icons.golf_course,size: 32, color:  ColorBox.Color50,),
                    ButtonOfPath(
                        enterText: "HTML",
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Html()),
                          );
                        }),
                    Icon(Icons.keyboard_double_arrow_down ,size: 32, color:  ColorBox.Color50, ),
                    ButtonOfPath(enterText: "CSS", onPress: () {}),
                    Icon(Icons.keyboard_double_arrow_down,size: 32, color:  ColorBox.Color50,),
                    ButtonOfPath(enterText: "JAVASCRIPT", onPress: () {}),
                    Icon(Icons.keyboard_double_arrow_down,size: 32, color:  ColorBox.Color50,),
                    ButtonOfPath(enterText: "GIT", onPress: () {}),
                   // Icon(Icons.arrow_downward,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
