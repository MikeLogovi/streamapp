import 'package:blog2/blocs/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
class Profile extends StatefulWidget with NavigationStates{
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   List recent_posts=["lib/assets/recent_posts/img1.jpg",
  "lib/assets/recent_posts/img2.jpg",
  "lib/assets/recent_posts/img3.jpg",
  "lib/assets/recent_posts/img4.jpg",
  "lib/assets/recent_posts/img5.jpg",
  "lib/assets/recent_posts/img6.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFE1F5FE) ,
      appBar:AppBar(
        elevation:0.0,
        backgroundColor:Color(0xFFE1F5FE) ,
        actions: <Widget>[Padding(padding:EdgeInsets.fromLTRB(0, 0, 10, 0),child:Icon(Icons.more_horiz,color: Color(0xFF0097A7)))],
        leading:Icon(Icons.arrow_back_ios,color: Color(0xFF0097A7)),
        title:Text("Profile",style:TextStyle(fontWeight:FontWeight.bold,color: Color(0xFF0097A7)))
      ),
      body:Column(children: <Widget>[
           Container(color: Color(0xFFE1F5FE),padding:EdgeInsets.fromLTRB(30, 0, 30, 0) ,
                child:Column(
                         children:<Widget>[
                          ListTile(leading:CircleAvatar(backgroundImage: AssetImage("lib/assets/flora.jpg"),
                            ),
                            title:Text("Flora Amizgert",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20)),
                            subtitle:Text("flora@gmail.com",style:TextStyle(fontSize:17)),
                           ) ,
                           Padding(
                                padding:EdgeInsets.fromLTRB(30, 10, 30, 10),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                Column(children: <Widget>[
                                      Text("18K",style:TextStyle(fontSize:40,fontWeight: FontWeight.bold)),
                                      Text("Followers",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Color(0xFF0097A7)))
                                ],),
                                 Column(children: <Widget>[
                                      Text("1K",style:TextStyle(fontSize:40,fontWeight: FontWeight.bold)),
                                      Text("Following",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Color(0xFF0097A7)))
                                ],),
                                 Column(children: <Widget>[
                                      Text("12K",style:TextStyle(fontSize:40,fontWeight: FontWeight.bold)),
                                      Text("Posts",style:TextStyle(fontSize:20,fontWeight: FontWeight.w500,color:Color(0xFF0097A7)))
                                ],),
                             ],),
                           ),
                           Padding(
                             padding:EdgeInsets.fromLTRB(15, 5, 15, 10),
                             child:Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: <Widget>[
                                 Container(
                                   margin:EdgeInsets.all(10),

                                   padding:EdgeInsets.all(10),
                                   child: Center(child:Text("Dresseur",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Colors.white))),
                                   decoration:BoxDecoration(
                                     borderRadius: BorderRadius.circular(30),
                                     gradient:LinearGradient(colors:[Color(0xFF1565C0),Color(0xFF1A237E)]),
                                   )
                                  ),
                                 Container(
                                   margin:EdgeInsets.all(10),
                                   padding:EdgeInsets.all(10),
                                   child: Center(child:Text("De",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Colors.white))),
                                   decoration:BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     gradient:LinearGradient(colors:[Color(0xFF1565C0),Color(0xFF1A237E)]),
                                   )
                                  ),
                                   Container(
                                   margin:EdgeInsets.all(10),

                                   padding:EdgeInsets.all(10),
                                   child: Center(child:Text("Code",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,color:Colors.white))),
                                   decoration:BoxDecoration(
                                     borderRadius: BorderRadius.circular(30),
                                     gradient:LinearGradient(colors:[Color(0xFF1565C0),Color(0xFF1A237E)]),
                                   )
                                  )
                             ],)
                           ),
                  ]
                   )
           ),        
          Expanded(
                  child: Container(
                   width:double.infinity,
                   decoration:BoxDecoration(
                     color:Color(0xFF3949AB),
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(70),topRight: Radius.circular(70))
                   ),
                   child:Column(
                       children:<Widget>[ Padding(
                        padding:EdgeInsets.all(30),
                        child: Text("Your images",style:TextStyle(fontWeight:FontWeight.bold,fontSize:40,color:Colors.white,),textAlign: TextAlign.center,)),
                        
                        Expanded(
                                child:ListView(
                                              shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: [StaggeredGridView.countBuilder(
                                crossAxisCount: 4,
                                itemCount: 6,
      shrinkWrap: true,
                                itemBuilder: (BuildContext context, int index) =>Container(
                                   decoration:BoxDecoration(
                                     image:DecorationImage(image: AssetImage(recent_posts[index]),fit: BoxFit.cover),
                                     
                                     color:Color(0xFF3949AB),
                                     borderRadius:BorderRadius.all(Radius.circular(10)) )
                                  ,),
                                staggeredTileBuilder: (int index) =>
                                    new StaggeredTile.count(2, index.isEven ? 2 : 1),
                                mainAxisSpacing: 4.0,
                                crossAxisSpacing: 4.0,
                            ),
                       ]),
                        )
                     ])
                  ),
          ),
             
      ],)
    );
  }
}