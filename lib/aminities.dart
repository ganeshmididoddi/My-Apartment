import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:society/gym.dart';
import 'package:society/my_membership.dart';
import 'package:society/openspace.dart';
import 'package:society/swimming.dart';
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
      home:aminities(),
    );
  }
}

class aminities extends StatefulWidget {
  String code;
  String r_id;
  aminities({this.code,this.r_id});
  @override
  _aminitiesState createState() => _aminitiesState(code,r_id);
}

class _aminitiesState extends State<aminities> {
  String code;
  String r_id;
  String amenities_type;
  _aminitiesState(this.code,this.r_id);
  @override

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/amenities_admin.php",body: {
      'code':code,
      'type':amenities_type,
    });
    var data= json.decode(response.body);
    if (data=="add"){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Ops'),
          content: Text(
              "No Data Available to Show"
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              color: Colors.redAccent,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      });
    }else if(data=="data"&& amenities_type=="GYM"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new gym(code:code,amenities_type: amenities_type,r_id: r_id,)));
    }else if(data=="data"&& amenities_type=="Swimming Pool"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new swimming(code:code,amenities_type: amenities_type,r_id: r_id,)));
    }
    else if(data=="data"&& amenities_type=="OpenSpace"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new openspace(code:code,amenities_type: amenities_type,r_id: r_id,)));
    }
  }



  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Amenities'),
      ),
      body:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:Container(
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                            child: Text('Swimming\n pool',
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
        ) ,
      )
      
    );
  }
}
