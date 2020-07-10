import 'package:blog2/blocs/navigation_bloc.dart';
import 'package:blog2/models/User.dart';
import 'package:blog2/screen/application/custom_widgets/post_widget.dart';
import 'package:blog2/screen/application/custom_widgets/story_widget.dart';
import 'package:blog2/services/auth.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:blog2/models/Post.dart';
class Home extends StatefulWidget with NavigationStates{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser fu ;
  User u;
  List posts;
  void initializing() async{
     fu=await _auth.currentUser();
  }
  void initState(){
    initializing();
  }
  List<Map>stories=[
    {"name":"Tom","image":"lib/assets/tom.jpg"},
    {"name":"Jeanne","image":"lib/assets/jeanne.jpg"},
    {"name":"Elom","image":"lib/assets/elom.jpg"},
    {"name":"Claire","image":"lib/assets/claire.jpg"},
    {"name":"Bob","image":"lib/assets/bob.jpg"},
    {"name":"Flora","image":"lib/assets/flora.jpg"},
  ];
  List recent_posts=["lib/assets/recent_posts/img1.jpg",
  "lib/assets/recent_posts/img2.jpg",
  "lib/assets/recent_posts/img3.jpg",
  "lib/assets/recent_posts/img4.jpg",
  "lib/assets/recent_posts/img5.jpg",
  "lib/assets/recent_posts/img6.jpg"];
  
 
  @override
  Widget build(BuildContext context) {
      u=AuthService.getUserFromFirebase(fu);
       posts=[
            Post(title:"My second post",author:User(email: "claire@gmail.com",username: "Claire",uid:"123456789",image:"lib/assets/claire.jpg"),content:"Good post",published_at:"6/6/1999",image:"lib/assets/claire.jpg"),
            Post(title:"My third post",author:User(email: "flora@gmail.com",username: "Flora",uid:"123456789",image:"lib/assets/flora.jpg"),content:"Good post",published_at:"6/6/1999",image:"lib/assets/flora.jpg"),
            Post(title:"My quadro post",author:User(email: "tom@gmail.com",username: "Tom",uid:"123456789",image:"lib/assets/tom.jpg"),content:"Good post",published_at:"6/6/1999",image:"lib/assets/tom.jpg"),
            Post(title:"My fifth post",author:User(email: "bob@gmail.com",username: "Bob",uid:"123456789",image:"lib/assets/bob.jpg"),content:"Good post",published_at:"6/6/1999",image:"lib/assets/bob.jpg"),
            Post(title:"My first post",author:User(email: "rachid@gmail.com",username: "Rachid",uid:"123456789",image:"lib/assets/elom.jpg"),content:"Good post",published_at:"7/6/1999",image:"lib/assets/elom.jpg")
     ];
    return Container(
      color:Color(0xFFE1F5FE),
       child:Column(children: <Widget>[
          Padding(
            padding:EdgeInsets.fromLTRB(0, 70, 0, 0),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
               Text("Stream",style:TextStyle(fontFamily: 'Arial',fontSize:40)),
               Text("App",style:TextStyle(fontFamily: 'Arial',fontSize:40,color:Color(0xFF0097A7))),
              ],
             ),
          ),
          SizedBox(height:3),
          Expanded(
                      child: ListView(
              children: <Widget>[
                     Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[ 
                  Padding(
                  padding:EdgeInsets.fromLTRB(16, 0, 0, 10),
                  child: Align(
                  alignment: Alignment.centerLeft,
                  child:Text("Stories",style:TextStyle(fontWeight:FontWeight.bold,fontSize:25,color:Color(0xFF0097A7)))
                ),
              ),
              Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
               child: Icon(FontAwesomeIcons.camera)

              ),
            ],
            ),
            Container(
                height:120,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length,
                itemBuilder: (context,index){
                     return  StoryWidget(avatarImage: stories[index]["image"],avatarName:stories[index]["name"]);
              }),
            ),
            SizedBox(
              width:400,
              height:400,
               child:Carousel(
                 autoplay:false,
                overlayShadow: true,
                overlayShadowColors: Colors.white,
                overlayShadowSize: 0.1,
                moveIndicatorFromBottom: 180.0,
                noRadiusForIndicator: true,
                dotSize: 10.0,
                dotSpacing: 15.0,
                  dotColor: Color(0xFF0097A7),
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.transparent,
                  borderRadius: true,
                 images: recent_posts.map((post){
                   return AssetImage(post);
                 }).toList()
               )  
            ),
         /* Expanded( 
              child:),
*/          ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: posts.length,
              itemBuilder:(context,index){
                     return PostWidget(post:posts[index]);
              }),
              ],
            ),
          ),
         
            Padding(
                padding:EdgeInsets.fromLTRB(15, 0, 15, 30),
                child: Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.home,size:40),
                  SizedBox(width:20),
                  Icon(FontAwesomeIcons.steam,size:40),
                  SizedBox(width:20),
                  Icon(FontAwesomeIcons.steam,size:40),
                  SizedBox(width:20),
                  Icon(FontAwesomeIcons.steam,size:40)

              ],),
            )
       ],
      
      ),
       
    );
  }
}