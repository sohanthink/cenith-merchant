import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/common/widgets/custom_checkin_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asstes_path/icons_path.dart';
import '../../common/widgets/topic_header.dart';
import '../widgets/dashboard_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  static final String name = 'home-screen';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            buildHeaderSection(context),
            Expanded(
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Track and manage your operations for the day.',
                      style: TextTheme.of(context).headlineMedium!.copyWith(
                        color: AppColors.themColor.shade500,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      'Your Dashboard',
                      style: fontSize26(
                        context,
                      )!.copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 20.h),
                    HeaderButtonWidget(),
                    SizedBox(height: 30.h),
                    buildDashBoardSection(),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomCheckInOutWidget(
        controller: controller,
        maxWidth: 0.92.sw,
      ),
    );
  }

  // it will removed and will adjusted with state management;
  int selectedIndex = 0;

  ListView buildDashBoardSection() {
    List<Map<String, dynamic>> item = [
      {'title': 'Customer To Check In', 'count': 0, 'sub-title': null},
      {'title': 'Customer To Check Out', 'count': 0, 'sub-title': null},
      {
        'title': 'Walk-ins',
        'count': 0,
        'sub-title': 'Walk-ins left for next €100.00 bonus: 20 ',
      },
    ];

    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: item.length,
      itemBuilder: ((BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            selectedIndex = index;
            setState(() {});
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? 0 : 8.0,
              left: 0,
              right: 0,
              bottom: 0,
            ),
            child: BuildDashboardCard(
              title: item[index]['title'],
              count: item[index]['count'],
              subTitle: item[index]['sub-title'],
              isSelected: selectedIndex == index,
            ),
          ),
        );
      }),
    );
  }

  Widget buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 35.h),
        Row(
          children: [
            topicHeader(title: 'Hello Ashraful!', subTitle: 'good morning'),
            Spacer(),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(IconsPath.messageIconSvg),
            ),
            SizedBox(width: 8.w),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(IconsPath.iButtonIconSvg),
            ),
          ],
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}

class HeaderButtonWidget extends StatefulWidget {
  const HeaderButtonWidget({super.key});

  @override
  State<HeaderButtonWidget> createState() => _HeaderButtonWidgetState();
}

class _HeaderButtonWidgetState extends State<HeaderButtonWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ['Today', 'Upcoming', 'Past'].asMap().entries.map((item) {
        return GestureDetector(
          onTap: () {
            selectedIndex = item.key;
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: item.key == selectedIndex
                  ? AppColors.themColor
                  : Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Text(
                item.value,
                style: TextStyle(
                  color: item.key == selectedIndex
                      ? Colors.white
                      : AppColors.themColor,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
