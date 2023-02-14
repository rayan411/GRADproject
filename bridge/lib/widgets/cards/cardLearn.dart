import 'package:bridge/main.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../appData/app_data.dart';

class Card_inLearn extends StatefulWidget {
  final String? id;
  final String? name;
  final String? sourceImage;
  final String? description;

  const Card_inLearn({
    this.id,
    this.name,
    this.sourceImage,
    this.description,
  });

  @override
  State<Card_inLearn> createState() => _Card_inLearnState();
}

class _Card_inLearnState extends State<Card_inLearn> {
  void selectPath(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/path-course', arguments: {
      'id': widget.id,
      'name': widget.name,
      'description': widget.description,

      // 'pathId':id, 'name': name, 'path_Description': description,
    });
  }

  @override
  Widget build(BuildContext context) {
    //show dialog when click deletae
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Remove path'),
            content: Material(
              borderRadius: BorderRadius.circular(40),
              child: SingleChildScrollView(
                child: ListBody(
                  children: const [
                    Text('Would you like to remove this path ?'),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: delet,
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: ColorSelect.Color1,
        borderRadius: BorderRadius.circular(20),
        elevation: 8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () => selectPath(context),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 24,
                margin: EdgeInsets.all(0),
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(
                      image: AssetImage(widget.sourceImage ?? ''),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.name ?? '',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: ColorSelect.Color5,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        //Icon(Icons.delete, color: Colors.white,),
                        InkWell(
                            onTap: _showMyDialog,
                            child: Icon(
                              Provider.of<AppData>(context, listen: false)
                                      .isLearned(widget
                                          .id!) // return true if "id" Is it in the favorites list
                                  ? Icons.delete
                                  : Icons.add,
                              color: Colors.white,
                            )),
                        //  InkWell(onTap: _showMyDialog, child: Icon(Icons.delete,color: Colors.white,)),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void delet() {
    setState(() {
      Provider.of<AppData>(context, listen: false).mangeLearn(widget.id!);
      Navigator.pop(context, 'OK');
    });
  }
}
