import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:society/UserManagement.dart';
import 'package:society/add_building.dart';
import 'package:society/amenities_admin.dart';
import 'package:society/building_details_admin.dart';
import 'package:society/changepassword.dart';
import 'package:society/view_notice_admin.dart';
import 'package:society/view_profile.dart';
import 'package:society/viewcomplaint.dart';
import 'package:society/vendoradmin.dart';
import 'main.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AdminDashboard(),
    );
  }
}
class AdminDashboard extends StatefulWidget {
  String name;
  String code;
  String r_id;
  AdminDashboard({this.name,this.code,this.r_id});
  @override
  _AdminDashboardState createState() => _AdminDashboardState(name,code,r_id);
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

class _AdminDashboardState extends State<AdminDashboard> {
  DateTime time;
  String name;
  String code;
  String r_id;
  _AdminDashboardState(this.name,this.code,this.r_id);

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

  Future<List> getdata() async {
    final response = await http.post(
        "http://192.168.100.7/phpfiles/check_building.php", body: {
      'code': code,
    });
    var data = json.decode(response.body);
    if (data == "add") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => new Building(code: code,r_id: r_id,name: name,)));
    }else if (data=="data"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new buildingdetails_admin(code: code,r_id: r_id,name: name,)));
    }
  }
  void choiceAction(String choice){
    if(choice==constants.profie){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new view_profile(r_id: r_id,name: name,code: code,type: "Admin",)));
    }if(choice==constants.logout){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new Login()));
    } if(choice==constants.change){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new changepass(r_id: r_id,name: name,code: code,type: "Admin",)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onback,
      child: Scaffold(
        appBar: AppBar(
            title: Text("Admin"),
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
                title: Text('My Profile'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new view_profile(r_id: r_id,name: name,code: code,type: "Admin",)));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Building Management'),
                onTap: (){
                  getdata();
                },
              ),
              ListTile(
                leading: Icon(Icons.supervised_user_circle),
                title: Text('User Management'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new UserManagement(code: code,)));
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notice'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new viewnoticeadmin(code: code,r_id: r_id,name: name,)));
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Vendor'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new vendoradmin(code: code,r_id: r_id,name: name,)));
                },
              ),
              ListTile(
                leading: Icon(Icons.error_outline),
                title: Text('Complaints'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new viewcomplaint(code: code,)));
                },
              ),
              ListTile(
                leading: Icon(Icons.fitness_center),
                title: Text('Amenities'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new aminities_admin(code: code,r_id: r_id,name: name,type: "Admin",)));
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('Logout'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Login()));
                },
              ),

            ],
          ),
      ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: 300.0,
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    images: [
                      AssetImage('images/Residencedashboard/residence3.png'),
                      AssetImage('images/Residencedashboard/residence1.png'),
                      AssetImage('images/Residencedashboard/residence2.png'),
                      AssetImage('images/Residencedashboard/residence4.png'),
                    ],
                    autoplay: false,
                    dotSize: 4.0,
                    indicatorBgPadding: 4.0,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Container(

                  child: Column(
                   children: <Widget>[
                     Container(
                       width: MediaQuery.of(context).size.width,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                           InkWell(
                             child: Container(
                               width: MediaQuery.of(context).size.width/3,
                               child: ListTile(
                                 title:CircleAvatar(
                                   radius: 50.0,
                                   backgroundImage: AssetImage("images/Residencedashboard/building.png"),
                                 ),
                                 subtitle: Container(
                                   alignment: Alignment.topCenter,
                                   child: Text('Building\n Details',
                                     style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       color: Colors.black,
                                     ),),
                                 ),
                                 onTap: (){
                                   getdata();
                                 },
                               ),
                             ),
                           ),
                           InkWell(
                             child: Container(
                               width: MediaQuery.of(context).size.width/3,
                               child: ListTile(
                                 title: CircleAvatar(
                                   radius: 50.0,
                                   backgroundImage: AssetImage('images/Residencedashboard/aminities.png'),
                                 ),
                                 subtitle: Container(
                                   alignment: Alignment.topCenter,
                                   child: Text('Amenities',
                                     style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       color: Colors.black,
                                     ),),
                                 ),
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => new aminities_admin(code: code,r_id: r_id,name: name,type: "Admin",)));
                                 },
                               ),
                             ),
                           ),
                           InkWell(
                             child: Container(
                               width: MediaQuery.of(context).size.width/3,
                               child: ListTile(
                                 title: CircleAvatar(
                                   radius: 50.0,
                                   backgroundImage: AssetImage('images/Residencedashboard/notification.png'),
                                 ),
                                 subtitle: Container(
                                   alignment: Alignment.topCenter,
                                   child: Text('Notice',
                                     style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       color: Colors.black,
                                     ),),
                                 ),
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => new viewnoticeadmin(code: code,r_id: r_id,name: name,)));
                                 },
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                     SizedBox(
                       height: 30.0,
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: <Widget>[
                         InkWell(
                           child: Container(
                             width: MediaQuery.of(context).size.width/3,
                             child: ListTile(
                               title: CircleAvatar(
                                 radius: 50.0,
                                 backgroundImage: AssetImage('images/Residencedashboard/vendor.png'),
                               ),
                               subtitle: Container(
                                 alignment: Alignment.topCenter,
                                 child: Text('Vendor',
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                   ),),
                               ),
                             ),
                           ),
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => new vendoradmin(code: code,r_id: r_id,name: name,)));
                           },
                         ),
                         InkWell(
                           child: Container(
                               width: MediaQuery.of(context).size.width/3,
                             child: ListTile(
                               title: CircleAvatar(
                                 radius: 50.0,
                                 backgroundImage: AssetImage('images/Residencedashboard/complaint.png'),
                               ),
                               subtitle: Container(
                                 alignment: Alignment.topCenter,
                                 child: Text('Complaint',
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                   ),),
                               ),
                               onTap: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => new viewcomplaint(code: code,)));
                               },
                             ),
                           ),
                         ),
                         InkWell(
                           child: Container(
                             width: MediaQuery.of(context).size.width/3,
                             child: ListTile(
                               title: CircleAvatar(
                                 radius: 50.0,
                                 backgroundImage: AssetImage('images/Residencedashboard/maintainence.png'),
                               ),
                               subtitle: Container(
                                 alignment: Alignment.topCenter,
                                 child: Text('Maintenance\n Bills',
                                   style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black,
                                   ),
                                 ),
                               ),
                               onTap: (){
                                 showDialog(
                                   context: context,
                                   builder: (BuildContext context) {
                                     return AlertDialog(
                                       title: new Text("Module development is in process.."),
                                       actions: <Widget>[
                                         FlatButton(
                                           onPressed: () {
                                             Navigator.pop(context);
                                           },
                                           child: Text('OK'),
                                         ),
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
                   ],
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
