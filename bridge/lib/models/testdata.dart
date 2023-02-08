import 'package:bridge/models/paths.dart';
import 'package:bridge/widgets/cards/cardOfPath.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../services/pathServices.dart';
import '../widgets/cards/cardLearn.dart';

class testat extends StatelessWidget {
  const testat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
    body: 
              StreamBuilder<List<Paths>>(
              stream: readPaths(),
               builder: (context , snapshot) {
             if(snapshot.hasError){
              return Text('has errore');

             }
             else if (snapshot.hasData){
                final pathsData= snapshot.data!;
                return ListView(
                  children: pathsData.map(buildPaths).toList(),
                );
                //  return usersingle==null
                //? Center(child: Text('no user'),)
                //:buildPaths(usersingle);
              }else{
                return Center(child: CircularProgressIndicator());
              }
            },
           

          ),
    
    );
  }
}
Widget buildPaths(Paths user) => Card_Of_Path(
  id: user.id,
  name: user.name,
  description: user.description,
  sourceImage: user.sourceImage,
);
