import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Application(),
    );
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  final List<String> members=['Committee Member','Event Member','Secretory'];
  String selectedmember="Committee Member";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Application for Membership"),
      ),
      body: Container(
        margin: EdgeInsets.all(50.0),
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('Name: ',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('ganesh',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "Select your Role as:",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Container(
                width: 370,
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: DropdownButton<String>(
                  value: selectedmember,
                  onChanged: (value){
                    setState(() {
                      selectedmember=value;
                    });
                  },
                  items: members.map<DropdownMenuItem<String>>((value){
                    return DropdownMenuItem(
                      child: Text(value,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),),
                      value: value ,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              RaisedButton(
                onPressed: () {

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
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              ),
            ],
          ),
        ),
      )
    );
  }
}
