import 'package:bridge/main.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../appData/app_data.dart';
import '../Buttons/custtomButton.dart';

class Card_Of_Path extends StatelessWidget {
  final String? id;
  final String? name;
  final String? sourceImage;
  final String? description;

  Card_Of_Path({
    this.id,
    this.name,
    this.sourceImage,
    this.description,
  });

  void selectPath(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/path-course', arguments: {
      'id': id,
      'name': name,
      'description': description,
    });
  }

  @override
  Widget build(BuildContext context) {
    //final String? idd= Provider.of<AppData>(context).Paths_data[index].id;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: ColorSelect.Color1,
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        child: InkWell(
            // borderRadius: BorderRadius.circular(10),
            // splashColor: Theme.of(context).primaryColor,
            onTap: Provider.of<AppData>(context).isComplete(id!)
                ? () {}
                : () {
                    showBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 450,
                            child:
                                //Structure of Buttom Sheet ------------------------------------------------------------------------------------------------------
                                SafeArea(
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(32),
                                    topLeft: Radius.circular(32),
                                  ),
                                  child: Scaffold(
                                    body: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          color: ColorSelect.Color1,
                                          padding: const EdgeInsets.all(8),
                                          height: 140,
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: InkWell(
                                                      onTap: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: Icon(
                                                        Icons.close,
                                                        size: 32,
                                                        color:
                                                            ColorSelect.Color5,
                                                      )),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Text(
                                                    name ?? '',
                                                    style: TextStyle(
                                                        color:
                                                            ColorSelect.Color5,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 32),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //Structure of Buttom Sheet Part 2  ------------------------------------------------------------------------------------------------------
                                        ListTile(
                                          title: const Text(
                                            "About",
                                            style: TextStyle(
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 83, 83, 83),
                                                fontSize: 22),
                                          ),
                                          subtitle: Text(description ?? '',
                                              style: const TextStyle(
                                                  wordSpacing: 3,
                                                  color: Color.fromARGB(
                                                      255, 29, 29, 29),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                        ),
                                        const Divider(),
                                        CusttomButton(
                                            text: Provider.of<AppData>(context,
                                                        listen: false)
                                                    .isLearned(
                                                        id!) // return true if "id" Is it in the favorites list
                                                ? 'Remove Path'
                                                : 'Join now',
                                            onPress: () {
                                              Provider.of<AppData>(context,
                                                      listen: false)
                                                  .mangeLearn(id!);
                                              Navigator.pop(context);
                                              creatUsers(UserModel(
                                                  id: id ?? '',
                                                  name: name ?? '',
                                                  description:
                                                      description ?? '',
                                                  sourceimage:
                                                      sourceImage ?? ''));
                                            }),
                                      ],
                                    ),
                                  )),
                            ),

                            //End Structure of Buttom Sheet  ------------------------------------------------------------------------------------------------------22
                          );
                        });
                  },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 24,
                      margin: const EdgeInsets.all(0),
                      child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage(sourceImage ?? ''),
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          height: 200,
                          alignment: Alignment.bottomLeft,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  ColorBox.Color50.withOpacity(0.05),
                                  ColorBox.Color30.withOpacity(0.95),
                                ],
                                stops: [
                                  0.6,
                                  0.8
                                ]),
                            borderRadius: BorderRadius.circular(15),
                          ),

                          // width: 400,
                          child: Text(
                            name ?? '',
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                color: ColorSelect.Color5,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        )
                      ]),
                    ),
                    Provider.of<AppData>(context).isComplete(id!)
                        ? Container(
                            height: 200,
                            width: 400,
                            child: Center(
                              child: Text(
                                'Completed',
                                style: TextStyle(
                                    color: ColorSelect.Color5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32),
                                //textAlign: TextAlign.center,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black.withOpacity(0.8),
                            ),
                          )
                        : Container()
                  ],
                ),
              ],
            )),
      ),
    );
  }

//Cloud firebase(enter info)---------------------------------------------------------
  Future creatUsers(UserModel user) async {
    // Reference to documnt in firebase
    final docUser = FirebaseFirestore.instance.collection('users').doc('muyyy');
    ///////////////////////////////////////////////////////////////////////////////////// final user =User(id: docUser.id,name: name, email: "", password: 12222);

    //user.id = docUser.id;
    final json = user.toJson();
    //creat document and writer data to firebase
    await docUser.set(json);
  }
}

class UserModel {
  String id;
  final String name;
  final String description;
  final String sourceimage;
  UserModel({
    this.id = '',
    required this.name,
    required this.description,
    required this.sourceimage,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'sourceimage': sourceimage
      };
}
