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
      debugShowCheckedModeBanner: false,
      home:buildingdetails(),
    );
  }
}

class buildingdetails extends StatefulWidget {
  @override
  String code;

  buildingdetails({this.code,});
  _buildingdetailsState createState() => _buildingdetailsState(code,);
}

class _buildingdetailsState extends State<buildingdetails> {
  String code;
  _buildingdetailsState(this.code,);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/buildingdetails.php", body: {
      'code':code,
    });
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Building Details'),
      ),
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData){
            return Items(list:snapshot.data,);
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
  Items({this.list});

  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list==null?0:widget.list.length,
        itemBuilder: (context,index){
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
                ), //table
              ],
            ),
          );
        }
    );
  }
}