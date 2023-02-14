import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class Mybutton extends StatelessWidget {
  final String? text;
  final Function()? onPress;
  const Mybutton({
    Key? key,
    this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      child: RaisedButton(
        color:ColorSelect.Color2,
        child: Text(text ?? '',
            style: TextStyle(color: Colors.white, fontSize: 22)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onPress,
      ),
    );
  }
}
