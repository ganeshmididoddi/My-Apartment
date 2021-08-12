import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:society/addvendor.dart';
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
      home: Vendorlist_admin(),
    );
  }
}

class Vendorlist_admin extends StatefulWidget {
  String value;
  String code;
  String r_id;
  String name;
  Vendorlist_admin({this.value,this.code,this.r_id,this.name});
  @override
  _Vendorlist_adminState createState() => _Vendorlist_adminState(value,code,r_id,name);
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

class _Vendorlist_adminState extends State<Vendorlist_admin> {
  String value;
  String code;
  String r_id;
  String name;
  _Vendorlist_adminState(this.value,this.code,this.r_id,this.name);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/get_vendorsdetails.php",body: {
      'value': value,
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

  delete() {
    var url = "http://192.168.100.7/phpfiles/delete_vendor.php";
    http.post(url, body: {
      "id":id,
    });
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Success'),
        content:Text(
            " Vendor Deleted Successfully"
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
      return Card(
        color: Colors.blueGrey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: InkWell(
                        child: Align(
                            alignment:Alignment.centerRight,
                            child: Icon(Icons.mode_edit)),
                        onTap: (){
                          id=widget.list[index]['id'];
                          Navigator.push(context, MaterialPageRoute(builder: (context) => new Addvendor(id: id,r_id: r_id,name: name,code: code,
                            vname:widget.list[index]['name'],
                          number: widget.list[index]['number'],address:widget.list[index]['address'],
                            cost:widget.list[index]['cost'],open:"edit_vendor",)));
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      child: Align(
                          alignment:Alignment.centerRight,
                          child: Icon(Icons.delete)),
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
                  ),
                ),
              ],
            ),
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


