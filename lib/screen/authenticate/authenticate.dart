import 'package:blog2/screen/authenticate/register.dart';
import 'package:blog2/screen/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool sign_in_or_register=false;
  @override
  Widget build(BuildContext context) {
    return sign_in_or_register==true?
    Register(signInOrRegister:(){ setState((){sign_in_or_register=!sign_in_or_register;});}):SignIn(signInOrRegister:(){ setState((){sign_in_or_register=!sign_in_or_register;});});
  }
}