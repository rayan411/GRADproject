import 'package:bridge/widgets/textField/forEmail.dart';
import 'package:bridge/widgets/textField/forPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../models/users.dart';
import '../../services/user_Services.dart';
import '../../widgets/Buttons/Mybutton.dart';
import '../../widgets/Colors/colors.dart';

class SignUpPage extends StatefulWidget {
  final Function() onClickedSignIn;

  const SignUpPage({Key? key, required this.onClickedSignIn}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  String? errorMessage = '';

  // ----------------- void= errore massage----------------------------------------
  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Error! $errorMessage',
      style: const TextStyle(color: Colors.red),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            // ---------------------------------------- start page ----------------------------------------
              padding: const EdgeInsets.all(30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Image(
                      image: AssetImage('images/logoHr.png'),
                    ),
                    Center(
                      child: Text(
                        " Sign up",
                        style: TextStyle(
                          color: ColorSelect.Color2,
                          fontSize: 54,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  // ---------------------------------------- Text fields----------------------------------------
                    //NAME
                    TextFieldName(),
                    const SizedBox(height: 8,),
                    //email
                    TextFieldEmail(controllerEmail: controllerEmail),
                    const SizedBox(height:8,),
                    //password
                    TextfieldPassword(controllerPassword: controllerPassword),
                    const SizedBox( height:8,),
                    _errorMessage(),
                    const SizedBox( height:24,),
                    // button for sign up
                    Mybutton(
                      onPress: signUp,
                      text: "Sign Up",
                    ),
                  ])),
        ),
      ),
      bottomNavigationBar: bottomTextBar(),
    );
  }

  Container bottomTextBar() {
    return Container(
        height: 80,
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Center(
            child: RichText(
          text: TextSpan(
            text: "Already have account? ",
            style: TextStyle(
              color: ColorBox.Color50.withOpacity(0.5),
              fontSize: 16,
            ),
            children: [
              TextSpan(
                  text: "Sign in here",
                  style: TextStyle(
                      color: ColorSelect.Color1, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignIn),
            ],
          ),
        )));
  }

  TextField TextFieldName() {
    return TextField(
                    controller: controllerName,
                    decoration: const InputDecoration(
                        labelText: 'NAME',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 20,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        prefixIcon: Icon(
                          Icons.person,
                        )),
                  );
  }

  //link sign up with firebase ---------------------------------------------------------------------------
  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim());
      //=------------------------------------
      // var name = FirebaseAuth.instance.currentUser!.displayName;
      // name=controllerName.text.trim();
      var mo = await FirebaseAuth.instance.currentUser!
          .updateDisplayName(controllerName.text.trim());

      //var displayname=FirebaseAuth.instance.currentUser!.updateDisplayName(displayName:controllerName);
      creatUsers(UserModel(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim(),
          name: controllerName.text.trim()));
    } on FirebaseAuthException catch (e) {
      print('THIS IS ERRRRRRRRORE$e');
      setState(() {
        errorMessage = e.message;
      });
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
  //---------------------------------------------------------------------------

}

