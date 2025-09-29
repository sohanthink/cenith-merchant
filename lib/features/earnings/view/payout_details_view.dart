import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/earnings/widgets/table_title_section_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayoutDetailsView extends StatefulWidget {
  const PayoutDetailsView({super.key});

  @override
  State<PayoutDetailsView> createState() => _PayoutDetailsViewState();
}

class _PayoutDetailsViewState extends State<PayoutDetailsView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildDashboardSeciton(context),
            SizedBox(height: 30.h),
            buildPayoutBreakdownSection(context),
            SizedBox(height: 10),
            buildPaginationSection(context),
          ],
        ),
      ),
    );
  }

  Column buildPaginationSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 10.w),
                  Text('Previous'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text('Previous'),
                  SizedBox(width: 10.w),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'To learn more about receipts please read our ',
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
              TextSpan(
                text: 'FAQ page',
                style: fontSize14(context),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),

        SizedBox(height: 200.h),

        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Have a question?  ',
                style: fontSize14(context)!.copyWith(color: Colors.black),
              ),
              TextSpan(
                text: 'Contact Out Support Team',
                style: fontSize14(context),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget buildPayoutBreakdownSection(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payout breakdown',
            style: fontSize20(
              context,
            )!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 15),
          TableTitleSectionWidget(
            title1: 'Initated',
            title2: 'Payout Account',
            title3: 'Amount',
          ),
          SizedBox(height: 10),
          buildEarningDetailsTile(context),
        ],
      ),
    );
  }

  Widget buildDashboardSeciton(BuildContext context) {
    List<Map<String, dynamic>> card = [
      {'title': 'Ready for payout', 'amt': '\$25.50'},
      {'title': 'Processing', 'amt': '0.00'},
      {'title': 'Payout date', 'amt': '1 mar'},
    ];

    return Column(
      children: [
        ...card.asMap().entries.map((item) {
          return GestureDetector(
            //TODO: update with viewModel;
            onTap: ()=>setState(() {
              selectedIndex  = item.key;
            }),
            child: dashboardCard(
              context,
              title: item.value['title'],
              amount: item.value['amt'],
              isSelected: selectedIndex == item.key,
            ),
          );
        }),

        Center(
          child: Text('Visit Stripe Dashboard', style: fontSize16(context)),
        ),
        SizedBox(height: 25.h),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    '*Recent earnings that are still being processed or '
                    'on the way to your payout account.'
                    ' Payment of these values may carry-over for next payout.',

                style: fontSize14(context)!.copyWith(color: Colors.black),
              ),
              TextSpan(
                text: ' Read more in our FAQs page >',
                style: fontSize14(context),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget dashboardCard(
    BuildContext context, {
    required String title,
    required String amount,
    required bool isSelected,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      height: 100.h,
      decoration: BoxDecoration(
        color: isSelected ? AppColors.themColor : Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              title,
              style: fontSize20(
                context,
              )!.copyWith(color: isSelected? Colors.white: Colors.black, fontWeight: FontWeight.w400),
            ),
            Text(
              amount,
              style: fontSize24(
                context,
              )!.copyWith(color: isSelected? Colors.white: Colors.black, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildEarningDetailsTile(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: Text('1/31/25')),
              Expanded(
                flex: 1,
                child: Center(child: Text('POSTE ITALIANE \nS.P.A. 4341')),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('\$66.00'),
                    SizedBox(width: 10.w),
                    SvgPicture.asset(IconsPath.downloadIconSvg),
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
}
