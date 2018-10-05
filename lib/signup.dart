import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  static String tag = 'signup-page';

  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final body = Container(
      child: new Center(
        child: Column(
          children: <Widget>[SignupPage()],
        ),
      ),
    );

    return Scaffold(
      body: body,
    );
  }

  Widget SignupPage() {
    return new Container(

    );
  }
}
