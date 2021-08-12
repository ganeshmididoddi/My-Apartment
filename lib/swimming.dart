import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;
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
      home: swimming(),
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


class swimming extends StatefulWidget {
  String type;
  String r_id;
  String code;
  String amenities_type;
  swimming({this.type,this.r_id,this.code,this.amenities_type});
  @override
  _swimmingState createState() => _swimmingState(type,r_id,code,amenities_type);
}

class _swimmingState extends State<swimming> {
  String type;
  String r_id;
  String code;
  String value;
  String amenities_type;
  _swimmingState(this.type,this.r_id,this.code,this.amenities_type);

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
        title: Text('Swimming Pool'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData){
            return Items(list:snapshot.data,r_id: r_id,code:code,);
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
  Items({this.list,this.r_id,this.code});

  @override
  _ItemsState createState() => _ItemsState(r_id,code);
}

class _ItemsState extends State<Items> {
  String r_id;
  String code;
  String amenities_id;
  String amenities_name;
  String inc;
  String amount;
  _ItemsState(this.r_id,this.code);

  registration() {
    var url = "http://192.168.100.7/phpfiles/add_membership.php";
    http.post(url, body: {
      "amenities_id": amenities_id,
      "amenities_name": amenities_name,
      "r_id": r_id,
      "code": code,
      "amount": amount,
      "inc": inc,
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Registered successfully"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
                        AssetImage('images/Aminities/swimming1.png'),
                        AssetImage('images/Aminities/swimming2.png'),
                        AssetImage('images/Aminities/swimming3.png'),
                        AssetImage('images/Aminities/swimming4.png'),
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
                      child:  Text('Description',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(20.0),
                    child: Table(
                      border: TableBorder.all(color: Colors.black),
                      children: [
                        TableRow(children: [
                          Center(child: Text('DURATION')),
                          Center(child: Text('COST')),
                          Center(child: Text('Apply')),
                        ]),
                        TableRow(children: [
                          Center(child: Text("MONTHLY")),
                          Center(child: Text(widget.list[index]['monthly'])),
                          Center(
                            child:RaisedButton(
                              onPressed: () {
                                setState(() {
                                  amenities_id=widget.list[index]['id'];
                                  amenities_name=widget.list[index]['name'];
                                  amount=widget.list[index]['monthly'];
                                  inc="1";
                                });
                                registration();
                              },
                              color: Colors.redAccent,
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(child: Text('QUARTERLY')),
                          Center(child: Text(widget.list[index]['quarterly'])),
                          Center(
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  amenities_id=widget.list[index]['id'];
                                  amenities_name=widget.list[index]['name'];
                                  amount=widget.list[index]['quarterly'];
                                  inc="1";
                                });
                                registration();
                              },
                              color: Colors.redAccent,
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                            ),
                          ),
                        ]),
                        TableRow(children: [
                          Center(child: Text('YEAR')),
                          Center(child: Text(widget.list[index]['yearly'])),
                          Center(
                            child: RaisedButton(
                              onPressed: () {
                                setState(() {
                                  amenities_id=widget.list[index]['id'];
                                  amenities_name=widget.list[index]['name'];
                                  amount=widget.list[index]['yearly'];
                                  inc="1";
                                });
                                registration();
                              },
                              color: Colors.redAccent,
                              child: Text(
                                'Apply',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
                            ),
                          ),
                        ])
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