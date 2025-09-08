import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/app_colors.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    this.labelStyle,
    required this.selectedColor,
    required this.unSelectedColor,
  });

  final List<CustomNavigationDestination> destinations;
  final int selectedIndex;

  final ValueChanged<int> onDestinationSelected;
  final TextStyle? labelStyle;
  final Color selectedColor;
  final Color unSelectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: destinations.asMap().entries.map((item) {
          return GestureDetector(
            onTap: () => onDestinationSelected(item.key),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  height: 25.h,
                  width: 25.w,
                  destinations[item.key].svgIconPath,
                  color: selectedIndex == item.key
                      ? selectedColor
                      : unSelectedColor,
                ),
                SizedBox(height: 3),
                Text(
                  destinations[item.key].label,
                  style:
                      labelStyle ??
                      TextStyle(
                        color: selectedIndex == item.key
                            ? selectedColor
                            : unSelectedColor,
                        fontSize: 12.sp,
                      ),
                ),
                SizedBox(height: 2),
                selectedIndex == item.key
                    ? CircleAvatar(
                        radius: 4.r,
                        backgroundColor: AppColors.themColor,
                      )
                    : SizedBox.shrink(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class CustomNavigationDestination {
  final String svgIconPath;
  final String label;

  CustomNavigationDestination({required this.svgIconPath, required this.label});
}
