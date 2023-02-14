
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../appData/app_data.dart';
import '../Colors/colors.dart';

class AchiveBottom extends StatelessWidget {
  final String name;
  final String pathID;
  const AchiveBottom({
    Key? key,
    required this.name,
    required this.pathID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 500,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: ColorBox.Color40,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Image(
                    image: AssetImage("images/achive.png"),
                    height: 48,
                    width: 40,
                    // color: Color.fromARGB(255, 175, 153, 9),
                  ),
                  Text(
                    name,
                    style: TextStyle(
                        color: ColorSelect.Color5,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  InkWell(
                    onTap: (() {
                      Provider.of<AppData>(context, listen: false)
                          .mangeComoletePath(pathID);
                    }),
                    child: Icon(
                      Provider.of<AppData>(context, listen: false).isComplete(
                              pathID) // return true if "id" Is it in the favorites list
                          ? Icons.cancel
                          : Icons.star_border_outlined,
                      color: ColorSelect.Color1,
                    ),
                  ),
                 // SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
                          SizedBox(height: 8,)

      ],
    );
  }
}
