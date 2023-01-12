import 'package:flutter/material.dart';

import 'custtomButton.dart';

class MyBottomSheet extends StatelessWidget {
  final String? Path;
  final String? Description;
  const MyBottomSheet({Key? key, this.Path, this.Description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
  //Structure of Buttom Sheet ------------------------------------------------------------------------------------------------------
    Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber,),
      body: Center(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 25, 118, 177),
              height: 200,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Path ?? 'NOT Assgind',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),
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
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                    Description ??
                        "A front-end developer architects and develops websites and applications using web technologies (i.e., HTML, CSS, DOM, and JavaScript), which run on the Open Web A front-end developer architects and develops websites and applications using web technologies (i.e., HTML, CSS, DOM, and JavaScript), which run on the Open Web",
                    style: const TextStyle(fontWeight: FontWeight.normal)),
              ),
            ),
            const SizedBox(height: 8),
//Structure of Buttom Sheet Part 3 (Buttons)  ------------------------------------------------------------------------------------------------------22
            const CusttomButton(
              text: 'Lets Start',
            ),
            const SizedBox(height: 8),
            const CusttomButton(
              text: 'Cancel',
            )
          ],
        ),
      ),
    );
//End Structure of Buttom Sheet  ------------------------------------------------------------------------------------------------------22

  }
}

  // ElevatedButton(
              //   child: const Text("close"),
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              // ),