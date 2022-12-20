import 'package:flutter/material.dart';
class LearnPage extends StatefulWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Learn Page',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 84, 123),
              fontWeight: FontWeight.bold),
        ),
        
      ),
      body: const Center( child: Text(
          'Learn Page , THANK YOU',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 84, 123),
              fontWeight: FontWeight.bold),
        ),),
    );
  }
}