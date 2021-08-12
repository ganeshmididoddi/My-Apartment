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
      home:viewcomplaint(),
    );
  }
}
class viewcomplaint extends StatefulWidget {
  String code;
  viewcomplaint({this.code});
  @override
  _viewcomplaintState createState() => _viewcomplaintState(code);
}

class _viewcomplaintState extends State<viewcomplaint> {
  String code;
  _viewcomplaintState(this.code);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/view_complaint.php", body: {
      "code": code,
    });
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaints'),
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
          return Card(
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text("Date : "+widget.list[index]['date'],
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text("Time : "+widget.list[index]['time'],
                          style: TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.bold,
                          ),),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Subject: ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(widget.list[index]['subject'],
                    style: TextStyle(
                      fontSize: 20.0,
                    ),),
                  SizedBox(height: 30.0,),
                  Text("Description  : ",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 10.0,),
                  Text(widget.list[index]['description'],
                    style: TextStyle(
                      fontSize: 20.0,
                    ),),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              )
          );
        }
    );
  }
}