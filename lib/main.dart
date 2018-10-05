import 'package:flutter/material.dart';
import 'signup.dart';
import 'login.dart';
import 'home.dart';
import 'supporter_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    ListPage.tag: (context) => ListPage(),
    SignUpPage.tag: (context) => SignUpPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mee Pya Tike',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}
