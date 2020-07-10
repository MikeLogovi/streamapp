import 'dart:async';

import 'package:blog2/blocs/navigation_bloc.dart';
import 'package:blog2/screen/application/menu_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  StreamController<bool> streamController ;
  Stream<bool> stream;
  StreamSink<bool> sink;
  Duration _duration= new Duration(milliseconds:500);
  @override
  void initState(){
     animationController= AnimationController(vsync: this,duration:_duration); 
     streamController=PublishSubject<bool>();
     sink=streamController.sink;
     stream=streamController.stream;
  }
  @override
  void dispose(){
   animationController.dispose();
   streamController.close();
  }

  void onIconPressed(){
    final animationStatus= animationController.status;
    final animationCompeted=AnimationStatus.completed;
    final isCompleted= animationStatus == animationCompeted;
    if(isCompleted){
      sink.add(false);
      animationController.reverse();

    }
    else{
      sink.add(true);
      animationController.forward();

    }

  }
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
      final FirebaseAuth _auth =FirebaseAuth.instance;

    return StreamBuilder<bool>(
      initialData:false,
      stream:stream,
      builder:(context,openedAsync){
        return    AnimatedPositioned(
        top:0,
        bottom:0,
        left:openedAsync.data ? 0: -screenWidth,
        right:openedAsync.data ? 0: screenWidth -45,
        duration:_duration,
        child: Row(
        children: <Widget>[
          Expanded(
              child: Container(
              
                child:Column(
                   children: <Widget>[
                      Padding(
                        padding:EdgeInsets.fromLTRB(10, 70, 10,0),
                        child:ListTile(
                        title:Text("Mike Logovi",style:TextStyle(color:Colors.white,fontSize: 30)),
                        subtitle:Text("logovimike@gmail.com",style:TextStyle(color:Colors.white,fontSize: 20)),
                        leading:CircleAvatar(radius:40,child: Icon(Icons.person) ,)
                       )),
                     Padding(
                          padding:EdgeInsets.fromLTRB(25, 10, 10, 0),
                          child: Column(children: <Widget>[
                          Divider(thickness: 2,color: Color(0xFF01579B),),
                          SizedBox(height:20),
                          MenuItem(onTap:(){onIconPressed();BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomeClickedEvent);},title:"Home",icon:Icon(Icons.home,size:40.0,color:Color(0xFF01579B))),
                          SizedBox(height:20),
                          SizedBox(height:20),
                          MenuItem(onTap:(){onIconPressed();BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.FollowersClickedEvent);},title:"My Followers",icon:Icon(FontAwesomeIcons.users,size:40.0,color:Color(0xFF01579B))),
                          SizedBox(height:20),
                          MenuItem(onTap:(){onIconPressed();BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.ProfilClickedEvent);},title:"Profil",icon:Icon(FontAwesomeIcons.portrait,size:40.0,color:Color(0xFF01579B))),
                          SizedBox(height:300),
                          Divider(thickness: 2,color: Color(0xFF01579B),),

                          MenuItem(onTap:(){onIconPressed();_auth.signOut();},title:"Logout",icon:Icon(FontAwesomeIcons.signOutAlt,size:40.0,color:Color(0xFF01579B))),

                       ],),
                     )
                   



                   ],
                ),
                color: Color(0xFF0097A7),
          )),
          Align(
            alignment: Alignment(0, -0.85),
            child: 
              GestureDetector(
                onTap:(){
                     onIconPressed();
                },
                child: ClipPath(
                    clipper:MyClipper(),
                    child: Container(
                    alignment: Alignment.center,
                  child:AnimatedIcon(
                    
                    progress: animationController.view,
                    icon: AnimatedIcons.menu_close,
                  ),
                  width: 35, height: 110, color: Color(0xFF0097A7)),
                ),
              ),
          )
        ],
      ));
      }
       
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.quadraticBezierTo(0.0, 8, 10, 16);
    p.quadraticBezierTo(size.width-1, size.height/2-20, size.width, size.height/2);
    p.quadraticBezierTo(size.width+1, size.height/2+20, 10, size.height-16);
    p.quadraticBezierTo(0, size.height-8, 0, size.height);





    return p;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}