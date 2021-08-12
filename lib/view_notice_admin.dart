import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:society/AdminDashboard.dart';
import 'dart:convert';
import 'package:society/add_notice.dart';

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
      home:viewnoticeadmin(),
    );
  }
}

class viewnoticeadmin extends StatefulWidget {
  String code;
  String r_id;
  String name;
  viewnoticeadmin({this.code,this.r_id,this.name});
  @override
  _viewnoticeadminState createState() => _viewnoticeadminState(code,r_id,name);
}

class _viewnoticeadminState extends State<viewnoticeadmin> {
  String code;
  String r_id;
  String name;
  _viewnoticeadminState(this.code,this.r_id,this.name);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/view_notice.php",body: {
      'code': code,
    });
    return json.decode(response.body);
  }

  void backpressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => new AdminDashboard(code: code,r_id: r_id,name:name,)));
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: (){
        backpressed();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notice'),
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
              return Items(list:snapshot.data);
            }
            else
              return Center(child: CircularProgressIndicator());
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => new addnotice(code: code,r_id: r_id,name: name,)));
          },
        ),
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
