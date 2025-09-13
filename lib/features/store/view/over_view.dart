import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/text_theme.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildHeaderSection(context),
          SizedBox(height: 15.h),
          buildStoreOverViewSection(context),
          SizedBox(height: 30.h),
          buildStoreCommissionSection(context),
        ],
      ),
    );
  }

  Container buildStoreCommissionSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black12,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Store Commission',
            style: fontSize20(
              context,
            )!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.h),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.smallBagIconSvg,
            rate: '€1.5 ',
            titleText: 'per small bag stored',
          ),
          horizontalDevider(),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.luggageIconSvg,
            rate: '€3.50 ',
            titleText: 'per regular bag stored',
          ),
          horizontalDevider(),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.cycleIconSvg,
            rate: '€3.75 ',
            titleText: 'per odd size item stored',
          ),
          horizontalDevider(),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.walkWalkingIconSvg,
            rate: '€100 ',
            titleText: 'per 20 walk-in bookings',
          ),
        ],
      ),
    );
  }

  Container horizontalDevider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey.shade400,
    );
  }

  Widget storeCommissionRateCard(
    BuildContext context, {
    required String iconsPath,
    required String rate,
    required String titleText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(iconsPath),
          SizedBox(width: 6.w),
          Text(
            rate,
            style: fontSize16(
              context,
            )!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          //TODO: if The title i get from server then i have to make it dynamic by using textOverFlow
          Text(
            titleText,
            style: fontSize16(context)!.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildStoreOverViewSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        storeOverViewCard(context, title: '4.9', subTitle: 'Store rating'),
        Container(height: 60, width: 1, color: Colors.grey.shade500),
        storeOverViewCard(
          context,
          title: 'Retail Store',
          subTitle: 'Store type',
        ),
        Container(height: 60, width: 1, color: Colors.grey.shade500),
        storeOverViewCard(
          context,
          title: 'Unlimited',
          subTitle: 'Bag Capacity',
        ),
      ],
    );
  }

  Row storeOverViewCard(
    BuildContext context, {
    required String title,
    required String subTitle,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              title,
              style: fontSize20(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: fontSize16(context)!.copyWith(color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHeaderSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Overview',
          style: fontSize20(context)!.copyWith(fontWeight: FontWeight.bold),
        ),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.themColor,
            disabledForegroundColor: AppColors.themColor.shade50,

            side: BorderSide(color: AppColors.themColor, width: 2),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text('Print A Signage'),
        ),
      ],
    );
  }
}
