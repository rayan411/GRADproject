import 'package:bridge/models/users.dart';
import 'package:bridge/services/user_Services.dart';
import 'package:bridge/widgets/textField/textFeild.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/Colors/colors.dart';
import 'package:provider/provider.dart';
import '../../appData/app_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //firebase cuurent user--------------------------------------
  final user = FirebaseAuth.instance.currentUser!;
  final userData = readUsers();

  @override
  Widget build(BuildContext context) {
    if (Provider.of<AppData>(context).completePathes.isEmpty) {
      return SafeArea(
          child: Column(
        children: [
          headerOfProfile(),
          Image(
            image: AssetImage("images/hot-air-balloon.png"),
            color: Colors.black12,
          )
        ],
      ));
    } //end if
    else {
      return SafeArea(
        child: Column(
          children: [
            headerOfProfile(),
            Expanded(
              child: Consumer<AppData>(
                builder: (context, appData, child) {
                  return ListView.builder(
                    itemCount: appData.completePathes.length,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          AchiveBottom(
                            name: appData.completePathes[index].name,
                            pathID: appData.completePathes[index].id,
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }

//-------------------------    header   Of  Profile     --------------------------------------------------------------------------------
  Padding headerOfProfile() {
    final controllerName = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile Page',
                style: TextStyle(
                  color: ColorBox.Color50,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              InkWell(
                  onTap: () => FirebaseAuth.instance.signOut(),
                  child: Icon(
                    Icons.logout_outlined,
                    size: 32,
                  ))
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Image(
            image: const AssetImage('images/user.png'),
            height: 200,
            width: 200,
            color: ColorBox.Color50,
          ),
          // FutureBuilder<UserModel?>(
          //   future: readUser(),
          //   builder: (context , snapshot) {
          //    if(snapshot.hasError){
          //     return Text('has errore');

          //    }
          //    else if (snapshot.hasData){
          //       final usersingle= snapshot.data;

          //       return usersingle==null
          //       ? Center(child: Text('no user'),)
          //       :buildUser(usersingle);
          //     }else{
          //       return Center(child: CircularProgressIndicator());
          //     }
          //   },

          // ),
          const SizedBox(
            height: 8,
          ),
          //firebasse operation-----------------------------------------------------------
          Text(
            user.displayName ?? 'No add name',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorBox.Color50),
          ),
         // const Text("Signed In AS"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, color: ColorBox.Color50,),
              const SizedBox(
                width: 4,
              ),
              Text(
                user.email!,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorBox.Color50),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          //firebase operation-----------------------------------------------------------
          const Divider(),
          Row(
            children: [
              const Image(
                image: AssetImage("images/cardAchiv.png"),
                height: 44,
                width: 44,
              ),
              const SizedBox(
                width: 2,
              ),
              Text(
                "Achievement",
                style: TextStyle(
                  color: ColorSelect.Color1,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              )
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

Widget buildUser(UserModel user) => ListTile(
      title: Text(user.name),
    );

class AchiveBottom extends StatelessWidget {
  final String name;
  final String pathID;
  const AchiveBottom({
    Key? key,
    required this.name,
    required this.pathID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 350,
        height: 72,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ColorBox.Color40,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                  image: AssetImage("images/achive.png"),
                  height: 48,
                  width: 44,
                  // color: Color.fromARGB(255, 175, 153, 9),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: ColorSelect.Color5,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                SizedBox(),
                InkWell(
                  onTap: (() {
                    Provider.of<AppData>(context, listen: false)
                        .mangeComoletePath(pathID);
                  }),
                  child: Icon(
                    Provider.of<AppData>(context, listen: false).isComplete(
                            pathID) // return true if "id" Is it in the favorites list
                        ? Icons.cancel
                        : Icons.star_border_outlined,
                    color: ColorSelect.Color1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
