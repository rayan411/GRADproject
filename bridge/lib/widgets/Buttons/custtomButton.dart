import 'package:flutter/material.dart';

import '../Colors/colors.dart';

class CusttomButton extends StatelessWidget {
  final String? text;
  final Function()? onPress;

  const CusttomButton({Key? key, required this.text, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    padding: const EdgeInsets.all(8.0),
        alignment: Alignment.bottomCenter, 
      child: InkWell(
        splashColor: Theme.of(context).primaryColor,
        onTap: onPress,
        child: Ink(
          decoration: BoxDecoration(
            color: ColorSelect.Color1,
            // gradient: LinearGradient(
            //     colors: [ColorSelect.Color1]),
           borderRadius: BorderRadius.all(Radius.circular(14.0)),
          ),
          height: 40,
          width: 320,
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
