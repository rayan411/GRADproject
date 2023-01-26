import 'package:bridge/pages/loginPages/forgotPassword.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../widgets/buttons/button_widget.dart';
import '../../widgets/textField/forEmail.dart';
import '../../widgets/textField/forPassword.dart';

class SignInPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;

  const SignInPage({Key? key, required this.onClickedSignUp}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //Recieve text from user --------------------------------------------
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  //other
  String? errorMessage = '';
  final forKey = GlobalKey<FormState>();

  // ----------------- void errore massage----------------------------------------
  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Error! $errorMessage',
      style: TextStyle(color: Colors.red),
    );
  }

  //--------------------dispose------------------------------------------------
  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();

    super.dispose();
  }
  //--------------------------------------------------------------------

  //----------------------WEDGET--------------------------------------------
  @override
  Widget build(BuildContext context) => SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: forKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('images/logoHr.png'),
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
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

                  // Textfields for username and password fields----------------------------------------------------------
                  TextFieldEmail(controllerEmail: controllerEmail),
                  const SizedBox(
                    height: 8,
                  ),
                  TextfieldPassword(controllerPassword: controllerPassword),
                  GestureDetector(
                    child:  Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            color: ColorSelect.Color2,
                            fontWeight: FontWeight.bold
                            ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForGotPasswordPage()),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  _errorMessage(),
                  // Submit Button------------------------------------------------------------------------------------------
                  Mybutton1(
                    text: "Sign in",
                    onPress: signIn,
                  ),

                  // under button -----------------------------------------------------------------------------------------------
                  Container(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                          text: "Dont have an account? ",
                          style:  TextStyle(
                            color: ColorBox.Color50,
                            fontSize: 14,
                          ),
                          children: [
                            TextSpan(
                              text: "Sign up here",
                              style:  TextStyle(
                                  color: ColorSelect.Color2,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClickedSignUp,
                            ),
                          ],
                        ),
                      ))),
                  const SizedBox(
                    height: 8,
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      );

  //link sign in with firebase ---------------------------------------------------------------------------
  Future signIn() async {
    final isValid = forKey.currentState!.validate();
    if (!isValid) return;

    showDialog(
        context: context,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: controllerEmail.text.trim(),
        password: controllerPassword.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      setState(() {
        errorMessage = e.message;
      });
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
