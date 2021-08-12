import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:society/amenities_admin.dart';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:addamenities(),
    );
  }
}

class addamenities extends StatefulWidget {
  String code;
  String type;
  String r_id;
  String name;
  String title;
  String number;
  String description;
  String month;
  String quarterly;
  String year;
  String amenities_type;
  String id;
  String open;
  addamenities({this.code,this.type,this.r_id,this.name,this.title,this.number,this.description,this.month,this.quarterly,this.year,this.amenities_type,this.id,this.open});
  @override
  _addamenitiesState createState() => _addamenitiesState(code,type,r_id,name,title,number,description,month,quarterly,year,amenities_type,id,open);
}

class _addamenitiesState extends State<addamenities> {
  String code;
  String type;
  String r_id;
  String name;
  String title;
  String number;
  String description;
  String month;
  String quarterly;
  String year;
  String amenities_type;
  String id;
  String open;
  _addamenitiesState(this.code,this.type,this.r_id,this.name,this.title,this.number,this.description,this.month,this.quarterly,this.year,this.amenities_type,this.id,this.open);

  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController monthlyController = TextEditingController();
  TextEditingController quarterlyController = TextEditingController();
  TextEditingController yearlyController = TextEditingController();


  void initState(){
    super.initState();
    nameController=TextEditingController(text: title);
    numberController=TextEditingController(text: number);
    descriptionController=TextEditingController(text: description);
    monthlyController=TextEditingController(text: month);
    quarterlyController=TextEditingController(text: quarterly);
    yearlyController=TextEditingController(text: year);
  }

  void registration() async{
    var url = "http://192.168.100.7/phpfiles/$open.php";
    final response=await http.post(url, body: {
      "id":id,
      "code": code,
      "name": nameController.text,
      "number": numberController.text,
      "description": descriptionController.text,
      "monthly": monthlyController.text,
      "quarterly": quarterlyController.text,
      "yearly": yearlyController.text,
      "type": amenities_type,

    });
    var data=jsonDecode(response.body);
    if(data=="Success"){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Amenity added/edited successfully"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new aminities_admin(code:code,r_id: r_id,type: type,name: name,)));
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
  void backpressed(){
    print(type);
    Navigator.push(context, MaterialPageRoute(builder: (context) => new aminities_admin(code:code,r_id: r_id,type: type,name: name,)));
  }


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        backpressed();
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Add Amenities'),
            leading:IconButton(icon: Icon(
              Icons.arrow_back,
            ),
              onPressed: (){
                backpressed();
              },),
          ),
          body: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              color: Colors.white,
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child:Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Title",
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
                              controller: nameController,
                              validator: (value){
                                return  value== "" ? "Enter Name of the Amenity": null;
                              },
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
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      )

                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Contact Number",
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
                              keyboardType: TextInputType.number,
                              validator: (value){
                                return  value== "" ? "Enter Proper Number": null;
                              },
                              controller: numberController,
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
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Description",
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
                                return  value== "" ? "Enter some Description": null;
                              },
                              controller: descriptionController,
                              maxLines: 5,
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
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Monthly Cost",
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
                              controller: monthlyController,
                              keyboardType: TextInputType.number,
                              validator: (value){
                                return  value== "" ? "Enter cost": null;
                              },
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
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Quarterly Cost",
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
                              keyboardType: TextInputType.number,
                              validator: (value){
                                return  value== "" ? "Enter cost": null;
                              },
                              controller: quarterlyController,
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
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Enter Yearly Cost",
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
                              controller: yearlyController,
                              keyboardType: TextInputType.number,
                              validator: (value){
                                return  value== "" ? "Enter cost": null;
                              },
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
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
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
            ),
          ],
          ),
      ),
    );
  }
}
