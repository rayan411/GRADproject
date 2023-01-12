import 'package:bridge/pages/paths/front-end.dart';
import 'package:flutter/material.dart';

import '../../widgets/Cards/smallCardOfpath.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Learn Page',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 84, 123),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SmallCardLearn(
                enterName: "Front End Devloper",
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FrontEndPath()),
                  );
                }),
            const SizedBox(
              height: 8,
            ),
            SmallCardLearn(
              enterName: "UX Researcher",
            ),
            const SizedBox(
              height: 8,
            ),
            SmallCardLearn(enterName: "java devloper"),
            const SizedBox(
              height: 8,
            ),
            SmallCardLearn(),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
