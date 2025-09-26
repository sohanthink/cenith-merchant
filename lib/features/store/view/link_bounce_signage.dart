import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/home/view/home_view.dart';
import 'package:cenith_marchent/features/store/view/ready_to_link_view.dart';
import 'package:cenith_marchent/features/store/view/signage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LinkBounceSignage extends StatefulWidget {
  const LinkBounceSignage({super.key});

  static final String name = 'link-bounce-signage-screen';

  @override
  State<LinkBounceSignage> createState() => _LinkBounceSignageState();
}

class _LinkBounceSignageState extends State<LinkBounceSignage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Link Cenith Signage',
          style: fontSize16(context)?.copyWith(
            color: Colors.black,

            fontWeight: FontWeight.bold,
            letterSpacing: 0.1.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: _onTapPop,
            icon: Icon(Icons.close, ),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildImageBox(),
              SizedBox(height: 24.h),
              Text(
                'Link Signage To Your Location',
                style: fontSize16(context)?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1.sp,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'Linking signage is an important step to ensure walk-in customers book in the right location and you can earn bonuses along with it!',
                style: fontSize14(context)!.copyWith(color: Colors.black),
              ),
              SizedBox(height: 16.h),
              _buildLearnAboutWalkInsButton(context),
              SizedBox(height: 120.h),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Skip for now',
                      style: fontSize16(
                        context,
                      )?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, ReadyToLinkView.name),
                    child: Text('I\'m Ready To Link'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLearnAboutWalkInsButton(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Text(
            'Learn about walk-ins',
            style: fontSize16(
              context,
            )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
          ),
          SizedBox(width: 3.w),
          Icon(Icons.north_east_sharp, color: AppColors.themColor, size: 20.sp),
        ],
      ),
    );
  }

  Widget _buildImageBox() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: 250.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Image.asset(ImagePaths.bagImagePng),
        ),
      ],
    );
  }

  void _onTapPop() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, SignageView.name);
    }
  }
}
