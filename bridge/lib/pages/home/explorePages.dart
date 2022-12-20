import 'package:bridge/widgets/button-image.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 243, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Explore Page',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 84, 123),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ListView(children: const [
          ButtonImage(
            sourceImage: "images/frontend.jpg",
            text: "Front-End devloper",
          ), 
          ButtonImage(
            sourceImage: "images/UXResearcher.jpg",
            text: "UX Researcher",
          ),
         ButtonImage(
            sourceImage: "images/frontend.jpg",
            text: "Java Developer",
          ),ButtonImage(
            sourceImage: "images/frontend.jpg",
            text: "Front-End devloper",
          ),ButtonImage(
            sourceImage: "images/frontend.jpg",
            text: "Front-End devloper",
          ),ButtonImage(
            sourceImage: "images/frontend.jpg",
            text: "Front-End devloper",
          ),
        ]),
      ),
    ));
  }
}
