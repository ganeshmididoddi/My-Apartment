import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:society/my_membership_detail.dart';


class my_membership_view extends StatefulWidget {
  String r_id;
  String type;
  my_membership_view({this.r_id,this.type});
  @override
  _my_membership_viewState createState() => _my_membership_viewState(r_id,type);
}

class _my_membership_viewState extends State<my_membership_view> {

  String r_id;
  String type;
  _my_membership_viewState(this.r_id,this.type);
  @override
  Widget build(BuildContext context) {
    Future<List> getdata() async{
      final response= await http.post("http://192.168.100.7/phpfiles/get_list_membership.php",body: {
        "r_id":r_id,
        "type":type,
      });
      return json.decode(response.body);
    }


    return Scaffold(
      body: FutureBuilder<List>(
        future: getdata(),
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print(snapshot.error);
          }
          if (snapshot.hasData){
            return Items(list:snapshot.data,r_id: r_id,);
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
  Items({this.list,this.r_id});

  @override
  _ItemsState createState() => _ItemsState(r_id);
}


class _ItemsState extends State<Items> {
  String r_id;
  String id;
  _ItemsState(this.r_id);

  delete()  {
    var url ="http://192.168.100.7/phpfiles/delete_membership.php";
    http.post(url,body:{
      "id":id,
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.list==null?0:widget.list.length,
        itemBuilder: (context,index){
          return Center(
            child: InkWell(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Icon(Icons.details),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(widget.list[index]['amenities_name']),
                        Text(widget.list[index]['start_date']+"-"+widget.list[index]['start_date']),
                      ],
                    ),
                    InkWell(
                      child: Icon(Icons.delete),
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
                                    print(id);
                                   delete();
                                    Navigator.pop(context);
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
                  ],
                ),
              ),
              onTap: (){
                setState(() {
                  id=widget.list[index]['id'];
                });
                if(widget.list[index]['payment']=="notpaid"){
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Review'),
                      content:Text(
                          "Pending for Payment Approval"
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
                else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => new membershipview(id: id,)));
                }
              },
            ),
          );
        }
    );
  }
}
