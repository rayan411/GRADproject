import 'package:bridge/widgets/cards/cardOfPath.dart';
import 'package:bridge/widgets/colors/colors.dart';
import 'package:flutter/material.dart';
import '../../models/paths.dart';
import '../../services/pathServices.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSelect.Color1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomHeader(text: 'What do you wnat to learn?'),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: StreamBuilder<List<Paths>>(
                stream: readPaths(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('has errore');
                  } else if (snapshot.hasData) {
                    final pathsData = snapshot.data!;
                    return ListView(
                      children: pathsData.map(buildPaths).toList(),
                    );
                  } else {
                    return const Center(
                        child: const CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// ---------------------------------------------------------------------- 
class CustomHeader extends StatelessWidget {
  final String text;
  const CustomHeader({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 80.0, left: 30.0, right: 30.0, bottom: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32.0,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildPaths(Paths user) => Card_Of_Path(
      id: user.id,
      name: user.name,
      description: user.description,
      sourceImage: user.sourceImage,
    );
