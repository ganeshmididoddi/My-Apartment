import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:society/AdminDashboard.dart';
import 'package:society/emergency.dart';
import 'package:society/vendorlist_admin.dart';
import 'package:society/addvendor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class vendoradmin extends StatefulWidget {
  String code;
  String r_id;
  String name;
  vendoradmin({this.code,this.r_id,this.name});
  @override
  _vendoradminState createState() => _vendoradminState(code,r_id,name);
}

class _vendoradminState extends State<vendoradmin> {
  String code;
  String r_id;
  String name;
  String value;
  _vendoradminState(this.code,this.r_id,this.name);


  void backpressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => new AdminDashboard(code: code,r_id: r_id,name:name,)));
  }

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/vendor_check.php",body: {
      "code":code,
      "value":value,
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
    }else if(data=="data"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => new Vendorlist_admin(value:value,code:code,r_id: r_id,name:name,)));
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
          title: Text('Vendors'),
          leading:IconButton(icon: Icon(
            Icons.arrow_back,
          ),
            onPressed: (){
              backpressed();
            },),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(

                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            value="Electrician";
                          });
                          getdata();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: ListTile(
                            title:CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/Vendor/electrician.png'),
                            ),

                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text('Electrician',
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
                            value="Plumber";
                          });
                          getdata();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: ListTile(
                            title:CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/Vendor/plumber.png'),
                            ),
                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text('Plumber',
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
                            value="Renovation";
                          });
                          getdata();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: ListTile(
                            title: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/Vendor/renovation.png'),
                            ),
                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text('Renovation',
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
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            value="Cable";
                          });
                          getdata();
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width/3,
                          child: ListTile(
                            title:CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/Vendor/cable.png'),
                            ),
                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text('Cable',
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
                            value="Cater";
                          });
                          getdata();
                        },
                        child: Container(
                          width: 130.0,
                          child: ListTile(
                            title: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/Vendor/cater.png'),
                            ),
                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text('Caters',
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
                            value="Carpenter";
                          });
                          getdata();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: ListTile(
                            title: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/Vendor/carpenter.png'),
                            ),
                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text('Carpenter',
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
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          setState(() {
                            value="Decorator";
                          });
                          getdata();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          child: ListTile(
                            title:CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/Vendor/decorator.png'),
                            ),

                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text('Decorators',
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new emergency()));
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width/3,
                          child: ListTile(
                            title: CircleAvatar(
                              radius: 50.0,
                              backgroundImage: AssetImage('images/Vendor/emergency.png'),
                            ),
                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text('Emergency',
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
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new Addvendor(code: code,r_id: r_id,name: name,open: "addvendor",id: "",)));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
