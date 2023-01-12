import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../widgets/Colors/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Profile Page',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 84, 123),
              fontWeight: FontWeight.bold),
        ),
      ), 
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
            Row(
              children: [
                Icon( Icons.badge,size: 24,color:ColorSelect.Color2,),
                const SizedBox(width: 8,),
                Text("Achievement", style: TextStyle(
                    color:ColorSelect.Color2,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    ),)],),
            const Divider(),
             const SizedBox(height: 126,),

            Image(image: AssetImage("images/hot-air-balloon.png"),color: Colors.black12,)
            
          ],
        ),
      ),
    );
  }
}