import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderOfPath extends StatelessWidget {
  final String? nameOfPath;
  final String? DescriptioPath;

  final Function()? onPress;


  const HeaderOfPath({Key? key, required this.nameOfPath,required this.DescriptioPath, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 256,
              color:ColorBox.Color50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children:  [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                           nameOfPath?? "",
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
                        child:  Text(
                          DescriptioPath ?? "",
                          style:  TextStyle(
                              color:ColorSelect.Color4,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 48,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 100,
                          height: 33,
                          child: RaisedButton(
                            color: Color.fromARGB(255, 9, 149, 236),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            onPressed: onPress,
                            child: const Text('Roadmap',
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
  }
}