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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          _buildBusinessTypeCard(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  Widget _buildBusinessTypeCard() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _businessTypeCard.length,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.95,
      ),

      itemBuilder: (context, index) {
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

          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.themeColor.withOpacity(.1)
                  : Colors.white,

              borderRadius: BorderRadius.circular(4.r),

              border: Border.all(
                color: isSelected ? AppColors.themeColor : Colors.grey.shade300,
              ),
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _businessTypeCard[index]['Icon'],
                  size: 22.sp,
                  color: isSelected ? AppColors.themeColor : Colors.black54,
                ),

                SizedBox(height: 8.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(
                    _businessTypeCard[index]['business-name'],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
