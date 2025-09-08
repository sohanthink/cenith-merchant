import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/features/booking/widgets/custom_circle_icons.dart';
import 'package:cenith_marchent/features/common/contact_support_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  static final String name = 'booking-screen';

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.themColor),
                child: Padding(
                  padding: EdgeInsets.only(top: 40.0.h),
                  child: Text(
                    'Booking',
                    style: style.titleMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 80.h),
                child: Container(
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TableCalendar(
                    focusedDay: DateTime.now(),
                    firstDay: DateTime.utc(2000, 1, 12),
                    lastDay: DateTime.utc(2100, 1, 12),
                    selectedDayPredicate: (day) =>
                        isSameDay(day, DateTime.now()),

                    headerStyle: HeaderStyle(
                      titleTextFormatter: (date, locale) {
                        return '${_monthName(date.month)}';
                      },
                      titleTextStyle: TextStyle(
                        fontSize: 20.sp,
                        color: AppColors.themColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.1.sp,
                      ),
                      formatButtonVisible: false,
                      titleCentered: true,
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Colors.black,
                      ),
                    ),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      dowTextFormatter: (date, locale) {
                        return date.weekday == DateTime.sunday
                            ? 'S'
                            : date.weekday == DateTime.monday
                            ? 'M'
                            : date.weekday == DateTime.tuesday
                            ? 'T'
                            : date.weekday == DateTime.wednesday
                            ? 'W'
                            : date.weekday == DateTime.thursday
                            ? 'T'
                            : date.weekday == DateTime.friday
                            ? 'F'
                            : 'S';
                      },
                      weekdayStyle: TextStyle(
                        color: AppColors.themColor,
                        fontWeight: FontWeight.bold,
                      ),
                      weekendStyle: TextStyle(
                        color: AppColors.themColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    calendarStyle: CalendarStyle(
                      defaultTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      weekendTextStyle: TextStyle(fontWeight: FontWeight.bold),
                      todayDecoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              children: [
                buildTextFormField(style),
                SizedBox(width: 5.w),
                CustomCircleIcons(icon: IconsPath.toolsFilterIconSvg),
                CustomCircleIcons(icon: IconsPath.downloadIconSvg),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildElevatedButton('Today', () {}, style),
                buildElevatedButton('Upcoming', () {}, style, size: 120.w),
                buildElevatedButton('Past', () {}, style),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Center(child: CircularProgressIndicator()),
          Text(
            "You Don't Have Any Booking",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: AppColors.themColor,
            ),
          ),
          Text(
            'Your booking are coming soon',
            style: TextStyle(color: AppColors.midLightBlue),
          ),
          SizedBox(height: 16.h),
          ContactSupportText.supportText(context, () {}),

          SizedBox(height: 48.h),
          ElevatedButton(onPressed: () {}, child: Text('Check in/out')),
        ],
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "january",
      "february",
      "march",
      "april",
      "may",
      "june",
      "july",
      "august",
      "september",
      "october",
      "november",
      "december",
    ];
    return months[month - 1];
  }

  Widget buildTextFormField(TextTheme style) {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search Booking',
          hintStyle: style.headlineMedium?.copyWith(letterSpacing: 0.1.sp),
          prefixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Icon(
              Icons.search,
              color: AppColors.midLightBlue,
              size: 25.sp,
            ),
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 25, maxWidth: 35),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.all(14.w),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildElevatedButton(
    String buttonName,
    VoidCallback onTap,
    TextTheme style, {
    double? size,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.themColor,
        foregroundColor: Colors.white,
        textStyle: style.titleSmall?.copyWith(fontWeight: FontWeight.w600),
        fixedSize: Size(size ?? 100.w, 40.h),
      ),
      onPressed: onTap,
      child: Text(buttonName),
    );
  }
}
