import 'package:flutter/material.dart';


class Mybutton1 extends StatelessWidget {
final String? text;
final Function()? onPress ;
const Mybutton1({Key? key, this.text, this.onPress, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Container(
              width: 570,
              height: 70,
              padding: EdgeInsets.only(top: 20),
              child: RaisedButton(
                  color: Color.fromARGB(255, 9, 149, 236),
                  child: Text(text??'', style: TextStyle(color: Colors.white  , fontSize: 22)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed:onPress ,
                  ),
            );
  }
}