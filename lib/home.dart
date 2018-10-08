import 'package:flutter/material.dart';
import 'login.dart';
import 'style.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {

    final logo = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: CircleAvatar(
          radius: 80.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/bg_info.png'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome from Mee Pya Tike',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 21.0, color: Colors.white,fontWeight: FontWeight.bold),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        ' Mee Pya Tike will take you to brighter future!!',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.0, color: Colors.white),
      ),
    );


    final anonymousRaiseButton = new SizedBox(
      height: 42.0,
      width: 200.0,
      child: RaisedButton(
        child: Text('Anonymous Login'),
        elevation: 8.0,
        textColor: Colors.lightBlue,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        color: Colors.white,
        splashColor: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.of(context).pushNamed(LoginPage.tag);
        },
      ),
    );

    final supporterRaiseButton = new SizedBox(
      height: 42.0,
      width: 200.0,
      child: RaisedButton(
        child: Text('Supporter Login'),
        elevation: 8.0,
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        color: Colors.lightBlue,
        splashColor: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.of(context).pushNamed(LoginPage.tag);
        },
      ),
    );



    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: new BoxDecoration(
        image: backgroundImage,
      ),
      /*decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),*/
      child: Column(
        children: <Widget>[logo, welcome, lorem,SizedBox(height: 30.0),anonymousRaiseButton,SizedBox(height: 14.0),supporterRaiseButton],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
