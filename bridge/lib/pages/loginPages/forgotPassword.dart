import 'package:bridge/widgets/Buttons/button_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../main.dart';
import '../../widgets/textField/forEmail.dart';

class ForGotPasswordPage extends StatefulWidget {
  const ForGotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForGotPasswordPage> createState() => _ForGotPasswordPageState();
}

class _ForGotPasswordPageState extends State<ForGotPasswordPage> {
  final controllerEmail = TextEditingController();
  final forKey = GlobalKey<FormState>();
  //--------------------dispose------------------------------------------------
  @override
  void dispose() {
    controllerEmail.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 0, 114, 244),
          elevation: 0,
          title: Text(
            "Reast Passord",
            style: TextStyle(color: Color.fromARGB(255, 0, 119, 188)),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 0, 119, 188),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
              key: forKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Receive an email to\nreset your password",
                    style: TextStyle(fontSize: 24),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFieldEmail(controllerEmail: controllerEmail),
                  SizedBox(
                    height: 8,
                  ),
                  Mybutton1(
                    text: "Reset Password",
                    onPress: resetPassword,
                  )
                ],
              )),
        ),
      );
  Future resetPassword() async {
    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: controllerEmail.text.trim());
      Utils.showSnackBar("Password Reast Email Sent");
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
      Navigator.of(context).pop();
    }
  }
}
