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
      home: membershipview(),
    );
  }
}

class membershipview extends StatefulWidget {
  String r_id;
  String id;
  membershipview({this.r_id,this.id});
  @override
  _membershipviewState createState() => _membershipviewState(r_id,id);
}

class _membershipviewState extends State<membershipview> {
  String r_id;
  String id;
  _membershipviewState(this.r_id,this.id);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/membership_view.php",body: {
      "id":id,
    });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Membership'),
      ),
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData){
            return Items(list:snapshot.data);
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
          return Center(
            child: Card(
              color: Colors.blueGrey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: Text('Membership Card',
                        style:TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text('"'+widget.list[index]['amenities_name']+'"',
                      style:TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                      ),),
                    SizedBox(
                      height: 20.0,
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
                                child: Text('Name:',
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
                                child: Text('Start Date :',
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
                                child: Text(widget.list[index]['start_date'],
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
                                child: Text('End Date:',
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
                                child: Text(widget.list[index]['end_date'],
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
                  ],
                ),
              ),
          );
        }
    );
  }
}