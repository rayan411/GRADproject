import 'package:bridge/pages/home/bottomBar.dart';
import 'package:bridge/pages/home/learnPage.dart';
import 'package:bridge/pages/home/profilePage.dart';
import 'package:bridge/pages/loginPages/forgotPassword.dart';
import 'package:bridge/pages/loginPages/signInPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

import 'pages/loginPages/auth.dart';

Future main() async {
  //Initialization with firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
final navigatorKey= GlobalKey<NavigatorState>();
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
// This widget is the root of your application.
  @override
  
  Widget build(BuildContext context) => MaterialApp(
    scaffoldMessengerKey:messengerKey,
    navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MainPageA(),
    );
  
}
//--------------------------------------------------------------------------
final messengerKey = GlobalKey<ScaffoldMessengerState>();
class Utils {
static showSnackBar(String? text) { 
    if (text == null)return ;
    
    final snackBar = SnackBar(content: Text(text) , backgroundColor: Colors.red,);
    
    messengerKey.currentState!
     ..removeCurrentSnackBar()
     ..showSnackBar(snackBar);
  }
}
//--------------------------------------------------------------------------
class MainPageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    body:StreamBuilder<User?>(
     stream:FirebaseAuth.instance.authStateChanges(),
     builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState) {
         return  const Center(child:CircularProgressIndicator());
      } else if (snapshot.hasError) {
         return  const Center(child:const Text('Somthing went wrong!'));
      }
      if (snapshot.hasData) {
         return const MyBottomBar();
      } else {
        return  AuthPage();
    }
    },
    ),
  );
}

//---------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------
//--------------- HomePage test just-----------------------------------------------------------
class HomePagetest extends StatelessWidget {
  const HomePagetest({Key? key}) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

  return Scaffold(
    appBar: AppBar(title: const Text("home page"),),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Signed In AS" ),
          const SizedBox(height: 8,),
          Text(
            user.email!,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8,),
          ElevatedButton.icon(onPressed: () => FirebaseAuth.instance.signOut(),          
          icon: const Icon(Icons.arrow_back), label: const Text("Sign out")),
        ],
      ),
    )
  );  
  }
}
