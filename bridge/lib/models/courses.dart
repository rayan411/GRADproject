//-------                     Course                      --------------------

class Course {
  final String id;
  final List<dynamic> Paths;
  final String name;
  final String pathId;
  final String description;
  final bool isDone;

  const Course({
    required this.id,
    required this.Paths,
    required this.name,
    required this.description,
    this.isDone = false,
    required this.pathId,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'Paths': Paths,
        'description': description,
        'isDone': isDone,
        'pathId': pathId
      };

  static Course fromjson(Map<String, dynamic> json) => Course(
      id: json['id'],
      name: json['name'],
      Paths: json['Paths'],
      description: json['description'],
      pathId: json['pathId'],
      isDone: json['isDone']);

  //================= coustom fun ===============================
  Map<String, dynamic> toJsonCustom() => {
        'id': id,
        'name': name,
        'Paths': Paths,
        'description': description,
        'isDone': isDone,
        'pathId': pathId
      };

  //================= coustom fun ===============================

}

//-----------------------------------------------                    Source Of Course                      ------------------------------------------------------------
class SourceOfCourse {
  final List<dynamic> Course;
  final String id;
  final String pathId;
  final String courseId;
  final String name;
  final String link;

  const SourceOfCourse({
    required this.id,
    required this.pathId,
    required this.courseId,
    required this.Course,
    required this.name,
    required this.link,
  });

  Map<String, dynamic> toJsonCustom() => {
        'id': id,
        'name': name,
        'link': link,
        'pathId': pathId,
        'courseId':courseId,
        'Course':Course
      };


   static SourceOfCourse fromjson(Map<String, dynamic> json) => SourceOfCourse(
      id: json['id'],
      name: json['name'],
      link:json['link'],
      pathId: json['pathId'],
      courseId:json['courseId'], 
      Course:json['Course'],
      );
    
}
