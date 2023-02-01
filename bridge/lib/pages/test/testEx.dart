import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bridge/app_data.dart';

import '../../widgets/cards/cardOfPath.dart';

class tesetexplore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: Paths_data.map((pathData) => Card_Of_Path(
              id: pathData.id,
              name: pathData.name,
              sourceImage: pathData.sourceImage,
              description: pathData.description,
            )).toList(),
      ),
    );
  }
}
      // GridView(
      //  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //   maxCrossAxisExtent: 200 ,
      //   childAspectRatio: 7/8,
      //   mainAxisExtent: 10,
      //   crossAxisSpacing: 10,
      //   ),