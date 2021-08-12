import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:society/admindashboard_for_superadmin.dart';

class view_admins extends StatefulWidget {
  String code;
  view_admins({this.code,});
  @override
  _view_adminsState createState() => _view_adminsState(code,);
}

class _view_adminsState extends State<view_admins> {
  String code;
  _view_adminsState(this.code,);
  @override
  Widget build(BuildContext context) {
    Future<List> getdata() async{
      final response= await http.post("http://192.168.100.7/phpfiles/get_admins.php",body: {
        "code":code,
      });
      return json.decode(response.body);
    }


    return Scaffold(
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
  Items({this.list,});

  @override
  _ItemsState createState() => _ItemsState();
}


class _ItemsState extends State<Items> {
  String id;
  String r_id;
  String name;
  String code;

  delete()  {
    var url ="http://192.168.100.7/phpfiles/delete_member.php";
    http.post(url,body:{
      "id":id,
    });
  }
  Future<List> admin() async{
    final response= await http.post("http://192.168.100.7/phpfiles/get_admins_for_superadmin.php",body: {
      "id":id,
    });
    var data= json.decode(response.body);
    r_id=data[0]['id'];
    name=data[0]['name'];
    code=data[0]['code'];
    Navigator.push(context, MaterialPageRoute(builder: (context) => new admindashboard_for_superadmin(name: name,code: code,r_id: r_id,)));

  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list==null?0:widget.list.length,
        itemBuilder: (context,index){
          return Center(
            child: InkWell(
              onTap: (){
                setState(() {
                  id=widget.list[index]['id'];
                });
               admin();
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.details),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.list[index]['name'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),),
                        Text(widget.list[index]['email']),
                      ],
                    ),
                    InkWell(
                      child: Icon(Icons.delete),
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: new Text("Are you Sure you want to Delete?"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    setState(() {
                                      id=widget.list[index]['id'];
                                    });
                                    print(id);
                                    Navigator.pop(context);
                                    delete();
                                  },
                                  child: Text('YES'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('NO'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
