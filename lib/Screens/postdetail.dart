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

  @override
  void initState() {
    super.initState();
    getdetails();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35, left: 10, right: 10),
        child: Center(
          child: data != null? ListTile(
            tileColor: Color(0xfffff5cc),
            title: Text(data['title']),
            subtitle: Text(data['points'].toString()),
          ):CircularProgressIndicator()
        ),
      ),
    );
  }
}
