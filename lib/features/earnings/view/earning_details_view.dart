import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/earnings/earning_statement/view_model/earning_stmnt.dart';
import 'package:cenith_marchent/features/earnings/widgets/table_title_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/sorting_section_widget.dart';

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
          SortingSectionWidget(),
          SizedBox(height: 15.h),
          buildDownloadSection(context),
          SizedBox(height: 15.h),
          buildTableTitleSection(),
          SizedBox(height: 15.h),
          buildTableDataSection(),
        ],
      ),
    );
  }

  Expanded buildTableDataSection() {
    return Expanded(
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
    );
  }

  TableTitleSectionWidget buildTableTitleSection() {
    return TableTitleSectionWidget(
      title1: 'Store and date',
      title2: 'Description',
      title3: 'Booking and \naccount',
    );
  }

  Widget buildEarningDetailsTile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sumaia Market', style: fontSize12(context)),
                    SizedBox(height: 5),
                    Text('2/28/2025', style: fontSize12(context)),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    textAlign: TextAlign.start,
                    '2 Bags/1 day',
                    style: fontSize12(context),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('\$5.00', style: fontSize12(context)),
                    Text('LM2EB858', style: fontSize12(context)),
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
    return GestureDetector(
      onTap: () {
        EarningStatement.downloadEarningTablePdf();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            IconsPath.downloadIconSvg,
            colorFilter: ColorFilter.mode(
              AppColors.themeColor,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            'Download SVG',
            style: fontSize16(context)!.copyWith(
              color: AppColors.themeColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
