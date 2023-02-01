import 'package:bridge/widgets/cards/cardOfPath.dart';
import 'package:flutter/material.dart';
import '../../widgets/Colors/colors.dart';
import 'package:bridge/app_data.dart';

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
      //backgroundColor: Color.fromARGB(255, 46, 47, 48),
      appBar: AppBar(
       backgroundColor: Colors.white,
        title: Text(
          'Explore Page',
          style:
              TextStyle(color: ColorBox.Color50, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          // add listof viwe with builder-----------------------------------------------------------------------
          child: ListView(
          children: Paths_data.map((pathsData) => Card_Of_Path(
              name: pathsData.name,
              sourceImage: pathsData.sourceImage,
              description: pathsData.description,
              id: pathsData.id,
            )).toList(),
      )),
    ));
  }
}

        // children: const [
        //   Card_Of_Path(
        //     sourceImage:"images/frontend.jpg",
        //     text: "Front-End devloper",
        //     description: "Front-End devloper are very simple to end ...........",
            
           
        //   ), 
        //   Card_Of_Path(
        //     sourceImage: "images/UXResearcher.jpg",
        //     text: "UX Researcher",
        //     description: 'eeeeeeeeeeeeeeeeeeeee',
        //   ),
        //  Card_Of_Path(
        //     sourceImage: "images/frontend.jpg",
        //     text: "Java Developer",

        //    )//,Card_Of_Path(
        //   //   sourceImage: "images/frontend.jpg",
        //   //   text: "Front-End devloper",
        //   // ),Card_Of_Path(
        //   //   sourceImage: "images/frontend.jpg",
        //   //   text: "Front-End devloper",
        //   // ),Card_Of_Path(
        //   //   sourceImage: "images/frontend.jpg",
        //   //   text: "Front-End devloper",
        //   // ),
        // ]),