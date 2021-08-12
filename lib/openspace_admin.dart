import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;
import 'package:society/add_openspace.dart';
import 'package:society/bookopenspace.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
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
      home: openspace_admin(),
    );
  }
}

void dail(String number) async{
  var url="tel:${number.toString()}";
  if ( await canLaunch(url)){
    await launch(url);
  }
  else{
    throw "not place call";
  }
}


class openspace_admin extends StatefulWidget {
  String type;
  String r_id;
  String code;
  String amenities_type;
  String name;
  openspace_admin({this.type,this.r_id,this.code,this.amenities_type,this.name});
  @override
  _openspace_adminState createState() => _openspace_adminState(type,r_id,code,amenities_type,name);
}

class _openspace_adminState extends State<openspace_admin> {
  String type;
  String r_id;
  String code;
  String amenities_type;
  String name;
  String value;
  _openspace_adminState(this.type,this.r_id,this.code,this.amenities_type,this.name);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/amenities_view.php",body: {
      'code':code,
      'type':amenities_type,
    });
    return json.decode(response.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Open Space'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData){
            return Items(list:snapshot.data,r_id: r_id,code:code,name: name,type: type,);
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
  String code;
  String type;
  String name;
  Items({this.list,this.r_id,this.code,this.type,this.name});

  @override
  _ItemsState createState() => _ItemsState(r_id,code,type,name);
}

class _ItemsState extends State<Items> {
  String r_id;
  String code;
  String type;
  String name;
  String amenities_id;
  _ItemsState(this.r_id,this.code,this.type,this.name);

  delete() {
    var url = "http://192.168.100.7/phpfiles/delete_amenities.php";
    http.post(url, body: {
      "id": amenities_id,
    });
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Success'),
        content:Text(
            " Amenity Deleted Successfully"
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            color: Colors.redAccent,
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list==null?0:widget.list.length,
        itemBuilder: (context,index){
          return SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 250.0,
                    width: MediaQuery.of(context).size.width,
                    child: Carousel(
                      boxFit: BoxFit.cover,
                      images: [
                        AssetImage('images/Aminities/openspace1.png'),
                        AssetImage('images/Aminities/openspace2.png'),
                        AssetImage('images/Aminities/openspace3.png'),
                        AssetImage('images/Aminities/openspace4.png'),
                      ],
                      autoplay: false,
                      dotSize: 4.0,
                      indicatorBgPadding: 4.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(widget.list[index]['name'],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Description',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(widget.list[index]['description'],
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: (){
                      dail(widget.list[index]['number']);
                    },
                    child: ListTile(
                      title: Text(widget.list[index]['number']),
                      leading: Icon(
                        Icons.phone,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Cost : " +widget.list[index]['openspacecharge']+"per Day",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => new bookopenspace(r_id: r_id,)));
                    },
                    color: Colors.redAccent,
                    child: Text(
                      'Book Open Space',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            amenities_id=widget.list[index]["id"];
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new add_openspace(r_id: r_id,code: code,id: amenities_id,
                              title:widget.list[index]['name'],
                              number: widget.list[index]['number'],description:widget.list[index]['description'],
                              cost:widget.list[index]['openspacecharge'],name: name,type: type,
                              amenities_type: "OpenSpace",open:"edit_openspace")));
                        },
                        color: Colors.redAccent,
                        child: Text(
                          'Edit',
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
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: new Text("Are you Sure you want to Delete?"),
                                actions: <Widget>[
                                  FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        amenities_id=widget.list[index]['id'];
                                      });
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
                        color: Colors.redAccent,
                        child: Text(
                          'Delete',
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
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}