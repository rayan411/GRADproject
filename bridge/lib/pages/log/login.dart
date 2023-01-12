import 'package:bridge/pages/home/bottomBar.dart';
import 'package:bridge/pages/log/register.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../widgets/buttons/button_widget.dart';
import '../../widgets/textFeild.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Image(image: AssetImage('images/logoHr.png'),),
               Center(
                child: Container( 
                 // color: ColorBox.Color20,
                  alignment: Alignment.center,
                  child:  Text(
                    "Sign in",
                    style: TextStyle(
                      color: ColorSelect.Color2,
                      fontSize: 54,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 60,
                width: 10,
              ),

// Textfields for username and password fields
             const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email)),
                ), 
                 const SizedBox(
                  height: 8,
                ),
                 const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.lock_outline_rounded,
                      ))),
// Submit Button
           Mybutton1(text: "Login", onPress: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBottomBar(),
            )
            );
           },),
            // Register
              Container(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Center(
                      child: RichText(
                    text: TextSpan(
                      text: "Dont have an account? ",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 17, 32),
                        fontSize: 15,
                      ),
                      children: [
                        TextSpan(
                            text: " Register here",
                            style:const  TextStyle(
                                color: Colors.blue, fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const RegisterPage() ),
                                    )
                                  }),
                      ],
                    ),
                    )))
            ],
          ),
        ),
      ),
    );
  }
}
