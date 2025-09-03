import 'dart:developer';

import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150.h,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.midLightBlue),
                child: Padding(
                  padding: EdgeInsets.only(top: 40.0.h),
                  child: Text(
                    'Booking',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1.sp,
                      color: Colors.white,
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
                        color: AppColors.midLightBlue,
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
                        color: AppColors.midLightBlue,
                        fontWeight: FontWeight.bold,
                      ),
                      weekendStyle: TextStyle(
                        color: AppColors.midLightBlue,
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
                buildTextFormField(),
                SizedBox(width: 5.w),
                buildIcons(Icons.icecream_outlined),
                buildIcons(Icons.icecream_outlined),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildElevatedButton('Today', () {}),
                buildElevatedButton('Upcoming', () {}, size: 120.w),
                buildElevatedButton('Past', () {}),
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
              color: AppColors.midLightBlue,
            ),
          ),
          Text('Your booking are coming soon',style: TextStyle(color: AppColors.midLightBlue),),
          SizedBox(height: 16.h,),
          RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 14,color: AppColors.midLightBlue),
            children: [
              TextSpan(text: 'Have question? '),
              TextSpan(text: 'Contact our support team',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15))
            ]
          )),
          
         SizedBox(height: 48.h,),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(350.w, 45.h),
                backgroundColor: AppColors.midLightBlue,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1.sp
                )
              ),
              onPressed: (){}, child: Text('Check in/out'))
          

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

  Widget buildTextFormField() {
    return Expanded(
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Search Booking',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColors.midLightBlue,
            fontSize: 12.sp,
          ),
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

  Widget buildIcons(IconData icon) {
    return Container(
      margin: EdgeInsets.all(3.w),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Icon(icon, size: 28.sp, color: AppColors.midLightBlue),
      ),
    );
  }

  Widget buildElevatedButton(
    String buttonName,
    VoidCallback onTap, {
    double? size,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.midLightBlue,
        foregroundColor: Colors.white,
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.1.sp,
        ),
        fixedSize: Size(size ?? 100.w, 40.h),
      ),
      onPressed: onTap,
      child: Text(buttonName),
    );
  }
}
