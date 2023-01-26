import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/Colors/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //firebase cuurent user--------------------------------------
  final user = FirebaseAuth.instance.currentUser!;

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
        actions: [ElevatedButton(onPressed: () => FirebaseAuth.instance.signOut(),
          style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Colors.blue),),          
          child:  Icon( Icons.logout, )
           //: const Text("Sign out")
          )],
      ), 
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:  [
          const Icon(Icons.account_circle, size: 72,),
          const   Text("Signed In AS" ),
          const SizedBox(height: 8,),
          //firebase operation-----------------------------------------------------------
          Text(
            user.email!,
            style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8,),
          
          //firebase operation-----------------------------------------------------------
          const Divider(),
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