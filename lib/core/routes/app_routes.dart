import 'package:cenith_storage/features/home/view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes (RouteSettings settings) {
    late final Widget screenWidget;
    if(settings.name == HomeScreen.name){
      screenWidget = HomeScreen();
    }

    return MaterialPageRoute(builder: (context)=> screenWidget);

  }
}