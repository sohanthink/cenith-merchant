import 'package:cenith_marchent/features/home/view/home_view.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes (RouteSettings settings) {
    late final Widget screenWidget;
    if(settings.name == HomeView.name){
      screenWidget = HomeView();
    } if(settings.name == MainBottomNavView.name){
      screenWidget = MainBottomNavView();
    }

    return MaterialPageRoute(builder: (context)=> screenWidget);

  }
}