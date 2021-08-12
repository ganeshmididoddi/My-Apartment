import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:society/view_member_profile.dart';

class view_members extends StatefulWidget {
  String code;
  view_members({this.code});
  @override
  _view_membersState createState() => _view_membersState(code);
}

class _view_membersState extends State<view_members> {
  String code;
  _view_membersState(this.code);
  @override
  Widget build(BuildContext context) {
    Future<List> getdata() async{
      final response= await http.post("http://192.168.100.7/phpfiles/get_members.php",body: {
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
  String r_id;
  Items({this.list,this.r_id});

  @override
  _ItemsState createState() => _ItemsState(r_id);
}


class _ItemsState extends State<Items> {
  String r_id;
  String id;
  _ItemsState(this.r_id);

  delete()  {
    var url ="http://192.168.100.7/phpfiles/delete_member.php";
    http.post(url,body:{
      "id":id,
    });
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => new member_profile(id: id,)));
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
