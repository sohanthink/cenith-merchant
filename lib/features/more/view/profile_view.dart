import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/more/view/edit_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  static final String name = 'profile-screen';

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -130.h,
            right: 50.w,
            child: Container(
              width: 280.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: AppColors.themColor, // Blue color
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.elliptical(300.r, 200.r)),
              ),
            ),
          ),
          Positioned(
            top: -100.h,
            left: -120.w,
            child: Container(
              width: 270.w,
              height: 240.h,
              decoration: BoxDecoration(
                color: Color(0xFFFFD100), // Yellow color
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(200.r),
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 110.h),
                    buildUserInfo(context),
                    SizedBox(height: 48.h),
                    _buildBenefitsAndSettings(context),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildUserInfo(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.themColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.r,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(ImagePaths.personDemo, fit: BoxFit.cover),
          ),
        ),
        SizedBox(width: 15.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Donald',
              style: fontSize24(context)?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.themColor,
                letterSpacing: 0.1.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'anna@gmail.com',
              style: fontSize16(context)?.copyWith(letterSpacing: 0.1.sp),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBenefitsAndSettings(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.r,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),
            Text('Benefits', style: fontSize14(context)),
            space(10),
            _buildBenefitsAndSettingsCard(
              context,
              icon: IconsPath.rewardIconSvg,
              title: 'Rewards',
              onTapC: () {},
            ),
            SizedBox(height: 32.h),
            Text('Settings', style: fontSize14(context)),
            space(10),
            _buildBenefitsAndSettingsCard(
              context,
              icon: IconsPath.settingsIconSvg,
              title: 'Profile',
              Ticon: Icons.error_outline_outlined,
              onTapT: () {},
              onTapC: () => Navigator.pushNamed(context, EditProfileView.name),
            ),
            space(10),
            _buildBenefitsAndSettingsCard(
              context,
              icon: IconsPath.peopleStaffIconSvg,
              title: 'Staff management',
              Ticon: Icons.error_outline_outlined,
              onTapT: () {},
              onTapC: () {},
            ),
            space(10),
            _buildBenefitsAndSettingsCard(
              context,
              icon: IconsPath.chattingIconSvg,
              title: 'Chat with support',
              onTapC: () {},
            ),
            space(10),
            _buildBenefitsAndSettingsCard(
              context,
              icon: IconsPath.questionRoundIconSvg,
              title: 'Help center',
              onTapC: () {},
            ),
            space(10),
            _buildBenefitsAndSettingsCard(
              context,
              icon: IconsPath.logOutIconSvg,
              title: 'Log out',
              onTapC: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefitsAndSettingsCard(
    BuildContext context, {
    required String icon,
    required String title,
    VoidCallback? onTapT,
    required VoidCallback onTapC,
    IconData? Ticon,
  }) {
    return GestureDetector(
      onTap: onTapC,
      child: Container(
        height: 50.h,
        width: 350.w,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300, width: 1.5.w),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4.0.h),
                child: SvgPicture.asset(icon, width: 25.w),
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: fontSize16(
                  context,
                )?.copyWith(fontWeight: FontWeight.bold),
              ),
              Spacer(),
              if (Ticon != null)
                IconButton(
                  onPressed: onTapT,
                  icon: Icon(Ticon, color: AppColors.midLightBlue),
                ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox space(double h) => SizedBox(height: h.h);
}
