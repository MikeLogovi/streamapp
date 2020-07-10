import 'package:blog2/models/User.dart';
class Post{
  String title;
  User author;
  String published_at;
  String updated_at;
  String content;
  String image;
  bool isLiked=false;
  bool authorIsFollowed=false;
  Post({this.title,this.author,this.content,this.published_at,this.image});
  
}