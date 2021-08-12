import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:http/http.dart' as http;
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
      home: openspace(),
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


class openspace extends StatefulWidget {
  String type;
  String r_id;
  String code;
  String amenities_type;
  openspace({this.type,this.r_id,this.code,this.amenities_type});
  @override
  _openspaceState createState() => _openspaceState(type,r_id,code,amenities_type);
}

class _openspaceState extends State<openspace> {
  String type;
  String r_id;
  String code;
  String amenities_type;
  String value;
  _openspaceState(this.type,this.r_id,this.code,this.amenities_type);

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
  _ItemsState(this.r_id,this.code);
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
                        AssetImage('images/Residencedashboard/build3.png'),
                        AssetImage('images/Residencedashboard/build1.png'),
                        AssetImage('images/Residencedashboard/build.png'),
                        AssetImage('images/Residencedashboard/build2.png'),
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