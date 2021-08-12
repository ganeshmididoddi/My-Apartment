import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:society/AdminDashboard.dart';
import 'package:society/edit_profile.dart';
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
      home: view_profile(),
    );
  }
}

class view_profile extends StatefulWidget {
  @override
  String r_id;
  String name;
  String code;
  String type;
  view_profile({this.r_id,this.name,this.code,this.type});
  _view_profileState createState() => _view_profileState(r_id,name,code,type);
}


class _view_profileState extends State<view_profile> {
    String r_id;
    String name;
    String code;
    String type;
  _view_profileState(this.r_id,this.name,this.code,this.type);

  Future<List> getdata() async {
    final response = await http.post("http://192.168.100.7/phpfiles/view_profile.php", body: {
     'r_id':r_id,
    });
    return json.decode(response.body);
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
          builder: (context) => new SuperadminDashboard( r_id: r_id, name: name, code: code,)));
    }
  }


    @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        // ignore: missing_return,
        backpressed();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
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
              return Items(list:snapshot.data,r_id: r_id,type: type,);
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
  String type;
  Items({this.list,this.r_id,this.type});

  @override
  _ItemsState createState() => _ItemsState(r_id,type);
}

class _ItemsState extends State<Items> {
  String r_id;
  String type;
  _ItemsState(this.r_id,this.type);
  String name;
  String email;
  String number;
  String code;
  String roomno;
  String profession;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list==null?0:widget.list.length,
        itemBuilder: (context,index){
          name=widget.list[index]['name'];
          email=widget.list[index]['email'];
          number=widget.list[index]['ph_number'];
          code=widget.list[index]['code'];
          roomno=widget.list[index]['room_no'];
          profession=widget.list[index]['profession'];


          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                CircleAvatar(
                  radius: 70.0,
                  backgroundColor: Colors.redAccent,
                  backgroundImage: AssetImage('images/Residencedashboard/profile.png'),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: Table(
                    children: [
                      TableRow(children: [
                        Center(child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 0.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Name :',
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
                            child: Text('$name',
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
                            child: Text('Email-ID:',
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
                            child: Text('$email',
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
                            child: Text('Phone No.:',
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
                            child: Text('$number',
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
                            child: Text('Building No.:',
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
                            child: Text('$code',
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
                            child: Text('Room No.:',
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
                            child: Text('$roomno',
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
                            child: Text('Profession:',
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
                            child: Text('$profession',
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
                            child: Text('Saying as:',
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
                            child: Text(widget.list[index]['type'],
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
                ), //table
                SizedBox(
                  height: 30.0,
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => new edit_profile(r_id:r_id,name: name,email: email,
                    number: number,code: code,roomno: roomno,profession: profession,type: type,)));
                  },
                  color: Colors.redAccent,
                  child: Text(
                    'Edit Profile',
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
          );
        }
    );
  }
}