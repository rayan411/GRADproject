import 'package:bridge/widgets/Colors/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../appData/app_data.dart';
import '../../pages/paths/course_details.dart';

class ButtonOfPath extends StatefulWidget {
  final String? id;
  final String? name;
  final String? pathId;
  final String? courseID;
  final String? description;
  late  bool isDone;
  final Function()? onPress;

  ButtonOfPath({
    Key? key,
    required this.name,
    this.onPress,
    this.description,
    this.id,
    required this.isDone, required this.pathId, required this.courseID, required List Paths,
  }) : super(key: key);

  @override
  State<ButtonOfPath> createState() => _ButtonOfPathState();
}

class _ButtonOfPathState extends State<ButtonOfPath> {


  void doneCourse() {
    setState(()  {
      widget.isDone = !widget.isDone;
    });

      final docCourse=FirebaseFirestore.instance.collection('Paths').doc(widget.pathId).collection('course').doc(widget.id);
                      docCourse.update({
                        'isDone':  widget.isDone, 

                      });
  // Final d= Provider.of<AppData>(context, listen: false).Course_data[index].isDone;
  
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // root-------------------------------------------------------
      onTap: () => {
        Navigator.of(context).pushNamed(Course_details.screenRoute, arguments: {
          'id': widget.id,
          'name': widget.name,
          'description': widget.description,
          'courseID':widget.courseID,
          'pathId':widget.pathId,
          'isDone':widget.isDone
          
        })
      },
      child: Column(
        children: [
          Container(
            height: 48,
            width: 327,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              color: widget.isDone ? ColorBox.Color50 : ColorSelect.Color1,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.flag,
                    color:
                        widget.isDone ? ColorSelect.Color1 : ColorBox.Color50,
                  ),

                  // Name of path----------------------------------------------------------
                  Text(widget.name ?? 'HTML',
                      style: TextStyle(
                        fontSize: 16,
                        decoration: widget.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  InkWell(
                    onTap: 
                      doneCourse,
                    
                      
                    child: Icon(
                      widget.isDone ? Icons.check_circle : Icons.circle,
                      size: 24,
                      color: Color.fromARGB(255, 247, 250, 252),
                    ),
                  )
                ],
              ),
            ),
          ),
          Icon(
            Icons.keyboard_double_arrow_down,
            size: 32,
            color: ColorBox.Color50,
          ),
        ],
      ),
    );
  }
}
