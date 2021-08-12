import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/services.dart';
import 'package:society/buildingdetails.dart';
import 'package:society/changepassword.dart';
import 'package:society/complaint.dart';
import 'package:society/main.dart';
import 'package:society/vendors.dart';
import 'package:society/view_notice.dart';
import 'package:society/view_profile.dart';
import 'package:society/aminities.dart';


void main() {
  runApp(
      MyApp()
  );
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

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResidenceDashboard (),
    );
  }
}
class ResidenceDashboard extends StatefulWidget {
  String name;
  String code;
  String r_id;
  ResidenceDashboard({this.name,this.r_id,this.code});
  @override
  _ResidenceDashboardState createState() => _ResidenceDashboardState(name,r_id,code);
}

class _ResidenceDashboardState extends State<ResidenceDashboard> {
  String name;
  String r_id;
  String code;
  DateTime time;
  _ResidenceDashboardState(this.name,this.r_id,this.code);

  void choiceAction(String choice){
   if(choice==constants.profie){
     Navigator.push(context, MaterialPageRoute(builder: (context) => new view_profile(r_id: r_id,name: name,code: code,type: "Residence",)));
   }if(choice==constants.logout){
     Navigator.push(context, MaterialPageRoute(builder: (context) => new Login()));
   }if(choice==constants.change){
     Navigator.push(context, MaterialPageRoute(builder: (context) => new changepass(r_id: r_id,name: name,code: code,type: "Residence",)));
   }
  }

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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onback,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Hello,$name'),
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
                child: Text('Hello $name'),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('My Profile'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new view_profile(r_id: r_id,name: name,code: code,type: "Residence",)));
                },
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Building Details'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new buildingdetails(code: code,)));
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notice'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new viewnotice(code: code,)));
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Vendor'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Vendors(code: code,)));
                },
              ),
              ListTile(
                leading: Icon(Icons.error_outline),
                title: Text('Complaint'),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new complaint(code: code,name: name,r_id: r_id,)));
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
          child: Container(
            width: MediaQuery.of(context).size.width,
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
                  Row(
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new buildingdetails(code: code,)));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new aminities(code: code,r_id: r_id,)));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new viewnotice(code: code,)));
                            },
                          ),
                        ),
                      ),
                    ],
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new Vendors(code: code,)));
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => new complaint(code: code,r_id: r_id,name: name,)));
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
                              child: Text('Maintenance Bills',
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
          ),
        ),
      ),
    );
  }
}


