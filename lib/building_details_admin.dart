import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:society/AdminDashboard.dart';
import 'dart:convert';
import 'package:society/add_building.dart';
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
      home:buildingdetails_admin(),
    );
  }
}

class buildingdetails_admin extends StatefulWidget {
  @override
  String code;
  String r_id;
  String name;
  buildingdetails_admin({this.code,this.r_id,this.name});
  _buildingdetails_adminState createState() => _buildingdetails_adminState(code,r_id,name);
}

class _buildingdetails_adminState extends State<buildingdetails_admin> {
  String code;
  String r_id;
  String name;
  _buildingdetails_adminState(this.code,this.r_id,this.name);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/buildingdetails.php", body: {
      'code':code,
    });
    return json.decode(response.body);
  }

  void backpressed() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
        new AdminDashboard(
          r_id: r_id, name: name, code: code,)));
  }

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
        body: FutureBuilder<List>(
          future: getdata(),
          builder: (context, snapshot){
            if(snapshot.hasError) {
              print(snapshot.error);
            }
            if (snapshot.hasData){
              return Items(list:snapshot.data,r_id: r_id,code: code,name: name,);
            }
            else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class Items extends StatefulWidget {
  List list;
  String r_id;
  String code;
  String name;
  Items({this.list,this.r_id,this.code,this.name});

  @override
  _ItemsState createState() => _ItemsState(r_id,code,name);
}

class _ItemsState extends State<Items> {
  String r_id;
  String code;
  String name;
  _ItemsState(this.r_id,this.code,this.name);
  String bname;
  String pin;
  String address;
  String landmark;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list==null?0:widget.list.length,
        itemBuilder: (context,index){
          bname=widget.list[index]['name'];
          pin=widget.list[index]['pin'];
          address=widget.list[index]['address'];
          landmark=widget.list[index]['landmark'];

          return Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.redAccent,
                  backgroundImage: AssetImage('images/Residencedashboard/building.png'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Table(
                    children: [
                      TableRow(children: [
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Building Number:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.list[index]['code'],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                      ]),
                      TableRow(children: [
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Building Name :',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.list[index]['name'],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                      ]),
                      TableRow(children: [
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Pincode:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.list[index]['pin'],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                      ]),
                      TableRow(children: [
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Address',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.list[index]['address'],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                      ]),
                      TableRow(children: [
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Landmark:',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(widget.list[index]['landmark'],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                          ),
                        ),),
                      ]),
                    ],
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new Building(r_id: r_id,code: code,name: name,bname: bname,pin: pin,address:address,landmark: landmark,)));
                  },
                  color: Colors.redAccent,
                  child: Text(
                    'Edit ',
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
                ),//table
              ],
            ),
          );
        }
    );
  }
}