import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckboxGroup extends StatelessWidget {
  final String title;
  final Map<String, bool> items;
  final Function(String, bool) onChanged;

  const CheckboxGroup({
    Key? key,
    required this.title,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1.sp,
            ),
          ),
        ),
        ...items.keys.map((key) {
          final isMain = key.contains('All');
          return CheckboxListTile(
            title: Text(
              key,
              style: TextStyle(
                color: isMain ? Colors.black : AppColors.midLightBlue,
                fontSize: isMain ? 16.sp : 14.sp,
                fontWeight: isMain ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
            value: items[key],
            onChanged: (value) => onChanged(key, value!),
          );
        }).toList(),
      ],
    );
  }
}
