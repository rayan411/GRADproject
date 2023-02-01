import 'package:bridge/app_data.dart';
import 'package:bridge/pages/home/explorePages.dart';
import 'package:bridge/pages/paths/front-end/contents_Path.dart';
import 'package:bridge/widgets/cards/cardOfPath.dart';
import 'package:flutter/material.dart';
import '../../widgets/Cards/smallCardOfpath.dart';
import 'package:bridge/models/paths.dart';

import '../../widgets/cards/cardLearn.dart';

class LearnPage extends StatelessWidget {
  // final String pathId;
  // final String namePath;
  // final String imageSource;
 final List<Paths> favoritePath ;
  
  LearnPage(this.favoritePath);

  @override
  Widget build(BuildContext context) {
  if(favoritePath.isEmpty){

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
      body: const Padding(
        padding: EdgeInsets.all(8.0),
         child: Center(
           child: Text(
            'Dont have any path',
            style: TextStyle(
                color: Color.fromARGB(255, 0, 84, 123),
                fontWeight: FontWeight.bold),
        ),
         ), 
         ),
    );
  } 
  else {
    return Scaffold(appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Learn Page',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 84, 123),
              fontWeight: FontWeight.bold),
        ),
        
      ),
      body:   ListView.builder(
              itemCount: favoritePath.length,
              itemBuilder: ( ctx , index) 
              {
                return Card_inLearn(
                  id: favoritePath[index].id,
                  name: favoritePath[index].name,
                  description: favoritePath[index].description,
                  sourceImage: favoritePath[index].sourceImage,
                );
              },
      
      )
      );
  }
  }
}
        // child: ListView(
        //   children: [
        //     SmallCardLearn(
        //         enterName: "Front End Devloper",
        //         onPress: () {
        //           Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) =>   ExplorePage()),
        //           );
        //         }),
        //     const SizedBox(
        //       height: 8,
        //     ),
        //     SmallCardLearn(
        //       sourceImage: "",
        //       enterName: "UX Researcher",
        //     ),
        //     const SizedBox(
        //       height: 8,
        //     ),
        //     SmallCardLearn(enterName: "java devloper"),
        //     const SizedBox(
        //       height: 8,
        //     ),
        //     SmallCardLearn(),
        //     const SizedBox(
        //       height: 8,
        //     ),
        //   ],
        // ),
