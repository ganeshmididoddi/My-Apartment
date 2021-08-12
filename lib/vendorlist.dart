import 'package:flutter/material.dart';
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
      home: Vendorlist(),
    );
  }
}

class Vendorlist extends StatefulWidget {
  String value;
  String code;
  String r_id;
  String name;
  Vendorlist({this.value,this.code,this.r_id,this.name});
  @override
  _VendorlistState createState() => _VendorlistState(value,code,r_id,name);
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

class _VendorlistState extends State<Vendorlist> {
  String value;
  String code;
  String r_id;
  String name;
  _VendorlistState(this.value,this.code,this.r_id,this.name);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/get_vendorsdetails.php",body: {
      'value':value,
      'code': code,
    });
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$value'),
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData){
            return Items(list:snapshot.data,r_id: r_id,name: name,code: code,);
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
  String name;
  Items({this.list,this.r_id,this.code,this.name});

  @override
  _ItemsState createState() => _ItemsState(r_id,code,name);
}

class _ItemsState extends State<Items> {
  String r_id;
  String code;
  String name;
  String id;
  _ItemsState(this.r_id,this.code,this.name);
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
                  Text("Name    : "+widget.list[index]['name'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20.0,),
                  Text("Number  : "+widget.list[index]['number'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20.0,),
                  Text("Address : "+widget.list[index]['address'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20.0,),
                  Text("Cost    : "+widget.list[index]['cost'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 20.0,),
                  Container(
                    alignment: Alignment.center,
                    color: Colors.green,
                    child: ListTile(
                      leading: Icon(Icons.phone),
                      title: Text(widget.list[index]['number']),
                      onTap: (){
                        dail(widget.list[index]['number']);
                      },
                    ),
                  ),
                ],
              )
          );
        }
    );
  }
}


