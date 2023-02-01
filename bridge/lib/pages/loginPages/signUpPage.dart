import 'package:bridge/widgets/textField/forEmail.dart';
import 'package:bridge/widgets/textField/forPassword.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../widgets/Colors/colors.dart';
import '../../widgets/buttons/button_widget.dart';

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

  // ----------------- void errore massage----------------------------------------
  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Error! $errorMessage',
      style: const TextStyle(color: Colors.red),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
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
                  //NAME
                  TextField(
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
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  //email
                  TextFieldEmail(controllerEmail: controllerEmail),
                  const SizedBox(
                    height: 8,
                  ),
                  //password
                  TextfieldPassword(controllerPassword: controllerPassword),

                  const SizedBox(
                    height: 8,
                  ),
                  _errorMessage(),
                  const SizedBox(
                    height: 8,
                  ),
                  Mybutton1(
                    onPress: signUp,
                    text: "Sign Up",
                  ),
                  Container(
                      padding:
                          const EdgeInsets.only(top: 40, left: 20, right: 20),
                      child: Center(
                          child: RichText(
                        text: TextSpan(
                          text: "Already have account? ",
                          style: TextStyle(
                            color: ColorBox.Color50,
                            fontSize: 15,
                          ),
                          children: [
                            TextSpan(
                                text: "Sign in here",
                                style: TextStyle(
                                    color: ColorSelect.Color2,
                                    fontWeight: FontWeight.bold),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignIn),
                          ],
                        ),
                      )))
                ])),
      ),
    );
  }

  //link sign up with firebase ---------------------------------------------------------------------------
  Future signUp() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: const CircularProgressIndicator(),
            ));
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim());
      if (result != null) {
        FirebaseFirestore.instance.collection('users').doc().set({
          'name': controllerName.text.trim,
        });
      }
    } on FirebaseAuthException catch (e) {
      print(e);
      setState(() {
        errorMessage = e.message;
      });
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
  //---------------------------------------------------------------------------

  //Cloud firebase(enter info)---------------------------------------------------------
  Future creatUsers(UserModel user) async {
    // Reference to documnt in firebase
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    ///////////////////////////////////////////////////////////////////////////////////// final user =User(id: docUser.id,name: name, email: "", password: 12222);
    user.id = docUser.id;
    final json = user.toJson();
    //creat document and writer data to firebase
    await docUser.set(json);
  }
}

class UserModel {
  String id;
  final String name;
  final String email;
  final int password;
  UserModel({
    this.id = '',
    required this.name,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() =>
      {'id': id,
      'name': name,
      'email': email,
      'password': password};
}
