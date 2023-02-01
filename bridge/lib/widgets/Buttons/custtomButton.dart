import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class CusttomButton extends StatelessWidget {
  final String? text;
  final Function()? onPress;

  const CusttomButton({Key? key, required this.text, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7.0,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Theme.of(context).primaryColor,
        onTap: onPress,
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [ColorSelect.Color1, ColorSelect.Color3]),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          height: 32,
          width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: 48),
              Expanded(
                child: Center(
                  child: Text(
                    text ?? '',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: 48.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
