import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:society/building_details_admin.dart';
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
      home: Building(),
    );
  }
}
class Building extends StatefulWidget {
  String code;
  String r_id;
  String name;
  String bname;
  String pin;
  String address;
  String landmark;
  Building({this.code,this.r_id,this.name,this.bname,this.pin,this.address,this.landmark});
  @override
  _BuildingState createState() => _BuildingState(code,r_id,name,bname,pin,address,landmark);
}

class _BuildingState extends State<Building> {
  String code;
  String r_id;
  String name;
  String bname;
  String pin;
  String address;
  String landmark;
  _BuildingState(this.code,this.r_id,this.name,this.bname,this.pin,this.address,this.landmark);

  TextEditingController bnoController = TextEditingController();
  TextEditingController bnameController = TextEditingController();
  TextEditingController pinController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController landController = TextEditingController();


  void initState(){
    super.initState();
    bnoController=TextEditingController(text:code);
    bnameController=TextEditingController(text:bname);
    pinController=TextEditingController(text:pin);
    addressController=TextEditingController(text:address);
    landController=TextEditingController(text:landmark);
  }
  void add() async{
    var url = "http://192.168.100.7/phpfiles/add_building.php";
    await http.post(url, body: {
      'code':code,
      'name':bnameController.text,
      'pin':pinController.text,
      'add':addressController.text,
      'land':landController.text,

    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Building added/edited successfully"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                backpressed();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


  void backpressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => new buildingdetails_admin(code: code,r_id: r_id,name:name,)));
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
          title: Text('Building Details'),
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Building Number",
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
                                  enabled: false,
                                  controller: bnoController,
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
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Enter Building Name.",
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
                                    return  value== "" ? "Enter Building Name": null;
                                  },
                                  controller: bnameController,
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
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Enter Pincode.",
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
                                    return  value== "" ? "Enter pincode": null;
                                  },
                                  controller: pinController,
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
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Enter Address.",
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
                                    return  value== "" ? "Enter Address": null;
                                  },
                                  controller: addressController,
                                  maxLines: 3,
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
                          padding: EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Enter Landmark.",
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
                                    return  value== "" ? "Enter landmark": null;
                                  },
                                  controller: landController,
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
                              // upload(picked_image);
                              add();
                            }else{
                              print("no");
                            }
                          },
                          color: Colors.redAccent,
                          child: Text(
                            'Save',
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
      ),
    );
  }
}
