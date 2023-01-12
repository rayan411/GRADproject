import 'package:flutter/material.dart';
import '../colors/colors.dart';

class hyperlinkbutton extends StatelessWidget {
final String? enterText;
  final Function()? onPress;

  const hyperlinkbutton({Key? key, required this.enterText, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 48,
        width: 327,
        decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          color: ColorBox.Color50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [  Icon(
                Icons.link ,
                color:ColorBox.Color20,
              ),
              SizedBox(width: 8,),
              Text( enterText??'Not entring',
                  style: TextStyle(
                    fontSize: 16,
                    color:ColorSelect.Color5,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
