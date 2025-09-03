import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_nav_bar.dart';

class MainBottomNavViewModel extends GetxController {
  int selectedIndex = 0;

  List<CustomNavigationDestination> destinations = [
    CustomNavigationDestination(
      svgIconPath: IconsPath.homeButtonIconSvg,
      label: 'home',
    ),
    CustomNavigationDestination(
      svgIconPath: IconsPath.homeButtonIconSvg,
      label: 'home',
    ),
    CustomNavigationDestination(
      svgIconPath: IconsPath.homeButtonIconSvg,
      label: 'home',
    ),
    CustomNavigationDestination(
      svgIconPath: IconsPath.homeButtonIconSvg,
      label: 'home',
    ),
  ];

  List<Widget> screens = [HomeView(), HomeView(), HomeView(), HomeView()];

  onchange(int index) {
    selectedIndex = index;
    update();
  }
}
