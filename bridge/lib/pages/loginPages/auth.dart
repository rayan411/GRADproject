import 'package:bridge/pages/loginPages/signInPage.dart';
import 'package:bridge/pages/loginPages/signUpPage.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //keep logged in user 
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? SignInPage(onClickedSignUp: toggle)
      : SignUpPage(onClickedSignIn: toggle);
  void toggle() => setState(() => isLogin = !isLogin);
}
