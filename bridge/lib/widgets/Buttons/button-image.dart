import 'package:bridge/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';

import 'custtomButton.dart';

class ButtonImage extends StatefulWidget {
  final String? text;
  final String? sourceImage;
  final String? description;
  final String? enterName;

  const ButtonImage(
      {Key? key,
      this.text,
      required this.sourceImage,
      this.description,
      this.enterName})
      : super(key: key);

  @override
  State<ButtonImage> createState() => _ButtonImageState();
}

class _ButtonImageState extends State<ButtonImage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: ColorSelect.Color1,
        elevation: 8,
        child: InkWell(
            onTap: () {
              showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return SizedBox(
                        height: 400,
                        child:
                            //Structure of Buttom Sheet ------------------------------------------------------------------------------------------------------
                            SafeArea(
                          child: Scaffold(
                            //  appBar: AppBar(),

                            body: Center(
                              child: Column(
                                children: [
                                  Container(
                                    color: ColorSelect.Color1,
                                    height: 100,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            widget.enterName ?? '',
                                            style: TextStyle(
                                                color: ColorSelect.Color5,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
//Structure of Buttom Sheet Part 2  ------------------------------------------------------------------------------------------------------
                                      child: Column(
                                        children: const [
                                          Text("Description :",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          widget.description ??
                                              "  A front-end developer architects and develops websites and applications using web technologies (i.e., HTML, CSS, DOM, and JavaScript), which run on the Open Web",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal)),
                                    ),
                                  ),
                                  const SizedBox(height: 8),
//Structure of Buttom Sheet Part 3 (Buttons)  ------------------------------------------------------------------------------------------------------22
                                  CusttomButton(
                                    text: 'Join now',
                                    onPress: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      Future.delayed(const Duration(seconds: 3),
                                          () {
                                        setState(() {
                                          isLoading = false;
                                        });
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
//End Structure of Buttom Sheet  ------------------------------------------------------------------------------------------------------22

                        );
                  });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Ink.image(
                  image: AssetImage(widget.sourceImage ?? ''),
                  height: 200,
                  width: 400,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  widget.text ?? '',
                  style: TextStyle(
                      color: ColorSelect.Color5, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            )),
      ),
    );
  }
}
