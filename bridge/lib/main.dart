import 'package:bridge/app_data.dart';
import 'package:bridge/models/paths.dart';
import 'package:bridge/pages/home/bottomBar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

import 'pages/loginPages/auth.dart';
import 'pages/paths/front-end/contents_Path.dart';
import 'pages/paths/front-end/course_details.dart';

Future main() async {
  //Initialization with firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

//for navigator key---------------------------------------------------------
final navigatorKey = GlobalKey<NavigatorState>();

//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Paths> _availblePath = Paths_data;

  List<Paths> _favoritePath = [];
  void _mangeFavorite(String pathId) {
    final existingIndex = _favoritePath.indexWhere((path) =>
        path.id == pathId); // for check if pathe here or not and get of index

    if (existingIndex >= 0) {
      setState(() {
        _favoritePath
            .removeAt(existingIndex); // for remove the path from list of learn
      });
    } else {
      setState(() {
        _favoritePath.add(Paths_data.firstWhere((path) => path.id == pathId));
      });// for add the path to list of learn
    }

  }
    bool _isFavorite(String id){
      return _favoritePath.any((path) => path.id == id); // check for its path have id? && return true if "id" Is it in the favorites list
    }

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        scaffoldMessengerKey: messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (ctx) => MainPageA(_favoritePath),
          Contents_Path_page.screanRoute: (ctx) => Contents_Path_page(_mangeFavorite,_isFavorite),
          Course_details.screenRoute: (context) => Course_details(),
        },
      );
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
  final List<Paths> favoritePath;

  MainPageA(this.favoritePath);

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
              return MyBottomBar(favoritePath);
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