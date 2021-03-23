import 'package:assignment/Screens/postdetail.dart';
import 'package:assignment/api/apiservices.dart';
import 'package:assignment/model/databyid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchContr = TextEditingController();

  List<dynamic> searchResult;

  handleSearch({String userQuery}) async {
    final List<dynamic> userlist =
        await Provider.of<ApiService>(context, listen: false)
            .getList(queryString: userQuery);
    setState(() {
      searchResult = userlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: searchContr,
            onSubmitted: (val) => handleSearch(userQuery: val),
            decoration: InputDecoration(
              hintText: 'search',
              suffixIcon: GestureDetector(
                  onTap: () {
                    searchContr.clear();
                  },
                  child: Icon(
                    Icons.cancel,
                    color: Colors.black,
                  )),
            ),
          ),
        ),
        body: searchResult == null
            ? Container(
                child: Center(child: Text('No items match your search')),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ListView.builder(
                    itemCount: searchResult.length,
                    itemBuilder: (context, index) {
                      Data data = Data.fromJson(searchResult[index]);

                      return Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Card(
                          shadowColor: Colors.grey,
                          elevation: 3,
                          child: ListTile(
                            tileColor: Color(0xffFFF9EC),
                            title: Text(data.title),
                            subtitle: Text(data.objectId),
                            onTap: () async {
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostDetails(
                                        id: int.parse(data.objectId)),
                                  ));
                            },
                          ),
                        ),
                      );
                    }),
              ));
  }
}
