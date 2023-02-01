import 'package:flutter/material.dart';
import '../Buttons/buttonOfPath.dart';
import '../Cards/headerPath.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: const Color.fromARGB(255, 0, 103, 188)),
        body: Column(
          children: [
            //headr-------------------------------------------------------
            HeaderOfPath(
              nameOfPath: "Front End Devloper",
              DescriptioPath:
                  "front-end developer architects and develops websites and applications using web technologies (i.e., HTML, CSS, DOM, and JavaScript), which run on the Open Web",
            onPress: (){},
            ),
            //Center-------------------------------------------------------

            const SizedBox(
              height: 32,
            ),
            // ButtonOfPath(
            //   enterText: "HTML",
            //   onPress: (){}
            // ),
            //  const SizedBox(
            //   height: 8,
            // ),
            // ButtonOfPath(
            //   enterText: "CSS",
            //   onPress: (){}
            // ),
            //  const SizedBox(
            //   height: 8,
            // ),
            // ButtonOfPath(
            //   enterText: "JAVASCRIPT",
            //   onPress: (){}
            // )
          ],
        ),
      ),
    );
  }
}
