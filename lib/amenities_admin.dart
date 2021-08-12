import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:society/AdminDashboard.dart';
import 'package:society/ResidenceDashboard.dart';
import 'package:society/SuperadminDashboard.dart';
import 'package:society/add_amenities.dart';
import 'package:society/add_openspace.dart';
import 'package:society/amenities_payment_conformation.dart';
import 'package:society/gym_admin.dart';
import 'package:society/my_membership.dart';
import 'package:society/openspace_admin.dart';
import 'package:society/swimming_admin.dart';
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
      home:aminities_admin(),
    );
  }
}

class aminities_admin extends StatefulWidget {
  String code;
  String r_id;
  String name;
  String type;
  aminities_admin({this.code,this.r_id,this.name,this.type});
  @override
  _aminities_adminState createState() => _aminities_adminState(code,r_id,name,type);
}

class _aminities_adminState extends State<aminities_admin> {
  String code;
  String r_id;
  String name;
  String type;
  String amenities_type;
  _aminities_adminState(this.code,this.r_id,this.name,this.type);


  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/amenities_admin.php",body: {
      'code':code,
      'type':amenities_type,
    });
    var data= json.decode(response.body);
    if(data =="add" && amenities_type=="OpenSpace"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new add_openspace(code:code,name: name,type: type,r_id: r_id, amenities_type: amenities_type,id: "",open: "add_openspace",)));
    }
    else if (data=="add"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new addamenities(code:code,name: name,type: type,r_id: r_id, amenities_type: amenities_type,id: "",open: "add_amenities",)));
    }
    else if(data=="data"&& amenities_type=="GYM"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new gym_admin(code:code,amenities_type: amenities_type,r_id: r_id,type: type,name: name,)));
    }
    else if(data=="data"&& amenities_type=="Swimming Pool"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new swimming_admin(code:code,amenities_type: amenities_type,r_id: r_id,type: type,name: name,)));
    }
    else if(data=="data"&& amenities_type=="OpenSpace"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new openspace_admin(code:code,amenities_type: amenities_type,r_id: r_id,type: type,name: name,)));
    }
  }

  void backpressed() {
    print(type);
    if (type == "Residence") {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => new ResidenceDashboard(
            r_id: r_id, name: name, code: code,)));
    }else if(type=="Admin"){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => new AdminDashboard(
            r_id: r_id, name: name, code: code,)));
    } else{
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => new SuperadminDashboard()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        backpressed();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Amenities'),
          leading:IconButton(icon: Icon(
            Icons.arrow_back,
          ),
            onPressed: (){
              backpressed();
            },),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new amenities_payment(code: code,)));
                  },
                  child: Text('Approve Memberships',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      onTap: (){
                        setState(() {
                          amenities_type='GYM';
                        });
                        getdata();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: ListTile(
                          title: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage('images/Aminities/gym.png'),
                          ),
                          subtitle: Container(
                            alignment: Alignment.topCenter,
                            child: Text('GYM',
                              style:TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          amenities_type='Swimming Pool';
                        });
                        getdata();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: ListTile(
                          title:  CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage('images/Aminities/swimming.png',),
                          ),
                          subtitle: Container(
                            alignment: Alignment.topCenter,
                            child: Text('Swimming\n Pool',
                              style:TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          amenities_type='OpenSpace';
                        });
                       getdata();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: ListTile(
                          title: CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage('images/Aminities/openspace.png'),
                          ),
                          subtitle: Container(
                            alignment: Alignment.topCenter,
                            child: Text('Open Space',
                              style:TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new my_membership(r_id: r_id,)));
                  },
                  child: Text('My Memberships',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
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
