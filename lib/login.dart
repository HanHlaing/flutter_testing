import 'package:flutter/material.dart';
import 'signup.dart';
import 'home.dart';
import 'supporter_list.dart';
import 'style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'const.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn googleSignIn = new GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences prefs;

  bool isLoading = false;
  bool isLoggedIn = false;
  FirebaseUser currentUser;

  Future<Null> handleSignIn() async {
    prefs = await SharedPreferences.getInstance();

    this.setState(() {
      isLoading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser firebaseUser = await firebaseAuth.signInWithGoogle(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    if (firebaseUser != null) {
      // Check is already sign up
      final QuerySnapshot result = await Firestore.instance
          .collection('users')
          .where('id', isEqualTo: firebaseUser.uid)
          .getDocuments();

      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Update data to server if new user
        Firestore.instance
            .collection('users')
            .document(firebaseUser.displayName)
            .setData({
          'name': firebaseUser.displayName,
          'photoUrl': firebaseUser.photoUrl,
          'type':'1',
          'id': firebaseUser.uid
        });

        // Write data to local
        currentUser = firebaseUser;
        await prefs.setString('id', currentUser.uid);
        await prefs.setString('name', currentUser.displayName);
        await prefs.setString('type', '1');
        await prefs.setString('photoUrl', currentUser.photoUrl);
      } else {
        // Write data to local
        await prefs.setString('id', documents[0]['id']);
        await prefs.setString('name', documents[0]['name']);
        await prefs.setString('photoUrl', documents[0]['photoUrl']);
        await prefs.setString('type', '1');
      }
      Fluttertoast.showToast(msg: "Sign in success");
      this.setState(() {
        isLoading = false;
      });

      Navigator.of(context).pushNamed(ListPage.tag);
    } else {
      Fluttertoast.showToast(msg: "Sign in fail");
      this.setState(() {
        isLoading = false;
      });
    }
  }

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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
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
          //Navigator.of(context).pushNamed(ListPage.tag);
          Fluttertoast.showToast(msg: 'Comming soon!');
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
          Navigator.of(context).pushNamed(SignUpPage.tag);
        },
      ),
    );

    final signUpWithGoogle = new SizedBox(
      height: 42.0,
      child: RaisedButton(
        child: Text(
          'SIGN IN WITH GOOGLE',
          style: TextStyle(fontSize: 16.0),
        ),
        elevation: 8.0,
        textColor: Colors.white,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0)),
        color: Color(0xffdd4b39),
        splashColor: Colors.transparent,
        onPressed: handleSignIn,
      ),
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
        body: Stack(children: <Widget>[
          Container(
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
                  SizedBox(height: 14.0),
                  signUpWithGoogle
                  //forgotLabel
                ],
              ),
            ),
          ),
          // Loading
          Positioned(
            child: isLoading
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(themeColor)),
                    ),
                    color: Colors.white.withOpacity(0.8),
                  )
                : Container(),
          )
        ]));
  }
}
