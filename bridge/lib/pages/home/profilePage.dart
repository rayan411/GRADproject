import 'package:bridge/models/users.dart';
import 'package:bridge/services/user_Services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../widgets/Buttons/achivebutton.dart';
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
      return Scaffold(
          backgroundColor: ColorSelect.Color1,
          body: ListView(
            children: [
              headerOfProfile(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: const SizedBox(
                  width: 400,
                  child: Image(
                    image: AssetImage("images/hot-air-balloon.png"),
                    color: Colors.black12,
                  ),
                ),
              )
            ],
          ));
    } //end if
    else {
      return Scaffold(
        backgroundColor: ColorSelect.Color1,
        body: Column(
          children: [
            headerOfProfile(),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft:  Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
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
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  color: ColorSelect.Color5,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              InkWell(
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    final provider =
                        Provider.of<AppData>(context, listen: false);
                    provider.logout();
                  },
                  child: Icon(
                    Icons.logout_outlined,
                    size: 32,
                    color: ColorSelect.Color5,
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
            color: ColorSelect.Color5,
          ),
          const SizedBox(
            height: 8,
          ),
          //firebasse operation-----------------------------------------------------------
          Text(
            user.displayName ?? 'No add name',
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: ColorSelect.Color5),
          ),
          // const Text("Signed In AS"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                color: ColorSelect.Color5,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                user.email!,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorSelect.Color5),
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
                  color: ColorSelect.Color5,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildUser(UserModel user) => ListTile(
      title: Text(user.name),
    );
