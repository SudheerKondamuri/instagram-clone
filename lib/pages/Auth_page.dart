import 'package:flutter/material.dart';
import 'package:instagram/pages/login_page.dart';
import 'package:instagram/pages/signup_page.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLogin = true;

  void togglePage() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginPage(togglePage: togglePage)
        : SignupPage(togglePage: togglePage);
  }
}
