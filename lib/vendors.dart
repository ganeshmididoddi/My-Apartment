import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:society/emergency.dart';
import 'package:society/vendorlist.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
      home: Vendors(),
    );
        }
}
class Vendors extends StatefulWidget {
  String code;
  Vendors({this.code});
  @override
  _VendorsState createState() => _VendorsState(code);
}

class _VendorsState extends State<Vendors> {
  @override
  String value;
  String code;
  _VendorsState(this.code);

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
      Navigator.push(context, MaterialPageRoute(builder: (context) => new Vendorlist(value:value,code:code)));
    }
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendors'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
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
                          title: CircleAvatar(
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
                          title:  CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage('images/Vendor/plumber.png',),
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
                  height: 30.0,
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
                        width: MediaQuery.of(context).size.width/3,
                        child: ListTile(
                          title:
                          CircleAvatar(
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
                          title:  CircleAvatar(
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
                          title:CircleAvatar(
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
    );
  }
}
