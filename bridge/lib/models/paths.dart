class Paths {
  final String id;
  final String name;
  final String description;
  final String sourceImage;
  final String roadmap;
  final String link;

   const Paths({
   required this.id,
    required this.name,
    required this.description,
    required this.sourceImage,
    required this.roadmap,
    required this.link,
  });

  // Map<dynamic, String> toStrings() => {
  //       'id': id,
  //       'name': name,
  //       'description': description,
  //       'sourceImage': sourceImage,
  //       'roadmap': roadmap,
  //       'link': link,
  //     };
}
