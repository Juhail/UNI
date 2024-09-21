import 'package:flutter/material.dart';
import 'package:uni/Authentication/login.dart';
import 'package:uni/Authentication/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showloginpage = true;

  void togglescreens() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return Login(showRegister: togglescreens);
    } else {
      return Register(showloginpage: togglescreens);
    }
  }
}
