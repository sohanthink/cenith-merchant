import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view_model/main_bottm_nav_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/custom_nav_bar.dart';

class MainBottomNavView extends StatefulWidget {
  const MainBottomNavView({super.key});

  static const name = 'main bottom nav view';

  @override
  State<MainBottomNavView> createState() => _MainBottomNavViewState();
}

class _MainBottomNavViewState extends State<MainBottomNavView> {
  final MainBottomNavViewModel mainBottomNavViewModel =
      Get.find<MainBottomNavViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavViewModel>(
        builder: (controller) {
          return controller.screens[controller.selectedIndex];
        },
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavViewModel>(
        builder: (controller) {
          return CustomNavBar(
            destinations: controller.destinations,
            selectedIndex: controller.selectedIndex,
            onDestinationSelected: (int index) {
              controller.onchange(index);
            },
            unSelectedColor: Colors.black,
            selectedColor: AppColors.themeColor,
          );
        },
      ),
    );
  }
}
