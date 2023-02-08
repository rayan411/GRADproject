import 'package:flutter/material.dart';
import 'package:bridge/models/paths.dart';
import 'package:provider/provider.dart';

import '../../appData/app_data.dart';
import '../../widgets/Colors/colors.dart';
import '../../widgets/cards/cardLearn.dart';

class LearnPage extends StatelessWidget {


  LearnPage();

  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppData>(context).learnPath.isEmpty) {
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
    } else {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:  Text(
              'keep going',
              style: 
                            TextStyle(color: ColorBox.Color30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, fontSize: 24),

            ),
          ),
          body: Consumer<AppData>(
            builder: (context, appData, child) {
              return ListView.builder(
              itemCount: appData.learnPath.length,
              itemBuilder: (ctx, index) {
                return Card_inLearn(
                  id: appData.learnPath[index].id,
                  name: appData.learnPath[index].name,
                  description: appData.learnPath[index].description,
                  sourceImage: appData.learnPath[index].sourceImage,
                );
              },
            );
            },
            
          )
          );
    }
  }
}
