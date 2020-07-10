import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void startTimer(){
    var count=5;
    Timer time;
    time=Timer.periodic(Duration(seconds: 1), (time){
        count--;
        if(count<0){
            Navigator.pushNamed(context, '/signIn');
            time.cancel();
        }
    });
  }
  void initState(){
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFF0097A7),
      body:Center(child: SpinKitSquareCircle(
        color: Colors.white,
        size: 50.0,
      ))
    );
  }
}