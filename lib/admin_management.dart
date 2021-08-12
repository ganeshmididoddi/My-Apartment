import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:society/approve_admin.dart';
import 'dart:convert';
import 'package:society/view_admins.dart';



void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: admin_management (),
    );
  }
}
class admin_management extends StatefulWidget {
  String code;
  admin_management({this.code});
  @override
  _admin_managementState createState() => _admin_managementState(code);
}

class _admin_managementState extends State<admin_management> with SingleTickerProviderStateMixin {
  String code;
  _admin_managementState(this.code);

  Future<List> getdata() async{
    final response= await http.post("http://192.168.100.7/phpfiles/get_registered.php", body: {
      'code':code,
    });
    return json.decode(response.body);
  }

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'Admin Management',),
        bottomOpacity: 1,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            new Tab(text: "Approve Admin",),
            new Tab(text: "All Admins",),
          ],),

      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          new approve_admins(code: code,),
          new view_admins(code: code,),
        ],
      ),
    );
  }
}
