import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: member_profile(),
    );
  }
}


class member_profile extends StatefulWidget {
 String id;
  member_profile({this.id});
  @override
  _member_profileState createState() => _member_profileState(id);
}

class _member_profileState extends State<member_profile> {
  String id;
  _member_profileState(this.id,);
  @override
  Widget build(BuildContext context) {
    Future<List> getdata() async{
      final response= await http.post("http://192.168.100.7/phpfiles/view_profile.php",body: {
        "r_id":id,
      });
      return json.decode(response.body);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData){
            return Items(list:snapshot.data,r_id: id,);
          }
          else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


class Items extends StatefulWidget {
  List list;
  String r_id;
  Items({this.list,this.r_id});
  @override
  _ItemsState createState() => _ItemsState(r_id);
}

class _ItemsState extends State<Items> {
  String r_id;
  _ItemsState(this.r_id);
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
                  height: 20.0,
                ),
              ],
            ),
          );
        }
    );
  }
}