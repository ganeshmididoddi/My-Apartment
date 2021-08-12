import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:society/approve_members.dart';
import 'package:society/view_members.dart';


void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserManagement (),
    );
  }
}
class UserManagement extends StatefulWidget {
  String code;
  UserManagement({this.code});
  @override
  _UserManagementState createState() => _UserManagementState(code);
}

class _UserManagementState extends State<UserManagement> with SingleTickerProviderStateMixin {
  String code;
  _UserManagementState(this.code);

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
        title: Text( 'User Management',),
        bottomOpacity: 1,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            new Tab(text: "Approve Members",),
            new Tab(text: "All Members",),
          ],),

      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          new approve_members(code: code,),
          new view_members(code: code,)
        ],
      ),
    );
  }
}
