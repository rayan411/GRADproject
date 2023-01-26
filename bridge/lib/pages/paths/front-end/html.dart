import 'package:bridge/pages/paths/front-end/front-end.dart';
import 'package:bridge/widgets/Buttons/hyperlinkButton.dart';
import 'package:bridge/widgets/Colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/Buttons/buttonOfPath.dart';
import '../../../widgets/Cards/headerOfContent.dart';

class Html extends StatefulWidget {
  const Html({Key? key}) : super(key: key);

  @override
  State<Html> createState() => _HtmlState();
}

class _HtmlState extends State<Html> {
   bool _active = true;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom-Bar------------------------------------
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: _handleTap,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(6),
            ),
            child: Container(
              height: 32,
              width: 100,
              color: _active ? Colors.lightGreen[700] : Color.fromARGB(255, 203, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.done,
                    color: ColorSelect.Color5,
                  ),
                  Text( _active ? 'Mark as done!' : 'Mark as pending',
                      style: TextStyle(
                        color: ColorSelect.Color5,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
      //app-Bar-------------------------------------------------------
      appBar: AppBar(
        backgroundColor: ColorBox.Color50,
         leading: InkWell(
              onTap: () {
                 Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
              ),

      
      
      body: Column(children: [
        //Header-------------------------------------------------------

        const HeaderOfContent(
            nameOfContent: "HTML",
            DescriptioContent:
                "HTML stands for HyperText Markup Language. It is used on the frontend and gives the structure to the webpage which you can style using CSS and make interactive using JavaScript."),
        
       //center-------------------------------------------------------

        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Visit the following resources to learn :",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )),
        ),
        SizedBox(
          height: 8,
        ),
        
        Link(
            target: LinkTarget.blank,
            uri: Uri.parse("https://www.w3schools.com/html/html_intro.asp"),
            builder: (context, follwlink) => hyperlinkbutton(
                  enterText: "w3schools",
                  onPress: follwlink,
                )),
       SizedBox(
          height: 8,
        ),
        
        Link(
            target: LinkTarget.blank,
            uri: Uri.parse("https://www.codecademy.com/learn/learn-html"),
            builder: (context, follwlink) => hyperlinkbutton(
                  enterText: "codecademy",
                  onPress: follwlink,
                )),
        SizedBox(
          height: 8,
        ),
        Link(
            target: LinkTarget.blank,
            uri: Uri.parse("https://htmlreference.io/"),
            builder: (context, follwlink) => hyperlinkbutton(
                  enterText: "htmlreference",
                  onPress: follwlink,
                )),
      ]),
    );
  }
}


// grid viwo

// Expanded(child: GridView.extent(
//           primary: false,
//           padding: const EdgeInsets.all(16),
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 10,
//           maxCrossAxisExtent:200,
//           children: [
//             Container( 
//             color: ColorSelect.Color3,child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.view_week,),
//                 Text("Course"),
//               ],
//             )),
//              Container( 
//             color: ColorSelect.Color3,child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.view_week,),
//                 Text("Course"),
//               ],
//             )),
            
//             ],
  
// ))