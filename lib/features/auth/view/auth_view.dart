import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view/present_your_location_view.dart';
import 'package:cenith_marchent/features/auth/view/confirm_your_location_view.dart';
import 'package:cenith_marchent/features/auth/view/tell_us_about_yourself_view.dart';
import 'package:cenith_marchent/features/auth/view/terms_and_condition_view.dart';
import 'package:cenith_marchent/features/auth/view/tell_us_about_business_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'set_your_business_hours_view.dart';
import 'describe_your_business_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  static final String name = 'auth-screen';

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final GlobalKey<TellUsAboutYourselfViewState> signUpKey = GlobalKey<TellUsAboutYourselfViewState>();
  final GlobalKey<TellUsAboutBusinessViewState> businessDetailsKey =
      GlobalKey<TellUsAboutBusinessViewState>();
  late final PageController _pageController;
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _steps = [
    {
      'title': 'Tell Us About Yourself',
      'sub-title':
          'This information will help us create your profile. Please fill in all required fields.',
      'progress': 0.16,
    },
    {
      'title': 'Describe your business',
      'sub-title':
          'Tell us about your business and select the location type that fits you best.',
      'progress': 0.32,
    },
    {
      'title': 'Tell Us About Business',
      'sub-title':
          'Add your business name and fill in the details to get started.',
      'progress': 0.48,
    },
    {
      'title': 'Confirm Your Location',
      'sub-title': 'Make sure the pin is placed correctly on the map.',
      'progress': 0.64,
    },
    {
      'title': 'Set Your Business Hours',
      'sub-title':
          'Let customers know your opening times and availability for service.',
      'progress': 0.80,
    },
    {
      'title': 'Present Your Location',
      'sub-title':
          'Add photos so customers can clearly see your business and where their luggage will be stored.',
      'progress': 1.0,
    },
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              SizedBox(height: _currentIndex == 0 ? 32.h : 12.h),
              _buildTopSection(context),
              SizedBox(height: 10.h),
              Expanded(
                child: Stack(
                  children: [
                    PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      children: [
                        TellUsAboutYourselfView(
                          key: signUpKey,
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
                        TellUsAboutBusinessView(
                          key: businessDetailsKey,
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
                        SetYourBusinessHoursView(
                          onValidChanged: (isValid) {
                            _pageValidation[4] = isValid;
                            setState(() {});
                          },
                        ),
                        PresentYourLocationView(
                          onValidChanged: (isValid) {
                            _pageValidation[5] = isValid;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    if (isKeyboardOpen) return const SizedBox.shrink();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB( 16.w,
            _currentIndex == 0 ? 8.h : 8.h,
            16.w,
            _currentIndex == 0 ? 80.h : 16.h

        ),
        child: ElevatedButton(
          onPressed: _pageValidation[_currentIndex] == true
              ? () {
            FocusScope.of(context).unfocus();

            if (_currentIndex == 0) {
              final state = signUpKey.currentState;
              if (state != null) {
                state.submit();

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (_pageValidation[0] == true) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                });
              }
              return;
            }

            if (_currentIndex == 2) {
              final state = businessDetailsKey.currentState;
              if (state != null) {
                state.submit();

                if (_pageValidation[2] == true) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              }
              return;
            }

            if (_currentIndex < 5) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              Navigator.pushNamed(context, TermsAndConditionView.name);
            }
          }
              : null,
          child: Text(_currentIndex == 5 ? 'Finish' : 'Next Step'),
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    final currentSteps = _steps[_currentIndex];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(IconsPath.logWithoutBgSvg, width: 170.w),
        SizedBox(height: 16.h),
        Text(
          currentSteps['title'],
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1.sp,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          currentSteps['sub-title'],
          textAlign: TextAlign.center,
          style: fontSize18(context)!.copyWith(color: Colors.black54),
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
