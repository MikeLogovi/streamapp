import 'package:blog2/screen/authenticate/sign_in.dart';
import 'package:blog2/screen/loading.dart';
import 'package:blog2/screen/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:blog2/models/User.dart';
import 'package:blog2/services/auth.dart';
main(){
    runApp(Main());
}
class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
  
    return StreamProvider<User>.value(
          value:AuthService().user,
          child: MaterialApp(
            initialRoute: "/",
            routes:{
              '/' : (context)=>Loading(),
              '/signIn':(context)=>Wrapper(),
            },
          debugShowCheckedModeBanner: false,
         
      ),
    );
  }
}