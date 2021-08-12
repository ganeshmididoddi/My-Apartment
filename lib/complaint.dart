import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:society/ResidenceDashboard.dart';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:complaint(),
    );
  }
}


class complaint extends StatefulWidget {
  String code;
  String name;
  String r_id;
  complaint({this.code,this.name,this.r_id});
  @override
  _complaintState createState() => _complaintState(code,name,r_id);
}

class _complaintState extends State<complaint> {
  String code;
  String name;
  String r_id;
  _complaintState(this.code,this.name,this.r_id);

  void registration() {
    var url = "http://192.168.100.7/phpfiles/register_complaint.php";
    http.post(url, body: {
      "code": code,
      "subject": subjectController.text,
      "description": descriptionController.text,

    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Complaint Registered successfully"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new ResidenceDashboard(r_id: r_id,name: name,code: code,)));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Register a complaint"),
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
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Subject",
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
                              return  value== "" ? "Enter Subject": null;
                            },
                            controller: subjectController,
                            maxLines: 2,
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
                    height: 40.0,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Description",
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
                              return  value== "" ? "Enter Description": null;
                            },
                            controller: descriptionController,
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
                            maxLines: 13,
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
                        registration();
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
