import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile Page',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 84, 123),
              fontWeight: FontWeight.bold),
        ),
      ), 
      body: const Center( child: Text(
          'Profile Page , THANK YOU',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 84, 123),
              fontWeight: FontWeight.bold),
        ),),
    );
  }
}