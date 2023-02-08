import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
class Paths {
  String id; 
  final String name;
  final String description;
  final String sourceImage;

  Paths({
    this.id = '',
    required this.name,
    required this.description,
    required this.sourceImage,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'sourceImage': sourceImage,
      };


 
static Paths fromjson(Map<String,dynamic> json) => Paths(
  id: json['id'],
  name:json['name'],
  description: json['description'],
  sourceImage: json['sourceImage'],
  );     
}


// Future creatUsers(Paths p) async {
//   // Reference to documnt in firebase
//   final docUser = FirebaseFirestore.instance.collection('paths').doc();
//  // final user = User(id: docUser.id, name: name, email: "", password: 12222);
//   final json = pr.toJson();
//   //creat document and writer data to firebase
//   await docUser.set(json);
// }
