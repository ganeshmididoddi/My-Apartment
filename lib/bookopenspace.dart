import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:bookopenspace(),
    );
  }
}

class bookopenspace extends StatefulWidget {

  String r_id;
  String code;
  String amenities_id;
  String amenities_name;
  bookopenspace({this.r_id,this.code,this.amenities_id,this.amenities_name});
  @override
  _bookopenspaceState createState() => _bookopenspaceState(r_id,code,amenities_id,amenities_name);
}

class _bookopenspaceState extends State<bookopenspace> {

  String r_id;
  String code;
  String amenities_id;
  String amenities_name;

  _bookopenspaceState(this.r_id,this.code,this.amenities_id,this.amenities_name);

  DateTime start_date;
  DateTime end_date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Book Open Space"),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 30.0,
                ),
                Text('Select Date',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.redAccent,
                  child: Column(
                    children: <Widget>[
                      Text('From:',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      ListTile(
                          leading: Icon(Icons.calendar_today),
                          title: Text(start_date== null?'select start Date':DateFormat('yyyy-MM-dd').format(start_date).toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: (){
                            showDatePicker(context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2200),
                            ).then((value) {
                              setState(() {
                                start_date=value;
                              });
                            });
                          }
                      ),
                      Text('To:',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      ListTile(
                          leading: Icon(Icons.calendar_today),
                          title: Text(end_date== null?'select end Date':DateFormat('yyyy-MM-dd').format(end_date).toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: (){
                            showDatePicker(context: context,
                              initialDate: start_date.add(Duration(days: 1)),
                              firstDate: start_date.add(Duration(days: 1)),
                              lastDate: DateTime(2222),
                            ).then((value) {
                              setState(() {
                                end_date=value;
                              });
                            });
                          }
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 50.0,
                ),
                RaisedButton(
                  onPressed: () {
                    showDialog(context: context,builder: (context)=>AlertDialog(
                      title: Text("Module development is in process.."),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("OK"),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ));
                  },
                  color: Colors.redAccent,
                  child: Text(
                    'Book',
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
          )
      ),
    );
  }
}
