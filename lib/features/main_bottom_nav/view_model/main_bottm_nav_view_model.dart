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
      label: 'Home',
    ),
    CustomNavigationDestination(
      svgIconPath: IconsPath.calenderIconSvg,
      label: 'Bbooking',
    ),
    CustomNavigationDestination(
      svgIconPath: IconsPath.storeIconSvg,
      label: 'Store',
    ),
    CustomNavigationDestination(
      svgIconPath: IconsPath.earningIconSvg,
      label: 'Earning',
    ),
    CustomNavigationDestination(
      svgIconPath: IconsPath.moreIconSvg,
      label: 'Earning',
    ),
  ];

  List<Widget> screens = [HomeView(), HomeView(), HomeView(), HomeView(),HomeView()];

  onchange(int index) {
    selectedIndex = index;
    update();
  }
}
