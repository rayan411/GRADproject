import 'package:flutter/material.dart';
import '../colors/colors.dart';

class hyperlinkbutton extends StatelessWidget {
final String? name;
final String? link;
final String? id;
  final Function()? onPress;

  const hyperlinkbutton({Key? key,required this.onPress,required this.name, required this.link,required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                Text( name??'Not entring',
                    style: TextStyle(
                      fontSize: 16,
                      color:ColorSelect.Color5,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
