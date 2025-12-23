import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view/add_business_photos_view.dart';
import 'package:cenith_marchent/features/auth/view/confirm_your_location_view.dart';
import 'package:cenith_marchent/features/auth/view/sign_up_view.dart';
import 'package:cenith_marchent/features/auth/view/terms_and_condition_view.dart';
import 'package:cenith_marchent/features/auth/view/your_business_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_your_business_hours_view.dart';
import 'describe_your_business_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  static final String name = 'auth-screen';

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late final PageController _pageController;
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _steps = [
    {'title': 'Your Details', 'progress': 0.16},
    {'title': 'Describe Your Business', 'progress': 0.32},
    {'title': 'Business Details', 'progress': 0.48},
    {'title': 'Confirm Location', 'progress': 0.64},
    {'title': 'Business Hours', 'progress': 0.80},
    {'title': 'Business Photos', 'progress': 1.0},
  ];

  final Map<int, bool> _pageValidation = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
  };

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              _buildTopSection(context),
              SizedBox(height: 10),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  children: [
                    SignUpView(
                      onValidChanged: (isValid) {
                        _pageValidation[0] = isValid;
                        setState(() {});
                      },
                    ),
                    DescribeYourBusinessView(
                      onValidChanged: (isValid) {
                        _pageValidation[1] = isValid;
                        setState(() {});
                      },
                    ),
                    YourBusinessDetailsView(
                      onValidChanged: (isValid) {
                        _pageValidation[2] = isValid;
                        setState(() {});
                      },
                    ),
                    ConfirmYourLocationView(
                      onValidChanged: (isValid) {
                        _pageValidation[3] = isValid;
                        setState(() {});
                      },
                    ),
                    AddYourBusinessHoursView(
                      onValidChanged: (isValid) {
                        _pageValidation[4] = isValid;
                        setState(() {});
                      },
                    ),
                    AddBusinessPhotosView(
                      onValidChanged: (isValid) {
                        _pageValidation[5] = isValid;
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),

              ElevatedButton(
                onPressed: _pageValidation[_currentIndex] == true
                    ? () {
                        if (_currentIndex < 5) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            TermsAndConditionView.name,
                          );
                        }
                      }
                    : null,
                child: Text(_currentIndex == 5 ? 'Finish' : 'Next Step'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    final currentSteps = _steps[_currentIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(IconsPath.logWithoutBgSvg, width: 170.w),
        SizedBox(height: 16.h),
        Text(
          currentSteps['title'],
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1.sp,
          ),
        ),
        SizedBox(height: 24.h),
        LinearProgressIndicator(
          value: currentSteps['progress'],
          minHeight: 8.h,
          backgroundColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8.r),
        ),
        SizedBox(height: 4.h),
        Align(
          alignment: Alignment.bottomRight,
          child: Text(
            '${(currentSteps['progress'] * 100).toInt()}%',
            style: fontSize16(
              context,
            )!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _currentIndex != 0
                ? GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            if (_currentIndex == 1)
              TextButton(
                onPressed: onTapToNextPage,
                child: Text(
                  'Skip',
                  style: fontSize16(context)!.copyWith(color: Colors.black),
                ),
              ),
          ],
        ),
      ],
    );
  }

  onTapToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
