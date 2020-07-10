import 'package:bloc/bloc.dart';
import 'package:blog2/screen/application/home.dart';
import 'package:blog2/screen/application/post.dart';
import 'package:blog2/screen/application/followers.dart';
import 'package:blog2/screen/application/profile.dart';


enum  NavigationEvents{
  HomeClickedEvent,
  PostClickedEvent,
  FollowersClickedEvent,
  ProfilClickedEvent,

}
abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents,NavigationStates>{
  @override
  NavigationStates get initialState => Home();
  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async*{
    switch(event){
      case NavigationEvents.HomeClickedEvent: yield Home();break;
      case NavigationEvents.PostClickedEvent: yield Posts() ;break;
      case NavigationEvents.FollowersClickedEvent: yield Followers();break;
      case NavigationEvents.ProfilClickedEvent: yield Profile();break;
    }
  }

}