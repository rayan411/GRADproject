import 'package:bridge/appData/app_data.dart';
import 'package:bridge/models/paths.dart';
import 'package:bridge/pages/home/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'models/testdata.dart';
import 'pages/loginPages/auth.dart';
import 'pages/paths/front-end/contents_Path.dart';
import 'pages/paths/front-end/course_details.dart';
import 'package:provider/provider.dart';

Future main() async {
  //Initialization with firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//for navigator key---------------------------------------------------------
final navigatorKey = GlobalKey<NavigatorState>();

//--------------------------------------------------------------------------
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) 
  {return ChangeNotifierProvider(
    create: (context) => AppData(),
    child: MaterialApp(
          scaffoldMessengerKey: messengerKey,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            '/': (ctx) => testat(),
            Contents_Path_page.screanRoute: (ctx) => Contents_Path_page(),
            Course_details.screenRoute: (context) => Course_details(),
          },
        ),
  );
}
}
//--------------------------------------------------------------------------
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class Utils {
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
    );

    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

//--------------------------------------------------------------------------
class MainPageA extends StatelessWidget {

  MainPageA();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: const Text('Somthing went wrong!'));
            }
            if (snapshot.hasData) {
              return MyBottomBar();
            } else {
              return AuthPage();
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
//--