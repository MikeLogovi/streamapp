import 'package:flutter/material.dart';
class StoryWidget extends StatelessWidget {
  String avatarImage;
  String avatarName;
  StoryWidget({this.avatarImage,this.avatarName});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:EdgeInsets.fromLTRB(8, 0, 8, 0) ,
        child: Column(
        children: <Widget>[
           Container(
             decoration:BoxDecoration(
               shape:BoxShape.circle,
                color: Colors.grey[300],
                boxShadow: [
                new BoxShadow(
                    spreadRadius: 1.0,

                    blurRadius: 5.0,
                    color: Colors.grey[600],
                    offset:Offset(2,2)
                ),
                 new BoxShadow(
                   spreadRadius: 1.0,
                    blurRadius: 5.0,
                    color: Colors.white,
                    offset:Offset(-2,-2)
                )],
                

               
             ),
             child:CircleAvatar(
                    radius:34,
                    backgroundImage: AssetImage("$avatarImage"),
             )
           ),
           SizedBox(height:5),
           Text("$avatarName")
        ],
      ),
    );
  }
}