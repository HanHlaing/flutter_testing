import 'package:flutter/material.dart';
import 'home.dart';
import 'supporter_list.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );

    final email = TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      autofocus: true,
      initialValue: 'hhm@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      style: TextStyle(
        color: Colors.white,
      ),
      autofocus: true,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0),

        ),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            Navigator.of(context).pushNamed(HomePage.tag);
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final loginRaiseButton = new SizedBox(
      height: 42.0,
      child: RaisedButton(
        child: Text('Login'),
        elevation: 8.0,
        textColor: Colors.lightBlue,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        color: Colors.white,
        splashColor: Colors.lightBlueAccent,
        onPressed: () {
          Navigator.of(context).pushNamed(ListPage.tag);
        },
      ),
    );

    final signUpRaiseButton = new SizedBox(
      height: 42.0,
      child: RaisedButton(
        child: Text('Sign Up'),
        elevation: 8.0,
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        color: Colors.lightBlue,
        splashColor: Colors.lightBlueAccent,
        onPressed: () {
          //Navigator.of(context).pushNamed(HomePage.tag);
        },
      ),
    );

    DecorationImage backgroundImage = new DecorationImage(
      image: new ExactAssetImage('assets/bg_login.png'),
      fit: BoxFit.cover,
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        decoration: new BoxDecoration(
          image: backgroundImage,
        ),
        child: new Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 48.0),
              email,
              SizedBox(height: 8.0),
              password,
              SizedBox(height: 30.0),
              loginRaiseButton,
              SizedBox(height: 14.0),
              signUpRaiseButton,
              //forgotLabel
            ],
          ),
        ),
      ),
    );
  }
}
