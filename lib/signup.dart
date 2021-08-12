import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:society/main.dart';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Signup (),
    );
  }
}
class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Signup> {
  int id = 1;
  String radioitem = 'Residence';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController p1Controller = TextEditingController();
  TextEditingController p2Controller = TextEditingController();
  TextEditingController superadmincode = TextEditingController();


  Future<List> registration() async {
    var url = "http://192.168.100.7/phpfiles/signup.php";
    final response=await http.post(url, body: {
      "name": nameController.text,
      "email": emailController.text,
      "password": p1Controller.text,
      "code": codeController.text,
      "superadmincode":superadmincode.text,
      "roomno": roomController.text,
      "usertype": radioitem,
    });
    var data=jsonDecode(response.body);
    if(data=="Email Exist"){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Email Already registered,please Login"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Login()));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }else if(p1Controller.text!=p2Controller.text){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Password Mismatch"),
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
    }
    else if (data=="Success"){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Registered Successfully"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new Login()));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Center(
                    child: TextFormField(
                      validator: (value){
                        return  value== "" ? "Enter Name": null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Enter Full Name',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)
                          )
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Center(
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        return  value== "" ? "Enter email": null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)
                          )
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Center(
                    child: TextFormField(
                      validator: (value){
                        return  value== "" ? "Enter Password": null;
                      },
                      controller: p1Controller,
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)
                          )
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Center(
                    child: TextFormField(
                      validator: (value){
                        return  value== "" ? "Re-enter Password": null;
                      },
                      controller: p2Controller,
                      decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)
                          )
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Center(
                    child: TextFormField(
                      validator: (value){
                        return  value== "" ? "Enter Apartment Code": null;
                      },
                      controller: codeController,
                      decoration: InputDecoration(
                          hintText: 'Enter your Apartment Code.',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)
                          )
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Center(
                    child: TextFormField(
                      validator: (value){
                        return  value== "" ? "Enter Room no.": null;
                      },
                      controller: roomController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Room no',
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent)
                          )
                      ),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: id,
                            onChanged: (val){
                              setState(() {
                                radioitem='Residence';
                                id=1;
                              });
                            },
                          ),
                          Flexible(
                            child: Text(
                                'Residence'
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: id,
                            onChanged: (val){
                              setState(() {
                                radioitem='Admin';
                                id=2;
                              });
                            },
                          ),
                          Flexible(
                            child: Text(
                              'Admin',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      child: Row(
                        children: <Widget>[
                          Radio(
                            value: 3,
                            groupValue: id,
                            onChanged: (val){
                              setState(() {
                                radioitem='SuperAdmin';
                                id=3;
                              });
                            },
                          ),
                          Flexible(
                            child:  Text(
                              'SuperAdmin',
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                RaisedButton(
                  onPressed: () {
                    if (id!=2 && _formKey.currentState.validate()) {
                      registration();
                    }else{
                      print("no");
                    }
                    if(id==2 && _formKey.currentState.validate()){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text('Enter SuperAdmin Code'),
                          content: TextFormField(
                            validator: (value){
                              return  value== "" ? "Enter SuperAdmin Code": null;
                            },
                            controller: superadmincode,
                            decoration: InputDecoration(
                                hintText: 'Ask Super Admin for the code'
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Submit'),
                              color: Colors.redAccent,
                              onPressed: (){
                                registration();
                              },
                            )
                          ],
                        );
                      });
                    }
                  },
                  color: Colors.redAccent,
                  child: Text(
                    'Register',
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
        ),
      )
    );
  }
}