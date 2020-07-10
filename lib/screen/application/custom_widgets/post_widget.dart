import 'package:blog2/models/Post.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PostWidget extends StatefulWidget {
  Post post;
  PostWidget({this.post});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  
  @override
 
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding:EdgeInsets.fromLTRB(30, 10, 30, 4),
          child: Container(
         width:double.infinity,height:590.0,
          decoration:BoxDecoration(
                 color:Colors.white,
                 borderRadius: BorderRadius.circular(25)
                 ),
          child: Column(
          
          children:<Widget>[
            Padding(padding:EdgeInsets.all(3) ,
              child: ListTile(
                leading:CircleAvatar(backgroundImage: AssetImage(widget.post.author.image),),
                title: Text(widget.post.author.username),   
                subtitle:Text(widget.post.published_at),
                trailing: Icon(Icons.more_horiz),
              )
            )
            ,
           Container(
             margin:EdgeInsets.all(10.0),
             width:double.infinity,
             height:400,
             decoration:BoxDecoration(
               borderRadius: BorderRadius.circular(25.0),
               boxShadow: [
                 BoxShadow(
                   color:Colors.grey[800],
                   offset:Offset(0,5),
                   blurRadius: 8,
                 )
               ],
               image:DecorationImage( fit:BoxFit.cover,image: AssetImage(widget.post.image)) )   
          ,),
         Padding(
             padding:EdgeInsets.all(30),
             child: Row(
             mainAxisAlignment:MainAxisAlignment.spaceBetween,
             children: <Widget>[
                Row(children: <Widget>[
                  
                   GestureDetector(
                     onTap:(){
                          setState((){
                            widget.post.isLiked=!widget.post.isLiked;
                          });
                     },
                     child: Icon(FontAwesomeIcons.heartbeat,color:widget.post.isLiked? Colors.red:Colors.black)),
                   SizedBox(width:10),
                   Text("Like")
                ],),
                 Row(children: <Widget>[
                   GestureDetector(
                     onTap:(){
                        setState((){
                          widget.post.authorIsFollowed=!widget.post.authorIsFollowed;

                        });
                        
                     },
                     child: Icon(FontAwesomeIcons.seedling,color:widget.post.authorIsFollowed? Color(0xFF0097A7):Colors.black)),
                   SizedBox(width:10),
                   Text("Follow")
                ],)
           ],),
         )

          ]
        ),
      ),
    );
  }
}