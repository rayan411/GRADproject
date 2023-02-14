import 'package:bridge/models/paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/courses.dart';

class AppData extends ChangeNotifier {
  //-------------------------------  GOOGLE SIGNE IN   -------------------------------
  final googlSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    try {
      final googleUser = await googlSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  Future logout() async {
    await googlSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }

  //----------------Mange Learn-------------------------------------------------
  List<Paths> learnPath = [];

  void mangeLearn(String pathId) {
    final existingIndex = learnPath.indexWhere((path) =>
        path.id == pathId); // for check if pathe here or not and get of index
    if (existingIndex >= 0) {
      {
        learnPath
            .removeAt(existingIndex); // for remove the path from list of learn
      }
    } else {
      {
        learnPath.add(Paths_data.firstWhere((path) => path.id == pathId));
      } // for add the path to list of learn
    }
    notifyListeners();
  }

  bool isLearned(String id) {
    return learnPath.any((path) =>
        path.id ==
        id); // check for its path have id? && return true if "id" Is it in the favorites list
  }

//-----------------Mange Achivement--------------------------------------
  List<Paths> completePathes = [];
  late int existingIndex2;
  void mangeComoletePath(String id) {
    existingIndex2 = completePathes.indexWhere((path) =>
        path.id == id); // for check if pathe here or not and get of index
    if (existingIndex2 >= 0) {
      {
        completePathes
            .removeAt(existingIndex2); // for remove the path from list of learn
      }
    } else {
      {
        completePathes.add(Paths_data.firstWhere((path) => path.id == id));
      } // for add the path to list of complete

      //remove the path from list of learn
      final learnIndex = learnPath.indexWhere((path) => path.id == id);

      if (learnIndex >= 0) {
        learnPath.removeAt(learnIndex);
      }
    }
    notifyListeners();
  }

  bool isComplete(String id) {
    return completePathes.any((path) => path.id == id);
  }
//-------------------------------------------------

//------------------DATABASE-----------------------------------------------

  List<Paths> Paths_data = [
    Paths(
      id: 'p1',
      name: 'Front-End devloper',
      description:
          "Front-end developer architects and develops websites and applications using web technologies (i.e., HTML, CSS, DOM, and JavaScript), which run on the Open Web",
      sourceImage: 'images/FrontEndDeveloper.png',
    ),
    Paths(
        id: 'p3',
        name: 'Back-End devloper',
        description:
            'Back-end Development refers to the server-side development. It focuses on databases, scripting, website architecture. It contains behind-the-scene activities that occur when performing any action on a website. It can be an account login or making a purchase from an online store. Code written by back-end developers helps browsers to communicate with database information',
        sourceImage: 'images/backend.jpg'),
    Paths(
        id: 'p4',
        name: 'Flutter Devloper',
        description: 'description',
        sourceImage: 'images/flutter-app-developer.jpg'),
    Paths(
        id: 'p5',
        name: 'PC Software Engineering',
        description:
            'A typical software engineering certificate curriculum comprises core requirements, concentration courses, and electives. Core coursework typically seeks to familiarize students with software engineering fundamentals. ',
        sourceImage: 'images/se.jpg'),
    Paths(
        id: 'p6',
        name: 'PC in Cyber Security',
        description:
            'While most cybersecurity professionals have at least a bachelor’s degree in computer science, many companies prefer candidates who also have a certification to validate knowledge of best practices. There are hundreds of certifications available, from general to vendor-specific, entry-level to advanced. ',
        sourceImage: 'images/cs.jpg')
  ];
  List<Course> Course_data = const [
    Course(
      id: 'c1',
      name: 'Html',
      Paths: ['p1'],
      description:
          'HTML stands for HyperText Markup Language. It is used on the frontend and gives the structure to the webpage which you can style using CSS and make interactive using JavaScript.',
      isDone: false,
      pathId: '',
    ),
    Course(
      id: 'c2',
      name: 'CSS',
      Paths: ['p1'],
      description:
          'CSS or Cascading Style Sheets is the language used to style the frontend of any website. CSS is a cornerstone technology of the World Wide Web, alongside HTML and JavaScript',
      isDone: false,
      pathId: '',
    ),
    Course(
      id: 'c3',
      name: 'JavaScript',
      Paths: ['p1'],
      description:
          'JavaScript allows you to add interactivity to your pages. Common examples that you may have seen on the websites are sliders, click interactions, popups and so on.',
      isDone: false,
      pathId: '',
    ),
  ];

  List<SourceOfCourse> subCourse_data = const [
    // html = c1 , CSS=c2 , JavaScript= c3
    SourceOfCourse(
        id: 's1',
        Course: ['c1'],
        name: 'w3schools',
        link: 'https://www.w3schools.com/html/html_intro.asp',
        courseId: 'c1',
        pathId: 'p3'),
    SourceOfCourse(
        id: 's2',
        Course: ['c1'],
        name: 'codecademy',
        link: "https://www.codecademy.com/learn/learn-html",
        courseId: 'c1',
        pathId: 'p3'),
    SourceOfCourse(
        id: 's3',
        Course: ['c1'],
        name: 'htmlreference',
        link: "https://htmlreference.io/",
        courseId: 'c1',
        pathId: 'p3'),
    SourceOfCourse(
        id: 's4',
        Course: ['c2'],
        name: 'w3schools',
        link: 'https://www.w3schools.com/css/',
        courseId: 'c2',
        pathId: 'p1'),
    SourceOfCourse(
        id: 's5',
        Course: ['c2'],
        name: 'codecademy',
        link: 'https://www.codecademy.com/learn/learn-css',
        courseId: 'c2',
        pathId: 'p1'),
    SourceOfCourse(
        id: 's6',
        Course: ['c2'],
        name: 'web.dev',
        link: 'https://web.dev/learn/css/',
        courseId: 'c2',
        pathId: 'p1'),
    SourceOfCourse(
        id: 's7',
        Course: ['c3'],
        name: 'w3schools',
        link: 'https://www.w3schools.com/js/',
        courseId: 'c3',
        pathId: 'p3'),
    SourceOfCourse(
        id: 's8',
        Course: ['c3'],
        name: 'javascript.info',
        link: 'https://javascript.info/',
        courseId: 'c3',
        pathId: 'p3'),
  ];
}

//-----------------------------------------------------
const Users_data = [];

Future creatUsers(Paths p) async {
  // Reference to documnt in firebase
  final docUser = FirebaseFirestore.instance.collection('paths').doc();
  // final user = User(id: docUser.id, name: name, email: "", password: 12222);
  final json = p.toJson();
  //creat document and writer data to firebase
  await docUser.set(json);
}
