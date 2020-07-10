import 'package:blog2/blocs/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Followers extends StatefulWidget with NavigationStates{
  @override
  _FollowersState createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  List<Map>favourite_followers=[
    {"name":"Tom","email":"tom@gmail.com","image":"lib/assets/tom.jpg"},
    {"name":"Jeanne","email":"jeanne@gmail.com","image":"lib/assets/jeanne.jpg"},
    {"name":"Elom","email":"elom@gmail.com","image":"lib/assets/elom.jpg"},
    {"name":"Claire","email":"claire@gmail.com","image":"lib/assets/claire.jpg"},
    {"name":"Bob","email":"bob@gmail.com","image":"lib/assets/bob.jpg"},
    {"name":"Flora","email":"flora@gmail.com","image":"lib/assets/flora.jpg"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Color(0xFFE1F5FE) ,
           appBar:AppBar(
                elevation:0.0,
                backgroundColor:Color(0xFFE1F5FE),
             title:Text("Followers",style:TextStyle(fontWeight:FontWeight.bold,color: Color(0xFF0097A7))),
             leading:Icon(Icons.arrow_back_ios,color:Color(0xFF0097A7)),
             actions: <Widget>[Padding(padding:EdgeInsets.fromLTRB(10, 0, 10, 0),child: Icon(Icons.more_horiz,color:Color(0xFF0097A7),))],
             ),
             body:Column(
               children: <Widget>[
                 Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(padding:EdgeInsets.fromLTRB(40, 30, 0, 0) ,
                    child:Text("My Best Follower",style:TextStyle(fontWeight:FontWeight.bold,fontSize:30,color:Color(0xFF1565C0)))
                   ),
                 ),
                 Padding(padding:EdgeInsets.fromLTRB(30, 10, 30, 0),
                 child:ListTile(
                   title:Text("Tom Boyle",style:TextStyle(fontSize:20,fontWeight: FontWeight.w500)),
                   subtitle:Text("tomboyle@gmail.com"),
                   leading:CircleAvatar(radius:30,backgroundImage: AssetImage("lib/assets/tom.jpg"),),
                   trailing: Icon(FontAwesomeIcons.heart,color:Colors.red,size:40),)
                ),
                Divider(thickness: 1,color:Color(0xFF0097A7)),

                 Align(
                   alignment: Alignment.centerLeft,
                    child: Padding(
                     padding:EdgeInsets.fromLTRB(30, 10, 30, 20),
                      child:Text("My Favourites",style:TextStyle(fontWeight:FontWeight.bold,fontSize:30,color:Color(0xFF1565C0)))

                   ),
                 ),
                 Container(
                      height:80,
                        child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:favourite_followers.length,
                        itemBuilder: (context,index){
                            return Padding(
                                  padding:EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Column(children: <Widget>[
                                  Container(
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: [
                                        BoxShadow(offset:Offset(2,3),color:Colors.grey[400])
                                      ]
                                    ),
                                    child: CircleAvatar(radius:30,backgroundImage:AssetImage(favourite_followers[index]["image"])))
                              ],),
                            );
                        }),
                    ),
                    Divider(thickness: 1,color:Color(0xFF0097A7)),
                   Align(
                   alignment: Alignment.centerLeft,
                    child: Padding(
                     padding:EdgeInsets.fromLTRB(30, 10, 30, 20),
                      child:Text("Other Followers",style:TextStyle(fontWeight:FontWeight.bold,fontSize:30,color:Color(0xFF1565C0)))

                   ),
                 ),
                  Expanded(
                    child:ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount:favourite_followers.length,
                        itemBuilder: (context,index){
                            return Padding(
                              padding:EdgeInsets.all(15),
                                  child:Container(
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                    color:Color(0xFF3949AB),
                                  ),
                                  child: ListTile(
                                  title:Text(favourite_followers[index]["name"],style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize:20)),
                                  subtitle:Text(favourite_followers[index]["email"],style:TextStyle(color:Colors.white,fontWeight: FontWeight.w500,fontSize:15)),
                                  leading:CircleAvatar(backgroundImage: AssetImage(favourite_followers[index]["image"]),
                          
                                  )
                                  ),
                              ),
                            );
                        }),
                  )
                   
               ],
             )
    );
  }
}