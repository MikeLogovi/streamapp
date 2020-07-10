import 'package:blog2/blocs/navigation_bloc.dart';
import 'package:flutter/material.dart';
class Posts extends StatefulWidget with NavigationStates{
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  @override
  Widget build(BuildContext context) {
    return Container(
     child: Center(child:Text("Posts", style:TextStyle(fontSize: 50)))
    );
  }
}