import'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:society/signup.dart';
import 'package:society/AdminDashboard.dart';
import 'package:society/ResidenceDashboard.dart';
import 'package:http/http.dart' as http;
import 'package:society/SuperadminDashboard.dart';
import 'package:fluttertoast/fluttertoast.dart';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      debugShowCheckedModeBanner: false,
        home: Login(),
      );
  }
}
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Login> {
  int id= 1;
  String msg="";
  String radioitem= 'Residence';
  String name;
  String code;
  String r_id;
  DateTime time;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();


  Future<List> userLogin() async {
    final response = await http.post("http://192.168.100.7/phpfiles/login.php", body: {
      "email": emailController.text,
      "password": passwordController.text,
      "code": codeController.text,
      "usertype": radioitem,
    });
    var datauser = jsonDecode(response.body);
    if(datauser.length==0){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Ops'),
          content:Text(
              "Invalid Credentials Please try again"
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              color: Colors.redAccent,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      });
    }
     else if(datauser[0]['status']=="notactive"){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Review'),
          content:Text(
              "Pending for Approval"
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              color: Colors.redAccent,
              onPressed: (){
                Navigator.pop(context);
              },
            )
          ],
        );
      });
    }
    else{
      if(datauser[0]['usertype']=="Residence" && radioitem=="Residence" && datauser[0]['status']=="active" ){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new ResidenceDashboard(name: name,code: code,r_id: r_id,)));
      } else if(datauser[0]['usertype']=="Admin" && radioitem=="Admin" && datauser[0]['status']=="active"){
        Navigator.push(context, MaterialPageRoute(builder: (context) => new AdminDashboard(name: name,code: code,r_id: r_id,)));
      }else if(datauser[0]['usertype']=="SuperAdmin" && radioitem=="SuperAdmin" && datauser[0]['status']=="active"){
          Navigator.push(context, MaterialPageRoute(builder: (context) => new SuperadminDashboard(name: name,code: code,r_id: r_id,)));
      }
    }
    name= datauser[0]['name'];
    code= datauser[0]['code'];
    r_id=datauser[0]['id'];
  }

  Future<bool> backpressed() async{
    DateTime currenttime=DateTime.now();
    bool backbutton=time==null || currenttime.difference(time)>Duration(seconds: 3);
    if (backbutton){
      time==currenttime;
      Fluttertoast.showToast(msg: "Double Click To Exit",
        backgroundColor: Colors.black,
        textColor: Colors.white,
      );
      return false;
    }else{
      return true;
    }
  }
  Future <bool>_onback() {
    return showDialog(context: context,builder: (context)=>AlertDialog(
      title: Text("Exit App"),
      actions: <Widget>[
        FlatButton(
          child: Text("No"),
          color: Colors.redAccent,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text("Yes"),
          color: Colors.redAccent,
          onPressed: (){
            SystemNavigator.pop();
          },
        )
      ],
    ));
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onback,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Form(
            key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height:150.0,
                  ),
                  Text(
                    'My Apartment',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                   padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextFormField(
                      validator: (value){
                        return  value== "" ? "Enter email": null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Email-id',
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextFormField(
                      validator: (value){
                        return  value== "" ? "Enter Password": null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: 'Enter Your Password',
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextFormField(
                      validator: (value){
                        return  value== "" ? "Enter Apartment code": null;
                      },
                      controller: codeController,
                      decoration: InputDecoration(
                          hintText: 'Enter Apartment Code',
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
                    height: 10.0,
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text('Enter Your Email'),
                              content: TextField(
                                decoration: InputDecoration(
                                    hintText: 'Enter email-id'
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Submit'),
                                  color: Colors.redAccent,
                                  onPressed: (){
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          });
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                            color: Colors.redAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    child: Center(
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            userLogin();
                          }else{
                            print("no");
                          }
                        },
                        color: Colors.redAccent,
                        child: Text(
                          'Login',
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
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Not Registered yet ?',
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new Signup()));
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.redAccent,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
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
