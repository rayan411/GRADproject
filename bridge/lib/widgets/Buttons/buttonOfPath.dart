import 'package:bridge/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';

class ButtonOfPath extends StatefulWidget {
  final String? enterText;
  final Function()? onPress;

  const ButtonOfPath({Key? key, required this.enterText, this.onPress})
      : super(key: key);

  @override
  State<ButtonOfPath> createState() => _ButtonOfPathState();
}

class _ButtonOfPathState extends State<ButtonOfPath> {
  bool _active = true;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // root-------------------------------------------------------
      onTap: widget.onPress,
      child: Container(
        height: 48,
        width: 327,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          color: _active ? ColorSelect.Color1: ColorBox.Color50,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.flag,
                color: _active ? ColorBox.Color50: ColorSelect.Color1,
              ),

              // Name of path----------------------------------------------------------
              Text(widget.enterText ?? 'HTML',
                  style: TextStyle(
                    fontSize: 16,
                    decoration:_active? TextDecoration.none:TextDecoration.lineThrough ,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
              InkWell(
                onTap: _handleTap,
                child: Icon(
                  _active ? Icons.circle : Icons.check_circle,
                  size: 24,
                  color: Color.fromARGB(255, 247, 250, 252),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
