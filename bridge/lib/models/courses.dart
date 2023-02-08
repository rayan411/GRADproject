class Course {
  final String id;

  final List<String> Psths;
  final String name;
  final String description;
  final bool isDone;


  const Course(
      {required this.id,
      required this.Psths,
      required this.name,
      required this.description,
      this.isDone=false,
       });
}
class SubCourse {
  final List<String> Course;
  final String id;
  final String name;
  final String link;

  const SubCourse(
      {required this.id,
      required this.Course,
      required this.name,
      required this.link,
       });



}

