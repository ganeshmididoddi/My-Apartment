import 'package:flutter/material.dart';
import 'package:society/my_memership_view.dart';

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
      home: my_membership(),
    );
  }
}

class my_membership extends StatefulWidget {
  String r_id;
  my_membership({this.r_id});
  @override
  _my_membershipState createState() => _my_membershipState(r_id);
}

class _my_membershipState extends State<my_membership> with SingleTickerProviderStateMixin {

  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }

  String r_id;
  _my_membershipState(this.r_id);
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text( 'My Memberships',),
        bottomOpacity: 1,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            new Tab(text: "GYM",),
            new Tab(text: "Swimming Pool",),
            new Tab(text: "Open Space",),
          ],),

      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          new my_membership_view(r_id: r_id,type: "GYM",),
          new my_membership_view(r_id: r_id,type: "Swimming Pool",),
          new my_membership_view(r_id: r_id,type: "OpenSpace",),
        ],),

    );
  }
}



