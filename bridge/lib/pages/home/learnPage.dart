import 'package:flutter/material.dart';
import 'package:bridge/models/paths.dart';
import 'package:provider/provider.dart';
import '../../appData/app_data.dart';
import '../../widgets/Colors/colors.dart';
import '../../widgets/cards/cardLearn.dart';

class LearnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppData>(context).learnPath.isEmpty) {
      return Scaffold(
          backgroundColor: ColorSelect.Color1,
          body: Column(
            children: [
              customHeader('Here is learning'),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Dont have any path',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 84, 123),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ))
            ],
          ));
    } else {
      return Scaffold(
        backgroundColor: ColorSelect.Color1,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            customHeader('Keep going'),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                  ),
                  child: Consumer<AppData>(
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
                  )),
            ),
          ],
        ),
      );
    }
  }

//----------------------------------------------------------------
  Container customHeader(String text) {
    return Container(
      padding: const EdgeInsets.only(
          top: 80.0, left: 30.0, right: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPaths(Paths user) => Card_inLearn(
      id: user.id,
      name: user.name,
      description: user.description,
      sourceImage: user.sourceImage,
    );
          
          
          
          // body: 

          //         StreamBuilder<List<Paths>>(
          //     stream: readPaths(),
          //      builder: (context , snapshot) {
          //    if(snapshot.hasError){
          //     return Text('has errore');

          //    }
          //    else if (snapshot.hasData){
          //       final pathsData= snapshot.data!;
          //       return ListView(
          //         children: pathsData.map(buildPaths).toList(),
          //       );
          //       //  return usersingle==null
          //       //? Center(child: Text('no user'),)
          //       //:buildPaths(usersingle);
          //     }else{
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },
           

          // ),