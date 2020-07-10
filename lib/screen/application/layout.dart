import 'package:blog2/blocs/navigation_bloc.dart';
import 'package:blog2/screen/application/home.dart';
import 'package:blog2/screen/application/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Layout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:BlocProvider<NavigationBloc>(
            create: (context)=>NavigationBloc(),
            child: Stack(children:<Widget>[
                    BlocBuilder<NavigationBloc,NavigationStates>(
                      builder:(context,nav)=> nav as Widget),
                    SideBar(),
              ]),
            )
    );
  }
}