import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      width: size.width-80,
      color: Colors.white,
      child: ListView(

        children: [


          Container(
              height: size.height*0.25,
              color: Colors.lime,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // alignment: Alignment.topCenter,

                        height: 80,
                        width: 80,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                AssetImage("assets/profile_user1.jpg")),
                            shape: BoxShape.circle),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                    width: 10,

                  ),
                  Text("RAGAVI",style: TextStyle(fontSize: 18),),

                  SizedBox(
                    height: 20,
                    width: 10,
                  ),

                  Text("test.@gmail.com",style: TextStyle(fontSize: 20),), //
                ],
              )
            //child: Image.asset("assets/profile_user1.jpg"),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("My Profile"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            tileColor: Colors.amber,
            titleTextStyle: TextStyle(fontSize: 20,color: Colors.black),
            onTap: (){
              Navigator.pop(context);
            },
            // textColor: Colors.black,
          ),
          ListTile(
            leading: Icon(Icons.add_alert_sharp),
            title: Text("My Orders"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            tileColor: Colors.amber,
            // textColor: Colors.black,
            titleTextStyle: TextStyle(fontSize: 20,color: Colors.black  ),

          ),
          ListTile(
            leading: Icon(Icons.workspace_premium),
            title: Text("Order History"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            tileColor: Colors.amber,
            // textColor: Colors.black,
            titleTextStyle: TextStyle(fontSize: 20,color: Colors.black  ),

          ),
          ListTile(
            leading: Icon(Icons.video_label),
            title: Text("Privacy Policy"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            tileColor: Colors.amber,
            // textColor: Colors.black,
            titleTextStyle: TextStyle(fontSize: 20,color: Colors.black  ),

          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Edit Profile"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            tileColor: Colors.amber,
            // textColor: Colors.black,
            titleTextStyle: TextStyle(fontSize: 20 ,color: Colors.black ),

          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            tileColor: Colors.amber,
            // textColor: Colors.black,
            titleTextStyle: TextStyle(fontSize: 20 ,color: Colors.black ),

          ),
        ],
      ),
    );

  }
}
