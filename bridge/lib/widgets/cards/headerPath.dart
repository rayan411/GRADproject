import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderOfPath extends StatelessWidget {
  final String? nameOfPath;
  final String? DescriptioPath;

  final Function()? onPress;

  const HeaderOfPath(
      {Key? key,
      required this.nameOfPath,
      required this.DescriptioPath,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
     color: ColorSelect.Color1,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: 
                 const Align(
                  alignment: Alignment.centerLeft,
                  child:Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                )),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    nameOfPath ?? "",
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  DescriptioPath ?? "",
                  style: TextStyle(
                      color: ColorSelect.Color4,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            // const SizedBox(
            //   height: 48,
            // ),
           
          ],
        ),
      ),
    );
  }
}
