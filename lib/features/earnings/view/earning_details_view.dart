import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/sorting_section.dart';

class EarningDetailsView extends StatefulWidget {
  const EarningDetailsView({super.key});

  @override
  State<EarningDetailsView> createState() => _EarningDetailsViewState();
}

class _EarningDetailsViewState extends State<EarningDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SortingSection(),
          SizedBox(height: 15.h),
          buildDownloadSection(context),
          SizedBox(height: 15.h),
          buildTableTitleSection(context),
          Expanded(
            child: SingleChildScrollView(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return buildEarningDetailsTile(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildEarningDetailsTile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('Sumaia Market'), Text('2/28/2025')],
                ),
              ),
              Expanded(flex: 1, child: Center(child: Text('2 Bags/1 day'))),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$5.00'),
                    Text('LM2EB858', style: fontSize14(context)),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 1,
            decoration: BoxDecoration(
              color: Colors.grey.shade500,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDownloadSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(IconsPath.downloadIconSvg, color: AppColors.themColor),
        SizedBox(width: 10.w),
        Text(
          'Download SVG',
          style: fontSize16(context)!.copyWith(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }

  Widget buildTableTitleSection(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: AppColors.themColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Store and date',
            style: fontSize16(context)!.copyWith(color: Colors.white),
          ),
          Container(
            height: 70,
            width: 2,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            'Description',
            style: fontSize16(context)!.copyWith(color: Colors.white),
          ),
          Container(
            height: 70,
            width: 2,
            decoration: BoxDecoration(
              color: Colors.white38,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Text(
            'Booking and \naccount',
            style: fontSize16(context)!.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
