import 'package:bridge/main.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../pages/paths/front-end/contents_Path.dart';
import '../../pages/test/testEx.dart';
import '../../pages/test/testFront.dart';
import '../Buttons/custtomButton.dart';

class Card_Of_Path extends StatelessWidget {
  final String? id;
  final String? name;
  final String? sourceImage;
  final String? description;

  const Card_Of_Path({
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
      // 'pathId':id, 'name': name, 'path_Description': description,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: ColorSelect.Color1,
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        child: InkWell(
            // borderRadius: BorderRadius.circular(10),
            // splashColor: Theme.of(context).primaryColor,
            onTap: () {
              showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                        height: 400,
                        child:
                            //Structure of Buttom Sheet ------------------------------------------------------------------------------------------------------
                            SafeArea(
                          child: Scaffold(
                            //  appBar: AppBar(),

                            body: Center(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    color: ColorSelect.Color1,
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: InkWell(
                                              onTap: () =>
                                                  Navigator.pop(context),
                                              child: Icon(
                                                Icons.close_rounded,
                                                size: 24,
                                              )),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                name ?? '',
                                                style: TextStyle(
                                                    color: ColorSelect.Color5,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      //Structure of Buttom Sheet Part 2  ------------------------------------------------------------------------------------------------------
                                      child: Column(
                                        children: const [
                                          Text("Description :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          description ??
                                              "  A front-end developer architects and develops websites and applications using web technologies (i.e., HTML, CSS, DOM, and JavaScript), which run on the Open Web",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  //Structure of Buttom Sheet Part 3 (Buttons)  ------------------------------------------------------------------------------------------------------22
                                  CusttomButton(
                                    text: 'Join now',
                                    onPress: () => selectPath(context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        //End Structure of Buttom Sheet  ------------------------------------------------------------------------------------------------------22

                        );
                  });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 24,
                  margin: EdgeInsets.all(0),
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
                      padding: EdgeInsets.all(8),
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
              ],
            )),
      ),
    );
  }
}
