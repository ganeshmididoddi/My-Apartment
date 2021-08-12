import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:society/view_notice_admin.dart';

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
      home:addnotice(),
    );
  }
}

class addnotice extends StatefulWidget {
  @override
  String code;
  String r_id;
  String name;
  addnotice({this.code,this.r_id,this.name});
  _addnoticeState createState() => _addnoticeState(code,r_id,name);
}

class _addnoticeState extends State<addnotice> {
  String code;
  String r_id;
  String name;
  _addnoticeState(this.code,this.r_id,this.name);

  void registration() async{
    var url = "http://192.168.100.7/phpfiles/add_notice.php";
   await http.post(url, body: {
      "subject": subjectController.text,
      "description": descriptionController.text,
     "code": code,
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Notice added successfully"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new viewnoticeadmin(code: code,r_id: r_id,name:name,)));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void backpressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => new viewnoticeadmin(code: code,r_id: r_id,name:name,)));
  }

  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        backpressed();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Notice"),
          leading:IconButton(icon: Icon(
            Icons.arrow_back,
          ),
            onPressed: (){
              backpressed();
            },),
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
                            controller: subjectController,
                            validator: (value){
                              return  value== "" ? "Enter Subject": null;
                            },
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
      ),
    );
  }
}
