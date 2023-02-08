import 'package:bridge/main.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';


class Card_inLearn extends StatelessWidget {
  final String? id;
  final String? name;
  final String? sourceImage;
  final String? description;

  // final Function mangeFavorite;
  // final Function isFavorite;

  // final Function _mangeComplete;
  // final Function _ismComplete;

  const Card_inLearn(
    // this.mangeFavorite,
    // this.isFavorite,
    // this._mangeComplete,
    // this._ismComplete, 
    {
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
    //show dialog when click deletae
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Remove item from Learn.'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Would you like to remove this path ?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pop(context, 'OK'), // mangeFavorite(id) ,
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name ?? '',
                          overflow: TextOverflow.fade,
                          style: TextStyle(
                              color: ColorSelect.Color5,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        //Icon(Icons.delete, color: Colors.white,),
                        //    InkWell(onTap: _showMyDialog, child: Icon(Icons.delete,color: Colors.white,)),
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
}
