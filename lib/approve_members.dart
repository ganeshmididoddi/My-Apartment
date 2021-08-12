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
      home: approve_members (),
    );
  }
}
class approve_members extends StatefulWidget {
  String code;
  approve_members({this.code});
  @override
  _approve_membersState createState() => _approve_membersState(code);
}

class _approve_membersState extends State<approve_members> with SingleTickerProviderStateMixin {
  String code;
  _approve_membersState(this.code);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/get_registered.php", body: {
      'code':code,
    });
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return Center(
              child: Center(child: CircularProgressIndicator()),
            );
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
  String id;

  approve()  {
    var url ="http://192.168.100.7/phpfiles/approve.php";
    http.post(url,body:{
      "id":id,
    });
  }
  reject() {
    var url = "http://192.168.100.7/phpfiles/reject.php";
    http.post(url, body: {
      "id":id,
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list==null?0:widget.list.length,
        itemBuilder: (context,index){
          return Card(
              color: Colors.blueGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Name            : "+widget.list[index]['name'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20.0,),
                  Text("Building no. : "+widget.list[index]['code'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20.0,),
                  Text("Room no.     : "+widget.list[index]['roomno'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20.0,),
                  Text("UserType     : "+widget.list[index]['usertype'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          id=widget.list[index]['id'];
                          approve();
                        },
                        color: Colors.redAccent,
                        child: Text(
                          'Approve',
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
                      RaisedButton(
                        onPressed: () {
                          id=widget.list[index]['id'];
                          reject();
                        },
                        color: Colors.redAccent,
                        child: Text(
                          'Reject',
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
                ],
              )
          );
        }
    );
  }
}