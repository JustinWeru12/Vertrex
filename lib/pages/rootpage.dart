import 'package:flutter/material.dart';
import 'package:vertex/pages/home_page.dart';
import 'package:vertex/pages/login_page.dart';
import 'package:vertex/pages/onboarding.dart';

enum NewUser {
  NOT_DETERMINED,
  NOT_NEW,
  NEW,
}

class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

class _RootPageState extends State<RootPage> {
  NewUser newUser = NewUser.NOT_DETERMINED;
  int _userId = 0;

  @override
  void initState() {
    super.initState();
    if (_userId == 0) {
      setState(() {
        newUser = NewUser.NEW;
      });
    } else if (_userId == 1) {
      setState(() {
        newUser = NewUser.NOT_NEW;
      });
    }
  }

  void loginCallback() {}

  Widget buildWaitingScreen() {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 70.0,
          child: Image.asset('assets/icons/icon.png'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (newUser) {
      case NewUser.NOT_DETERMINED:
        return buildWaitingScreen();
        break;
      case NewUser.NOT_NEW:
        return new LoginSignUpPage(
          loginCallback: loginCallback,
          title: "nightlyfe-Ke",
        );
        break;
      case NewUser.NEW:
        return new OnboardingScreen();

        break;
      default:
        return buildWaitingScreen();
    }
  }
}
