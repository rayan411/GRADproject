import 'package:bridge/widgets/Buttons/button-image.dart';
import 'package:flutter/material.dart';

import '../../widgets/Colors/colors.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
//------------------------------------------------------------
bool isLoading = false;
//------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 243, 255),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:  Text(
          'Explore Page',
          style: TextStyle(
              color:ColorBox.Color50,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        // add listof viwe with builder-----------------------------------------------------------------------
        child: ListView(children: const [
          ButtonImage(
            sourceImage: "images/frontend.jpg",
            text: "Front-End devloper",
            enterName: "Front-End devloper",
           
          ), 
          ButtonImage(
            sourceImage: "images/UXResearcher.jpg",
            text: "UX Researcher",
            description: 'eeeeeeeeeeeeeeeeeeeee',
            enterName: " UX Researcher ",
          ),
         ButtonImage(
            sourceImage: "images/frontend.jpg",
            text: "Java Developer",
            enterName: "Java Developer",

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
