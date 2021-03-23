import 'package:assignment/Screens/homepage.dart';
import 'package:assignment/api/api.dart';
import 'package:assignment/api/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => ApiService(api: Api()),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Sen'),
          
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

//