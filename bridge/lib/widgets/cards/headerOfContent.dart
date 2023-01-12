import 'package:bridge/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';

class HeaderOfContent extends StatelessWidget {
  final String? nameOfContent;
  final String? DescriptioContent;

  final Function()? onPress;

  const HeaderOfContent(
      {Key? key, this.nameOfContent, this.DescriptioContent, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      color: ColorBox.Color50,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
              Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    nameOfContent ?? "",
                    style: TextStyle(
                        color: ColorSelect.Color5,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
              ],
            ), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  DescriptioContent ?? "",
                  style: TextStyle(
                      color: ColorSelect.Color4,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
