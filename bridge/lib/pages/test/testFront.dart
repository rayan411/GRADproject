import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class testF extends StatelessWidget {
  final String? id;
  final String? name;
  final String? sourceImage;
  final String? description;
  const testF({Key? key, this.id, this.name, this.sourceImage, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text( name??''),
      ),
      body:ListView.builder(
       itemBuilder: (context, index) {
                return Text("data");
  },
              itemCount:2,
              )

    );
  }
}