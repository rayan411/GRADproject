import 'package:bridge/services/courseService.dart';
import 'package:bridge/services/pathServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'models/courses.dart';
import 'models/paths.dart';

class Addtofirebase extends StatefulWidget {
  const Addtofirebase({Key? key}) : super(key: key);

  @override
  State<Addtofirebase> createState() => _AddtofirebaseState();
}

class _AddtofirebaseState extends State<Addtofirebase> {
  addData() {
   creatCourse(const Course(id: 'c1', Paths: ['p5'], name: 'Software Testing', description: 'Software testing is the process of evaluating and verifying that a software product or application does what it is supposed to do. The benefits of testing include preventing bugs, reducing development costs and improving performance.', pathId: 'p5'));
   creatSourceCourse(const SourceOfCourse(id: 's1', pathId: 'p5', courseId: 'c1', Course: ['c1'], name: 'CTFL', link: 'https://ksatqb.org/certificates/'));
   creatSourceCourse(const SourceOfCourse(id: 's2', pathId: 'p5', courseId: 'c1', Course: ['c1'], name: 'CTAL', link: 'https://ksatqb.org/certificates/'));
   creatSourceCourse(const SourceOfCourse(id: 's3', pathId: 'p5', courseId: 'c1', Course: ['c1'], name: 'CETL', link: 'https://ksatqb.org/certificates/'));
   creatCourse(const Course(id: 'c2', Paths: ['p5'], name: 'Requirements Engineering', description: ' CPRE is a certification scheme for everyone involved professionally with Requirements Engineering, Business Analysis and software and systems development.', pathId: 'p5'));
   creatSourceCourse(const SourceOfCourse(id: 's', pathId: 'p5', courseId: 'c2', Course: ['c1'], name: 'CPRE', link: 'https://www.ireb.org/en/downloads/'));
   creatCourse(const Course(id: 'c1', Paths: ['p6'], name: 'Software Security', description: 'A security certificate is a small data file used as an Internet security technique through which the identity, authenticity and reliability of a website or Web application is established.', pathId: 'p6'));
   creatSourceCourse(const SourceOfCourse(id: 's', pathId: 'p6', courseId: 'c1', Course: ['c1'], name: 'CSSLP', link: 'https://www.isc2.org/Certifications/CSSLP#'));
  }

  @override
  void initState() {
    addData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
