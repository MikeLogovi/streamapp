import 'package:blog2/screen/authenticate/authenticate.dart';
import 'package:blog2/screen/authenticate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:blog2/models/User.dart';
import 'package:blog2/screen/application/layout.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final user=Provider.of<User>(context);
    return user==null?  Authenticate():Layout();
  }
}