import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/users.dart';

  //Cloud firebase(enter info)---------------------------------------------------------
Future creatUsers(UserModel user) async {
    // Reference to documnt in firebase
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    ///////////////////////////////////////////////////////////////////////////////////// final user =User(id: docUser.id,name: name, email: "", password: 12222);
    user.id = docUser.id;
    final json = user.toJson();
    //creat document and writer data to firebase
    await docUser.set(json);
  }




Stream<List<UserModel>> readUsers()=> FirebaseFirestore.instance
.collection('Paths')
.snapshots()
.map((snapshot) => 
      snapshot.docs.map((doc) =>UserModel.fromjson(doc.data())).toList())
;

Future<UserModel?> readUser() async{
  //Get singale by ID

  final docUser = FirebaseFirestore.instance.collection('users').doc('BRfgB3GYd55B2YB7JeLK');
  final snapshot =await docUser.get();

  if (snapshot.exists){
    return UserModel.fromjson(snapshot.data()!);
  }
}