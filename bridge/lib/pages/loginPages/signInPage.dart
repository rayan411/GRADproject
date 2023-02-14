import 'package:bridge/appData/app_data.dart';
import 'package:bridge/pages/loginPages/forgotPassword.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../main.dart';
import '../../widgets/Buttons/Mybutton.dart';
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

  //----------------------SignInPage WEDGET--------------------------------------------
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorSelect.Color5,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: forKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //---------------------------------------- Start page ----------------------------------------
                    Column(
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
                      ],
                    ),
                    const SizedBox( height: 48,),
                    // Textfields for username and password fields----------------------------------------------------------
                    Column(
                      children: [
                        TextFieldEmail(controllerEmail: controllerEmail),
                        const SizedBox(
                          height: 8,
                        ),
                        TextfieldPassword(
                            controllerPassword: controllerPassword),
                        GestureDetector(
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'Forgot password?',
                              style: TextStyle(
                                fontSize: 16,
                                color: ColorBox.Color50.withOpacity(0.6),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForGotPasswordPage()),
                            );
                          },
                        ),
                        _errorMessage(),
                      ],
                    ),
                    const SizedBox(height: 8, ),
                    // Submit Button------------------------------------------------------------------------------------------
                    Mybutton(
                      text: "Sign in",
                      onPress: signIn,
                    ),
                    // under button -----------------------------------------------------------------------------------------------
                    SizedBox( height: 48,),
                    Row(children: const [
                      Expanded(child: Divider()),
                      Text("OR"),
                      Expanded(child: Divider()),
                    ]),
                    const SizedBox( height: 8,),
                    signInWithGoogle(context),
                  ],
                ),
              ),
            ),
          ),
        ),
           //---------------------------------------- bottom Navigation Bar ----------------------------------------
        bottomNavigationBar: bottomBar(),
      );

  Container bottomBar() {
    return Container(
          height: 80,
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Center(
              child: RichText(
            text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: ColorBox.Color50.withOpacity(0.5),
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "Sign up here",
                  style: TextStyle(
                      color: ColorSelect.Color1, fontWeight: FontWeight.bold),
                  recognizer: TapGestureRecognizer()
                    ..onTap = widget.onClickedSignUp,
                ),
              ],
            ),
          )));
  }

  InkWell signInWithGoogle(BuildContext context) {
    return InkWell(
                    onTap: () {
                      final provider =
                          Provider.of<AppData>(context, listen: false);
                      provider.googleLogin();
                    },
                    child: Container(
                      height: 32,
                      width: 220,
                      color: ColorSelect.Color5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('images/google.png'),
                          Text(
                            "SIGN IN WITH GOOGLE",
                            style: TextStyle(
                                color: ColorSelect.Color1,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  );
  }

  //link sign in with firebase auth---------------------------------------------------------------------------
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
