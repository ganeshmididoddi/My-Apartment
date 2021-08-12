import 'package:flutter/material.dart';
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
      home: emergency(),
    );
  }
}

class emergency extends StatefulWidget {
  @override
  _emergencyState createState() => _emergencyState();
}

class _emergencyState extends State<emergency> {
  String number;
  @override
  Widget build(BuildContext context) {


    void dail(String number) async{
      var url="tel:${number.toString()}";
      if ( await canLaunch(url)){
        await launch(url);
      }
      else{
        throw "not place call";
      }
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Card(
                  child: ListTile(
                    onTap: (){
                      dail("100");
                    },
                    leading: Icon(Icons.leak_add),
                    title: Text('Police'),
                    subtitle: Text('100'),
                    trailing: Icon(Icons.call),
                  ),

              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                    child: ListTile(
                      onTap: (){
                        dail("102");
                      },
                      leading: Icon(Icons.leak_add),
                      title: Text('Ambulance'),
                      subtitle: Text('102'),
                      trailing: Icon(Icons.call),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                    child: ListTile(
                      onTap: (){
                        dail("101");
                      },
                      leading: Icon(Icons.leak_add),
                      title: Text('Fire'),
                      subtitle: Text('101'),
                      trailing: Icon(Icons.call),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                    child: ListTile(
                      onTap: (){
                        dail("1091");
                      },
                      leading: Icon(Icons.leak_add),
                      title: Text('Senior Citizen Helpline'),
                      subtitle: Text('1091'),
                      trailing: Icon(Icons.call),
                    ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
