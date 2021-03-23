import 'package:assignment/api/api.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService{
  final Api api;
  ApiService({this.api});

  Future getList({String queryString})async{
    final Response response = await http.get(api.endpoint(query:queryString));
    if(response.statusCode == 200){
      final Map<String,dynamic> map = json.decode(response.body);
      if(map.isNotEmpty){
        final List<dynamic> list = map["hits"];
        return list;
      }
    }
  }

  

  Future getDetail({int objId})async{
    final Response response = await http.get(api.itemEndpoint(id:objId));
    if(response.statusCode == 200){
      final Map<String,dynamic> map = json.decode(response.body);
      if(map.isNotEmpty){
        return map;
      }
    }
  }

}