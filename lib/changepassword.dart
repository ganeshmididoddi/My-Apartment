import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:society/AdminDashboard.dart';
import 'package:society/ResidenceDashboard.dart';
import 'package:society/SuperadminDashboard.dart';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:changepass(),
    );
  }
}


class changepass extends StatefulWidget {
  String code;
  String name;
  String r_id;
  String type;
  changepass({this.code,this.name,this.r_id,this.type});
  @override
  _changepassState createState() => _changepassState(code,name,r_id,type);
}

class _changepassState extends State<changepass> {
  String code;
  String name;
  String r_id;
  String type;
  _changepassState(this.code,this.name,this.r_id,this.type);
  void check(){
    if(newpassController.text!=conformpassController.text){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(
              "New Password Mismatch"
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
    }else if(newpassController.text==conformpassController.text){
      changepass();
    }
  }

  Future <List> changepass() async {
    var url = "http://192.168.100.7/phpfiles/changepassword.php";
    final response = await http.post(url, body: {
      "r_id": r_id,
      "password": conformpassController.text,
    });
    var datauser = jsonDecode(response.body);
    String a=datauser[0]['password'];
    print(a);
    if (datauser[0]['password'] != currentpassController.text) {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text(
              "Incorrect Current Password"
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
    }else{
      updatepass();
    }
  }
  void backpressed() {
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

  Future<List> updatepass() async {
    final response = await http.post(
        "http://192.168.100.7/phpfiles/changepassword_approved.php", body: {
      'r_id': r_id,
      'password': conformpassController.text,
    });
    var data = json.decode(response.body);
    if (data == "updated") {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(
              "Password Updated Successfully,"
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              color: Colors.redAccent,
              onPressed: () {
                backpressed();
              },
            )
          ],
        );
      });
    }else if (data == "failed"){
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title: Text('Ops'),
          content: Text(
              "Something went wrong please try again"
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              color: Colors.redAccent,
              onPressed: () {
                backpressed();
              },
            )
          ],
        );
      });
    }
  }

  TextEditingController currentpassController = TextEditingController();
  TextEditingController newpassController = TextEditingController();
  TextEditingController conformpassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Change Password"),
      ),
      body: Container(
          padding: EdgeInsets.all(30.0),
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: 400,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Enter Current Password",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: TextFormField(
                            validator: (value){
                              return  value== "" ? "Enter Current Password": null;
                            },
                            controller: currentpassController,
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              focusedErrorBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 400,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Enter new Password",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: TextFormField(
                            validator: (value){
                              return  value== "" ? "Enter new password": null;
                            },
                            controller: newpassController,
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              focusedErrorBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 400,
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Enter Password Again",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Center(
                          child: TextFormField(
                            validator: (value){
                              return  value== "" ? "Enter new password again": null;
                            },
                            controller: conformpassController,
                            decoration: InputDecoration(
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              focusedErrorBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                                borderSide: BorderSide(color: Colors.redAccent, width: 2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        check();
                      }else{
                        print("no");
                      }
                    },
                    color: Colors.redAccent,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}
