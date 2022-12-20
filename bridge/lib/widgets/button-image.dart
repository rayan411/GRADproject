import 'package:flutter/material.dart';

class ButtonImage extends StatelessWidget {
  final String? text;
  final String? sourceImage;
  
  const ButtonImage({Key? key, this.text, required this.sourceImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
                      color: Colors.blue,
                      elevation: 8,
                      child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Ink.image(
                                image: AssetImage( sourceImage ?? ''),
                                height: 200,
                                width: 400,
                                fit: BoxFit.cover,
                              ),
                              const SizedBox(height: 6,),
                               Text(text ?? '',
                                style: TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6,),
                            ],
                          )),
      ),
    );
              
  }
}