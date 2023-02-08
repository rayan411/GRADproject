import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  String id;
  final String name;
  final String email;
  final String password;
  UserModel({
    this.id = '',
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() =>
      {'id': id,
      'name': name,
      'email': email,
      'password': password};

static UserModel fromjson(Map<String,dynamic> json) =>UserModel(
  name:json['name'],
  email: json['email'],
  password: json['password'],
  );
}

// class UserModel {
//   String id;
//   final String name;
//   final String email;
//   final int password;
//   final List<String> Psths;

//   UserModel(this.Psths, {
//     this.id = '',
//     required this.name,
//     required this.email,
//     required this.password,
//   });

//   Map<String, dynamic> toJson() =>
//       {'id': id, 'name': name, 'email': email, 'password': password};
// }

// //Cloud firebase(enter info)---------------------------------------------------------
// Future creatUsers(UserModel user) async {
//   // Reference to documnt in firebase
//   final docUser = FirebaseFirestore.instance.collection('U').doc();
//  // final user = User(id: docUser.id, name: name, email: "", password: 12222);
//   final json = user.toJson();
//   //creat document and writer data to firebase
//   await docUser.set(json);
// }