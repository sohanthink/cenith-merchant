import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DescribeYourBusinessView extends StatefulWidget {
  const DescribeYourBusinessView({super.key, required this.onValidChanged});

  static final String name = 'describe-business-screen';
  final Function(bool isValid) onValidChanged;
  @override
  State<DescribeYourBusinessView> createState() =>
      _DescribeYourBusinessViewState();
}

class _DescribeYourBusinessViewState extends State<DescribeYourBusinessView> {
  final Set<int> _selectedIndexes = {};
  final List<Map<String, dynamic>> _businessTypeCard = [
    {'business-name': 'Bar', 'Icon': Icons.local_bar_rounded},
    {'business-name': 'Cafe', 'Icon': Icons.coffee},
    {'business-name': 'Barber Shop', 'Icon': Icons.cut},
    {'business-name': 'Car Rental', 'Icon': Icons.directions_bike_outlined},
    {'business-name': 'Office', 'Icon': Icons.home_work_outlined},
    {'business-name': 'Convenience Store', 'Icon': Icons.storefront},
    {'business-name': 'Restaurant', 'Icon': Icons.restaurant},
    {'business-name': 'Fitness Center', 'Icon': Icons.fitness_center},
    {'business-name': 'Hotel', 'Icon': Icons.hotel},
    {'business-name': 'Dessert Shop', 'Icon': Icons.local_dining_outlined},
    {'business-name': 'Dry Cleaner', 'Icon': Icons.cookie_outlined},
    {'business-name': 'Restaurant', 'Icon': Icons.restaurant_rounded},
    {'business-name': 'Pharmacy', 'Icon': Icons.local_pharmacy_outlined},
  ];


  void _updateValidation() {
    widget.onValidChanged(_selectedIndexes.isNotEmpty);
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 8.h),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: TextButton(
          //     onPressed: () {
          //
          //     },
          //     child: Text(
          //       'Skip',
          //       style: fontSize16(context)!.copyWith(color: Colors.black),
          //     ),
          //   ),
          // ),
          SizedBox(height: 8.h),
          Wrap(
            runSpacing: 10,
            spacing: 10,
            children: List.generate(_businessTypeCard.length, (index) {
              final bool isSelected = _selectedIndexes.contains(index);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedIndexes.remove(index);
                    } else {
                      _selectedIndexes.add(index);
                    }
                  });
                  _updateValidation();
                },
                child: SizedBox(
                  width: 60.w,
                  child: Column(
                    children: [
                      SizedBox(height: 4.h),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.themeColor
                              : Colors.grey.shade300,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          _businessTypeCard[index]['Icon'],
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        _businessTypeCard[index]['business-name'],
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.sp,
                          letterSpacing: 0.1.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          /*SizedBox(height: 180.h),
          ElevatedButton(
            onPressed: _selectedIndexes.isEmpty
                ? null
                : () {
                    final _selectedBusiness = _selectedIndexes
                        .map((b) => _businessTypeCard[b]['business-name'])
                        .toList();

                    debugPrint('$_selectedBusiness');
                  },
            child: Text('Next Step'),
          ),*/
        ],
      ),
    );
  }
}
