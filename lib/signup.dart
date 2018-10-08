import 'package:flutter/material.dart';
import 'style.dart';
import 'login.dart';
import 'package:mee_pya_tike/services/validations.dart';
import 'package:mee_pya_tike/componets/TextFields/inputField.dart';
import 'package:mee_pya_tike/componets/Buttons/textButton.dart';
import 'package:mee_pya_tike/componets/Buttons/roundedButton.dart';


class SignUpPage extends StatefulWidget {
  static String tag = 'signup-page';

  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool _autovalidate = false;
  Validations _validations = new Validations();

  onPressed() {
    print("button clicked");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Size screenSize = MediaQuery.of(context).size;
    //print(context.widget.toString());
    return new Scaffold(
        key: _scaffoldKey,
        body: new SingleChildScrollView(
          child: new Container(
            padding: new EdgeInsets.all(16.0),
            decoration: new BoxDecoration(image: backgroundImage),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new SizedBox(
                    height: screenSize.height / 2,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Text(
                          "CREATE ACCOUNT",
                          textAlign: TextAlign.center,
                          style: headingStyle,
                        )
                      ],
                    )),
                new SizedBox(
                  height: screenSize.height / 2,
                  child: new Column(
                    children: <Widget>[
                      new Form(
                          key: _formKey,
                          autovalidate: _autovalidate,
                          //onWillPop: _warnUserAboutInvalidData,
                          child: new Column(
                            children: <Widget>[
                              new InputField(
                                hintText: "Username",
                                obscureText: false,
                                textInputType: TextInputType.text,
                                textStyle: textStyle,
                                textFieldColor: textFieldColor,
                                icon: Icons.person_outline,
                                iconColor: Colors.white,
                                bottomMargin: 20.0,
                                validateFunction: _validations.validateName,
                                onSaved: (String name) {
                                  //newUser.displayName = name;
                                },
                              ),
                              new InputField(
                                  hintText: "Email",
                                  obscureText: false,
                                  textInputType: TextInputType.emailAddress,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.mail_outline,
                                  iconColor: Colors.white,
                                  bottomMargin: 20.0,
                                  validateFunction: _validations.validateEmail,
                                  onSaved: (String email) {
                                   // newUser.email = email;
                                  }),
                              new InputField(
                                  hintText: "Password",
                                  obscureText: true,
                                  textInputType: TextInputType.text,
                                  textStyle: textStyle,
                                  textFieldColor: textFieldColor,
                                  icon: Icons.lock_open,
                                  iconColor: Colors.white,
                                  bottomMargin: 40.0,
                                  validateFunction:
                                  _validations.validatePassword,
                                  onSaved: (String password) {
                                    //newUser.password = password;
                                  }),
                              new RoundedButton(
                                  buttonName: "Continue",
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  width: screenSize.width,
                                  height: 50.0,
                                  bottomMargin: 10.0,
                                  borderWidth: 1.0)
                            ],
                          )),

                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget SignupPage() {
    return new Container(

    );
  }
}
