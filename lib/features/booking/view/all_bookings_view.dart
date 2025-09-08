import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/features/booking/view/past_view.dart';
import 'package:cenith_marchent/features/booking/view/today_view.dart';
import 'package:cenith_marchent/features/booking/view/upcoming_view.dart';
import 'package:cenith_marchent/features/booking/widgets/custom_circle_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllBookingsView extends StatefulWidget {
  const AllBookingsView({super.key});

  static final String name = 'all-bookings-screen';

  @override
  State<AllBookingsView> createState() => _AllBookingsViewState();
}

class _AllBookingsViewState extends State<AllBookingsView> {
  final TextEditingController _searchTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: AppBar(
          title: Text('Booking', style: style.headlineLarge!.copyWith(fontWeight: FontWeight.w700)),
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              Row(
                children: [
                  buildSearchTextField(style),
                  SizedBox(width: 5.w),
                  CustomCircleIcons(
                    icon: IconsPath.simpleToolIconSvg,
                    padding: 12.w,
                  ),
                  CustomCircleIcons(
                    icon: IconsPath.downloadIconSvg,
                    padding: 12.w,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                labelColor: AppColors.themColor,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 2.5,
                    color: AppColors.themColor,
                  ),
                  insets: EdgeInsets.symmetric(
                    horizontal: 0,
                  ), // indicator start
                ),
                tabs: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Today',
                      style: style.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Upcoming',
                      style: style.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Past',
                      style: style.titleSmall?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              Expanded(
                child: TabBarView(
                  children: [TodayView(), UpcomingView(), PastView()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearchTextField(TextTheme style) {
    return Expanded(
      child: TextFormField(
        controller: _searchTEController,
        decoration: InputDecoration(
          hintText: 'Search Bookings',
          hintStyle: style.titleSmall,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10.0.w),
            child: SvgPicture.asset(
              IconsPath.searchIconSvg,
              height: 20.h,
              width: 20.w,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 30.w,
            minHeight: 20.h,
          ),
          contentPadding: EdgeInsets.all(16.w),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchTEController.dispose();
    super.dispose();
  }
}
