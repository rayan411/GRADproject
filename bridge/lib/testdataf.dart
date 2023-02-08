import 'package:bridge/services/user_Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'models/users.dart';

class Datateset extends StatelessWidget {
  const Datateset({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ff')),
      body: StreamBuilder<List<UserModel>>(
            stream: readUsers(),
            builder: ((context, snapshot) {
              if(snapshot.hasError){
                return Text("hasError");
                print(snapshot.hasError);
              }
              else if(snapshot.hasData){
                final userData=snapshot.data!;
                return Column(
                  children:userData.map(buildUser).toList(),
                );
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }

            }
            )),

    );
    
  }
}
  Widget buildUser(UserModel user) =>ListTile(
  title: Text(user.name),
);