import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/model/confirm_your_location_model.dart';
import 'package:cenith_marchent/features/auth/model/describe_your_business_model.dart';
import 'package:cenith_marchent/features/auth/model/tell_us_about_your_business_model.dart';
import 'package:cenith_marchent/features/auth/view/present_your_location_view.dart';
import 'package:cenith_marchent/features/auth/view/confirm_your_location_view.dart';
import 'package:cenith_marchent/features/auth/view/tell_us_about_yourself_view.dart';
import 'package:cenith_marchent/features/auth/view/terms_and_condition_view.dart';
import 'package:cenith_marchent/features/auth/view/tell_us_about_business_view.dart';
import 'package:cenith_marchent/features/auth/view_model/location_view_model.dart';
import 'package:cenith_marchent/features/auth/view_model/registration_view_model.dart';
import 'package:cenith_marchent/features/common/widgets/dynamic_bottom_iland.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../store/model/day_model.dart';
import '../model/tell_about_your_self_model.dart';
import '../view_model/business_hours_view_model.dart';
import 'set_your_business_hours_view.dart';
import 'describe_your_business_view.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  static final String name = 'auth-screen';

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final GlobalKey<TellUsAboutYourselfViewState> signUpKey =
      GlobalKey<TellUsAboutYourselfViewState>();
  final GlobalKey<TellUsAboutBusinessViewState> tellUsAboutBusinessKey =
      GlobalKey<TellUsAboutBusinessViewState>();

  final GlobalKey<DescribeYourBusinessViewState> describeYourBusinessKey =
      GlobalKey<DescribeYourBusinessViewState>();
  final GlobalKey<ConfirmYourLocationViewState> confirmYourLocationViewState =
      GlobalKey<ConfirmYourLocationViewState>();
  final GlobalKey<SetYourBusinessHoursViewState> businessHoursKey =
      GlobalKey<SetYourBusinessHoursViewState>();

  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      if (_pageController.hasClients) {
        jumpToPageWithData();
      }
    });
  }

  jumpToPageWithData() {
    final controller = Get.find<RegistrationViewModel>();
    if (controller.lastPage != 0) {
      _pageController.jumpToPage(controller.lastPage);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: GetBuilder<RegistrationViewModel>(
          builder: (controller) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: controller.currentIndex == 0 ? 32.h : 12.h),
                  _buildTopSection(context),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: Stack(
                      children: [
                        PageView(
                          controller: _pageController,
                          physics: const NeverScrollableScrollPhysics(),
                          onPageChanged: (index) {
                            controller.onPageChange(index);
                            handelGetData(controller);
                          },
                          children: [
                            TellUsAboutYourselfView(
                              key: signUpKey,
                              onValidChanged: (isValid) {
                                controller.onPageValidation(isValid, 0);
                              },
                            ),
                            DescribeYourBusinessView(
                              key: describeYourBusinessKey,
                              onValidChanged: (isValid) {
                                controller.onPageValidation(isValid, 1);
                              },
                            ),
                            TellUsAboutBusinessView(
                              key: tellUsAboutBusinessKey,
                              onValidChanged: (isValid) {
                                controller.onPageValidation(isValid, 2);
                              },
                            ),
                            ConfirmYourLocationView(
                              key: confirmYourLocationViewState,
                              onValidChanged: (isValid) {
                                controller.onPageValidation(isValid, 3);
                              },
                            ),
                            SetYourBusinessHoursView(
                              key: businessHoursKey,
                              onValidChanged: (isValid) {
                                controller.onPageValidation(isValid, 4);
                              },
                            ),
                            PresentYourLocationView(
                              onValidChanged: (isValid) {
                                controller.onPageValidation(isValid, 5);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),

      bottomNavigationBar: dynamicBottomILand(
        context: context,
        child: _buildButton(context),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    final isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    if (isKeyboardOpen) return const SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 5),
        GetBuilder<RegistrationViewModel>(
          builder: (controller) {
            return ElevatedButton(
              // onPressed: _handleOnPressed(controller),
              onPressed:
                  controller.pageValidation[controller.currentIndex] == true
                  ? () {
                      FocusScope.of(context).unfocus();
                      if (Get.find<RegistrationViewModel>().currentIndex == 0) {
                        final state = signUpKey.currentState;
                        if (state != null) {
                          state.submit();
                        }
                      }

                      if (Get.find<RegistrationViewModel>().currentIndex == 2) {
                        final state = tellUsAboutBusinessKey.currentState;
                        if (state != null) {
                          state.submit();
                        }
                      }

                      if (Get.find<RegistrationViewModel>().currentIndex < 5) {
                        WidgetsBinding.instance.addPostFrameCallback((_) async {
                          if (controller.pageValidation[controller
                                  .currentIndex] ==
                              true) {
                            await handleSaveDataAccordingToState(
                              controller,
                              controller.currentIndex,
                            );

                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                            );
                            // controller.onPageChange(controller.currentIndex+1);
                          }
                        });
                      } else {
                        Navigator.pushNamed(
                          context,
                          TermsAndConditionView.name,
                        );
                      }
                    }
                  : null,

              child: Text(
                controller.currentIndex == 5 ? 'Continue' : 'Next Step',
              ),
            );
          },
        ),
        SizedBox(height: 10),
        if (Get.find<RegistrationViewModel>().currentIndex == 5) ...[
          SizedBox(height: 2.h),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, TermsAndConditionView.name),
                  child: Text('Skip for now'),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ],
    );
  }

  Widget _buildTopSection(BuildContext context) {
    final currentSteps = Get.find<RegistrationViewModel>()
        .steps[Get.find<RegistrationViewModel>().currentIndex];
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
          style: fontSize16(context)!.copyWith(color: Colors.black54),
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
            Get.find<RegistrationViewModel>().currentIndex != 0
                ? GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                      Get.find<RegistrationViewModel>().onPageChange(
                        Get.find<RegistrationViewModel>().currentIndex - 1,
                      );
                      handelGetData(Get.find<RegistrationViewModel>());
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
            if (Get.find<RegistrationViewModel>().currentIndex == 1 ||
                Get.find<RegistrationViewModel>().currentIndex == 3)
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

  Future<void> handleSaveDataAccordingToState(
    RegistrationViewModel controller,
    int index,
  ) async {
    if (index == 0) {
      final state = signUpKey.currentState;
      if (state != null) {
        TellUsAboutYourSelfModel body = TellUsAboutYourSelfModel(
          firstName: state.fNameTEController.text.trim(),
          lastName: state.lNameTEController.text.trim(),
          countryCode: state.selectedCountryCode,
          mobileNumber: state.phoneTEController.text.trim(),
          email: state.emailTEController.text.trim(),
          password: state.passwordTEController.text.trim(),
          initialCountry: state.initialCountry,
        );
        await controller.saveDataToCache(body: body.toJson());
      }
    } else if (index == 1) {
      final state = describeYourBusinessKey.currentState;
      if (state != null) {
        final body = DescribeYourBusinessModel(
          index: state.selectedIndexes.value,
        );
        await controller.saveDataToCache(body: body.toJson());
      }
    } else if (index == 2) {
      final state = tellUsAboutBusinessKey.currentState;
      if (state != null) {
        final body = TellUsAboutYourBusinessModel(
          businessName: state.businessNameController.text.trim(),
          registrationName: state.registeredNameTEController.text.trim(),
          vatNumber: state.vatTEController.text.trim(),
          phoneNumber: PhonNumberModel(
            number: state.phoneTEController.text.trim(),
            countryCode: state.initialCountryCode,
            country: state.initialCountry,
          ),
          address: state.addressTEController.text.trim(),
          streetOrBuildingNumber: state.streetOrBuildingNumController.text
              .trim(),
          city: state.cityController.text.trim(),
          postalCode: state.postalTEController.text.trim(),
        );
        await controller.saveDataToCache(body: body.toJson());
      }
    } else if (index == 3) {
      final state = confirmYourLocationViewState.currentState;
      if (state != null) {
        final locationController = Get.find<LocationViewModel>();

        ConfirmYourLocationModel body = ConfirmYourLocationModel(
          streetAddress: locationController.landMarkTEController.text.trim(),
          additionalInfo: state.additionalTEController.text.trim(),

          position: state.position,
        );
        await controller.saveDataToCache(body: body.toJson());
      }
    } else if (index == 4) {
      final state = businessHoursKey.currentState;
      final businessHourController = Get.find<BusinessHoursViewModel>();
      List<Map<String, dynamic>> body = businessHourController.dayList.map((
        item,
      ) {
        return item.toJson();
      }).toList();

      if (state != null) {
        await controller.saveDataToCache(body: {}, listBody: body);
      }
    }
  }

  void handelGetData(RegistrationViewModel controller) {
    if (controller.currentIndex == 1) {
      describeYourBusinessKey.currentState?.getDataFromCache();
      describeYourBusinessKey.currentState?.updateValidation();
    } else if (controller.currentIndex == 2) {
      tellUsAboutBusinessKey.currentState?.getDataFromCache();
      tellUsAboutBusinessKey.currentState?.checkFilledOnly();
    } else if (controller.currentIndex == 3) {
      confirmYourLocationViewState.currentState?.getDataFromCache();
      confirmYourLocationViewState.currentState?.checkFormValidity();
    } else if (controller.currentIndex == 4) {
      Get.find<BusinessHoursViewModel>().getCacheData();
    }
  }
}
