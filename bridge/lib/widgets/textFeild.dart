import 'package:flutter/material.dart';

class Textfeild extends StatelessWidget {
final String? hintText ;

 const Textfeild({Key? key , this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          obscureText: true,
          decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: hintText??'',
        ),
      ),
    );
  }
}
