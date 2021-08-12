import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:society/vendoradmin.dart';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Addvendor(),
    );
  }
}

class Addvendor extends StatefulWidget {
  @override
  String code;
  String r_id;
  String name;
  String vname;
  String number;
  String address;
  String cost;
  String id;
  String open;
  Addvendor({this.code,this.r_id,this.name,this.vname,this.number,this.address,this.cost,this.id,this.open});
  _AddvendorState createState() => _AddvendorState(code,r_id,name,vname,number,address,cost,id,open);
}

class _AddvendorState extends State<Addvendor> {
  String code;
  String r_id;
  String name;
  String vname;
  String number;
  String address;
  String cost;
  String id;
  String open;
  _AddvendorState(this.code,this.r_id,this.name,this.vname,this.number,this.address,this.cost,this.id,this.open);

  final List<String> vendors=['Electrician','Plumber','Renovation','Cater','Carpenter','Decorator','Cable','Emergency'];
  String selectedvendor="Electrician";
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController costController = TextEditingController();

  void initState(){
    super.initState();
    nameController=TextEditingController(text: vname);
    numberController=TextEditingController(text: number);
    addressController=TextEditingController(text: address);
    costController=TextEditingController(text: cost);
  }

  void registration() async{
    var url = "http://192.168.100.7/phpfiles/$open.php";
   await http.post(url, body: {
     "id":id,
     "code": code,
      "name": nameController.text,
      "number": numberController.text,
      "address": addressController.text,
      "cost": costController.text,
      "type": selectedvendor,

    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Vendor added/edited successfully"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => new vendoradmin(code: code,r_id: r_id,name:name,)));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Vendor'),
      ),
      body: SingleChildScrollView(
        child:  Container(
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
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Enter vendor Name",
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
                            return  value== "" ? "Enter vendor name": null;
                          },
                          controller: nameController,
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
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Enter vendor number",
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
                        child: Text("Enter vendor address",
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
                            return  value== "" ? "Enter address": null;
                          },
                          controller: addressController,
                          maxLines: 4,
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
                  height: 30.0,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Enter Visiting Charge",
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
                            return  value== "" ? "Enter the cost": null;
                          },
                          controller: costController,
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
                Text(
                  "Select Vendor Service:",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: DropdownButton<String>(
                    value: selectedvendor,
                    onChanged: (value){
                      setState(() {
                        selectedvendor=value;
                      });
                    },
                    items: vendors.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),),
                        value: value ,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print(code);
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
      )
    );
  }
}
