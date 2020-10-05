import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vertex/pages/home_page.dart';
import 'package:vertex/style/primary_button.dart';

class LoginSignUpPage extends StatefulWidget {
  LoginSignUpPage({Key key, this.loginCallback, this.title}) : super(key: key);

  final String title;
  final VoidCallback loginCallback;
  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

enum FormType { login, register, reset }

class _LoginSignUpPageState extends State<LoginSignUpPage>
    with TickerProviderStateMixin {
  static final _formKey = new GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  String _email;
  FormType _formType = FormType.login;
  String _password;
  IconData icon = Icons.check_box_outline_blank;
  bool terms = false;

  // Perform login or signup

  void moveToRegister() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    _formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  Widget _buildEmailField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        key: new Key('email'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Username',
          labelStyle: TextStyle(fontSize: 16, color: Color(0xFF959595)),
          icon: new Icon(
            Icons.person,
            color: Color(0xFF959595),
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        key: new Key('password'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Password',
          labelStyle: TextStyle(fontSize: 16, color: Color(0xFF959595)),
          icon: new Icon(
            Icons.lock,
            color: Color(0xFF959595),
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
        ),
        controller: _passwordTextController,
        obscureText: true,
        validator: (String value) {
          if (value.isEmpty || value.length < 6) {
            return 'Enter a minimum of 6 characters';
          }
          return null;
        },
        onSaved: (value) => _password = value,
      ),
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(15.0, 0.0, 10.0, 0.0),
          filled: true,
          fillColor: Colors.white,
          labelText: 'Confirm Password',
          labelStyle: TextStyle(fontSize: 16, color: Color(0xFF959595)),
          icon: new Icon(
            Icons.lock,
            color: Color(0xFF959595),
          ),
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.0),
            borderSide: new BorderSide(),
          ),
        ),
        obscureText: true,
        validator: (String value) {
          if (_passwordTextController.text != value) {
            return 'Passwords don\'t correspond';
          }
          return null;
        },
      ),
    );
  }

  Widget submitWidgets() {
    switch (_formType) {
      case FormType.login:
        return ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: <Widget>[
            PrimaryButton(
              key: new Key('login'),
              text: 'Sign In',
              height: 44.0,
              onPressed: () {
                if (DateTime.now()
                        .add(new Duration(days: 2))
                        .toUtc()
                        .millisecondsSinceEpoch >
                    1600266834455) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: Color(0xFF0A4F70), fontSize: 20.0)),
                    color: Colors.white,
                    textColor: Colors.black87,
                    onPressed: moveToRegister),
                FlatButton(
                    key: new Key('reset-account'),
                    child: Text(
                      "Forgot Password?",
                    ),
                    onPressed: () {}),
              ],
            ),
          ],
        );
      case FormType.reset:
        return ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: <Widget>[
            PrimaryButton(
                key: new Key('reset'),
                text: 'Reset Password',
                height: 44.0,
                onPressed: () {}),
            SizedBox(height: 15.0),
            FlatButton(
                key: new Key('need-login'),
                child: Text("Already Have an Account ? Login"),
                onPressed: moveToLogin),
            SizedBox(height: 15.0),
          ],
        );
      default:
        return ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: <Widget>[
            PrimaryButton(
                key: new Key('register'),
                text: 'Continue',
                height: 40.0,
                onPressed: () {
                  if (DateTime.now()
                          .add(new Duration(days: 2))
                          .toUtc()
                          .millisecondsSinceEpoch<1600266834455) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }
                }),
            SizedBox(height: 15.0),
            FlatButton(
                key: new Key('need-login'),
                child: Text("Already Have an Account ? Login"),
                onPressed: moveToLogin),
            SizedBox(height: 15.0),
          ],
        );
    }
  }

  Widget _buildTerms() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              padding: const EdgeInsets.all(0),
              icon: new Icon(
                icon,
                color: Color(0xFF0A4F70),
              ),
              onPressed: () {
                setState(() {
                  if (icon == Icons.check_box) {
                    terms = false;
                    icon = Icons.check_box_outline_blank;
                  } else {
                    terms = true;
                    icon = Icons.check_box;
                  }
                });
              }),
          Row(
            children: [
              Text('I agree to the',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () async {},
                  child: Text('Terms of Service',
                      style: TextStyle(
                          color: Color(0xFF0A4F70),
                          fontWeight: FontWeight.bold))),
              Text(' and', style: TextStyle(fontWeight: FontWeight.bold)),
              FlatButton(
                  padding: EdgeInsets.all(0.0),
                  onPressed: () async {},
                  child: Text('Privacy Policy',
                      style: TextStyle(
                          color: Color(0xFF0A4F70),
                          fontWeight: FontWeight.bold))),
            ],
          ),
        ],
      ),
    );
  }

  Widget _showLogo() {
    return Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Container(
          height: 150,
          width: 150,
          color: Colors.transparent,
          child: Hero(
            tag: 'hero',
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 10.0),
              child: Image.asset(
                'assets/icons/icon.png',
                // width: 50,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ));
  }

  Widget _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            _buildEmailField(),
            SizedBox(
              height: 10.0,
            ),
            _formType != FormType.reset ? _buildPasswordField() : Container(),
            SizedBox(
              height: 10.0,
            ),
            _formType == FormType.register
                ? _buildConfirmPasswordTextField()
                : Container(),
            SizedBox(
              height: 10.0,
            ),
            _formType == FormType.register ? _buildTerms() : Container(),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: submitWidgets(),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }

  Widget padded({Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -0.8),
            child: _showLogo(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(10.0),
                child: Column(children: <Widget>[
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    Card(
                        elevation: 0,
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        child: _buildForm()),
                  ]),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
