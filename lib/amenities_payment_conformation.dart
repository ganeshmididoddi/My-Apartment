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
      home: amenities_payment (),
    );
  }
}
class amenities_payment extends StatefulWidget {
  String code;
  amenities_payment({this.code});
  @override
  _amenities_paymentState createState() => _amenities_paymentState(code);
}

class _amenities_paymentState extends State<amenities_payment> {
  String code;
  _amenities_paymentState(this.code);
  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/amenities_payment.php", body: {
      'code':code,
    });
    return json.decode(response.body);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership Payment'),
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

   received()  {
    var url ="http://192.168.100.7/phpfiles/amenities_payment_approve.php";
    http.post(url,body:{
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
                  Text("Amenity Name  : "+widget.list[index]['amenities_name'],
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
                  Text("Amount        : "+widget.list[index]['amount'],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),),
                  SizedBox(height: 30.0,),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        id=widget.list[index]['id'];
                      });
                      print(id);
                      received();
                    },
                    color: Colors.redAccent,
                    child: Text(
                      'Recieved',
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
              )
          );
        }
    );
  }
}