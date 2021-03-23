import 'dart:ffi';

import 'package:assignment/api/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostDetails extends StatefulWidget {
  final int id;
  PostDetails({this.id});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  Map<String, dynamic> data;
  List<dynamic> childList;

  @override
  void initState() {
    super.initState();
    getdetails();
    getChildrenList();
  }

  Future getdetails() async {
    final Map<String, dynamic> detail =
        await Provider.of<ApiService>(context, listen: false)
            .getDetail(objId: widget.id);
    setState(() {
      data = detail;
      print(widget.id);
    });
  }

  Future getChildrenList() async {
    final Map<String, dynamic> detail =
        await Provider.of<ApiService>(context, listen: false)
            .getDetail(objId: widget.id);
    final List<dynamic> list = detail["children"];
    setState(() {
      childList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 45, left: 5, right: 5),
      child: Column(children: [
        data != null
            ? ListTile(
                title: Text(data['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                subtitle: Text(data['points'].toString()),
              )
            : Container(),

        Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.75,
            child: childList != null  
            ? ListView.builder(
                itemCount: childList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    child:Card(
                      elevation: 5,
                      child: ListTile(
                        tileColor: Color(0xfffff5cc),
                        title: Text(childList[index]["author"]??'null',),
                        subtitle: Text(childList[index]["id"].toString()??'null'),
                      ),
                    ),
                  );
                })
                : Center(child: Text('Loading...',style: TextStyle(fontSize: 20),)),
          ),
        )
      ]),
    ));
  }
}
