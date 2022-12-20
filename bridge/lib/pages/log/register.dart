import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/button_widget.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.blue[50],
        body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      
                      alignment: Alignment.center,
                      child: const Text(
                        "Create account",
                        style: TextStyle(
                          color: Color.fromARGB(255, 17, 88, 132),
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'NAME',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.person,
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'EMAIL',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email)),
                  ),
                  const SizedBox(
                    height:8,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'PHONE',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.phone_android,
                        )),
                  ),
                  const SizedBox(
                    height:8,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'PASSWORD',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'CONFIRM PASSWORD',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Mybutton1(
                    onPress: () {},
                    text: "Register",
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                          text: "Already have account? ",
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 17, 32),
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                                text: " Login here",
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()),
                                        )
                                      }),
                          ],
                        ),
                      )))
                ])),
      ),
    ));
  }
}
