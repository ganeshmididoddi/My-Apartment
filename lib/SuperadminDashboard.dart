import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:society/admin_management.dart';
import 'package:society/changepassword.dart';
import 'package:society/main.dart';
import 'package:society/view_profile.dart';

void main(){
  runApp(
    Myapp(),
  );
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SuperadminDashboard(),
    );
  }
}

class SuperadminDashboard extends StatefulWidget {
  String name;
  String code;
  String r_id;
  SuperadminDashboard({this.name,this.code,this.r_id});
  @override
  _SuperadminDashboardState createState() => _SuperadminDashboardState(name,code,r_id);
}
class  constants{
  static const String profie="My Profie";
  static const String change ="Change Password";
  static const String logout ="Logout";

  static const List<String> choices = <String>[
    profie,
    change,
    logout
  ];
}
class _SuperadminDashboardState extends State<SuperadminDashboard> {
  String name;
  String code;
  String r_id;
  _SuperadminDashboardState(this.name,this.code,this.r_id);
  @override
  Widget build(BuildContext context) {


    Future <bool>_onback() {
      return showDialog(context: context,builder: (context)=>AlertDialog(
        title: Text("Exit App"),
        actions: <Widget>[
          FlatButton(
            child: Text("No"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text("Yes"),
            onPressed: (){
              SystemNavigator.pop();
            },
          )
        ],
      ));
    }


    void choiceAction(String choice){
      if(choice==constants.profie){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new view_profile(r_id: r_id,name: name,code: code,type: "SuperAdmin",)));
      }if(choice==constants.logout){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new Login()));
      } if(choice==constants.change){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new changepass(r_id: r_id,name: name,code: code,type: "SuperAdmin",)));
      }
    }

    return WillPopScope(
      onWillPop: _onback,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SuperAdmin'),
          actions: <Widget>[
            PopupMenuButton<String>(
              icon: Icon(Icons.person),
              onSelected: choiceAction,
              itemBuilder: (BuildContext context){
                return constants.choices.map((String choice){
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Text('Hello,$name'),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("My Profile"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new view_profile(r_id: r_id,name: name,code: code,type: "SuperAdmin",)));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Admin Management"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new admin_management(code: code,)));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Logout"),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new Login()));
                    },
                  ),
                ]
            ),
        ),
        body: Container(),
      ),
    );
  }
}
