import 'package:flutter/material.dart';
class MenuItem extends StatelessWidget {
  String title;
  Icon icon;
  Function onTap;
  MenuItem({this.title,this.icon, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
           onTap:(){onTap();},
           child: ListTile(title:Text("$title",style:TextStyle(color:Colors.white,fontSize:25)),leading:icon));
  }
}