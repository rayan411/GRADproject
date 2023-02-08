import 'package:bridge/widgets/cards/cardOfPath.dart';
import 'package:flutter/material.dart';
import '../../widgets/Colors/colors.dart';
import 'package:bridge/appData/app_data.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //backgroundColor: Color.fromARGB(255, 46, 47, 48),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'What do you wnat learn today?',
          style:
              TextStyle(color: ColorBox.Color30, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, fontSize: 24),
        ),
      ),
      body: Center(
          // add listof viwe with builder-----------------------------------------------------------------------
          child: Consumer<AppData>(
        builder: ((context, appData, child) {
          return ListView(
            children: appData.Paths_data.map((pathsData) => Card_Of_Path(
                  name: pathsData.name,
                  sourceImage: pathsData.sourceImage,
                  description: pathsData.description,
                  id: pathsData.id,
                )).toList(),
          );
        }),
      )),
    ));
  }
}
