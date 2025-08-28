import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asstes_path/icons_path.dart';
import '../../common/topic_header.dart';
import '../widgets/dashboard_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String name = 'home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderSection(context),
            SizedBox(height: 20.h),
            Text(
              'Your Dashboard',
              style: TextTheme.of(
                context,
              ).titleLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            BuildDashBoardSection(),
            SizedBox(height: 8.h),
            Expanded(child: buildDashBoardSection()),

          ],
        ),
      ),
    );
  }
  // it will removed and will adjusted with state management;
  int selectedIndex = 0;

  ListView buildDashBoardSection() {


    List<Map<String,dynamic>> item = [
      {
        'title' : 'Customer To Check In',
        'count' : 0,
      },
      {
        'title' : 'Customer To Check Out',
        'count' : 0,
      },
      {
        'title' : 'Walk-ins',
        'count' : 0,
      }
    ];

    return ListView.builder(
      itemCount: item.length,
      itemBuilder: ((BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            selectedIndex = index;
            setState(() {});
            print(selectedIndex);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BuildDashboardCard(
              title: item[index]['title'],
              count: item[index]['count'],
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
        SizedBox(height: 45.h),
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
        Text(
          'Track and manage your operations for the day.',
          style: TextTheme.of(
            context,
          ).headlineMedium!.copyWith(color: AppColors.themColor.shade500),
        ),
      ],
    );
  }
}

class BuildDashBoardSection extends StatefulWidget {
  const BuildDashBoardSection({super.key});

  @override
  State<BuildDashBoardSection> createState() => _BuildDashBoardSectionState();
}

class _BuildDashBoardSectionState extends State<BuildDashBoardSection> {
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
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
