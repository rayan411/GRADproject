import 'package:bridge/models/paths.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../models/courses.dart';

class AppData extends ChangeNotifier {
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
        sourceImage: 'images/frontend.jpg',
        ),
    Paths(
        id: 'p2',
        name: 'UX Researcher ',
        description: 'eeeeeeeeeeeeeeeeeeeee',
        sourceImage: 'images/UXResearcher.jpg',
        ),
    Paths(
        id: 'p3',
        name: 'Back-End devloper',
        description: 'sourceImage',
        sourceImage: 'images/frontend.jpg',
        ),
  ];
  List<Course> Course_data = const [
    Course(
      id: 'c1',
      name: 'Html',
      Psths: ['p1'],
      description:
          'HTML stands for HyperText Markup Language. It is used on the frontend and gives the structure to the webpage which you can style using CSS and make interactive using JavaScript.',
      isDone: false,
    ),
    Course(
      id: 'c2',
      name: 'CSS',
      Psths: ['p1'],
      description:
          'CSS or Cascading Style Sheets is the language used to style the frontend of any website. CSS is a cornerstone technology of the World Wide Web, alongside HTML and JavaScript',
      isDone: false,
    ),
    Course(
      id: 'c3',
      name: 'JavaScript',
      Psths: ['p1'],
      description:
          'JavaScript allows you to add interactivity to your pages. Common examples that you may have seen on the websites are sliders, click interactions, popups and so on.',
      isDone: false,
   
    ),
  ];

  List<SubCourse> subCourse_data = const [
    // html = c1 , CSS=c2 , JavaScript= c3
    SubCourse(
      id: 's1',
      Course: ['c1'],
      name: 'w3schools',
      link: 'https://www.w3schools.com/html/html_intro.asp',
    ),
    SubCourse(
      id: 's2',
      Course: ['c1'],
      name: 'codecademy',
      link: "https://www.codecademy.com/learn/learn-html",
    ),
    SubCourse(
      id: 's3',
      Course: ['c1'],
      name: 'htmlreference',
      link: "https://htmlreference.io/",
    ),
    SubCourse(
      id: 's4',
      Course: ['c2'],
      name: 'w3schools',
      link: 'https://www.w3schools.com/css/',
    ),
    SubCourse(
      id: 's5',
      Course: ['c2'],
      name: 'codecademy',
      link: 'https://www.codecademy.com/learn/learn-css',
    ),
    SubCourse(
      id: 's6',
      Course: ['c2'],
      name: 'web.dev',
      link: 'https://web.dev/learn/css/',
    ),
    SubCourse(
      id: 's7',
      Course: ['c3'],
      name: 'w3schools',
      link: 'https://www.w3schools.com/js/',
    ),
    SubCourse(
      id: 's8',
      Course: ['c3'],
      name: 'javascript.info',
      link: 'https://javascript.info/',
    ),
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
