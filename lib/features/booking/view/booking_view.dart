import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/booking/view/download_view.dart';
import 'package:cenith_marchent/features/booking/view_moel/booking_view_model.dart';
import 'package:cenith_marchent/features/booking/widgets/custom_circle_icons.dart';
import 'package:cenith_marchent/features/common/widgets/contact_support_text.dart';
import 'package:cenith_marchent/features/common/widgets/custom_checkin_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../common/widgets/loading_annimation.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  static final String name = 'booking-screen';

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  DateTime now = DateTime.now();

  bool _isCalendarReady = false;

  late final DateTime _finalFirstDay = DateTime.utc(now.year - 10, 1, 1);
  late final DateTime _finalLastDay = DateTime.utc(now.year + 10, 12, 31);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 100), () {
        if (mounted) {
          setState(() {
            _isCalendarReady = true;
          });
        }
      });
    });
  }

  ScrollController controller = ScrollController();

  DateTime? _selectedDay;
  DateTime? _rangeStart = DateTime.now();
  DateTime? _rangeEnd = DateTime.now().add(Duration(days: 3));

  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOn;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        controller: controller,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: AppColors.themeColor),
                  child: Padding(
                    padding: EdgeInsets.only(top: 40.0.h),
                    child: Text(
                      'Booking',
                      style: style.titleMedium?.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                buildCalenderSection(),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                children: [
                  buildTextFormField(style),
                  SizedBox(width: 5.w),
                  CustomCircleIcons(
                    icon: IconsPath.toolsFilterIconSvg,
                    onTap: () =>
                        Navigator.pushNamed(context, DownloadView.name),
                  ),
                  CustomCircleIcons(
                    icon: IconsPath.downloadIconSvg,
                    onTap: () =>
                        Navigator.pushNamed(context, DownloadView.name),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: GetBuilder<BookingViewModel>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...controller.button.asMap().entries.map((item) {
                        return buildElevatedButton(
                          isSelected: item.key == controller.selectedIndex,
                          buttonName: item.value,
                          onTap: () {
                            controller.onTap(item.key);
                          },
                        );
                      }),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 40.h),
            Center(child: LoadingAnimation()),
            Text(
              "You Don't Have Any Booking",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,

              ),
            ),
            Text(
              'Your booking are coming soon',
              style: fontSize12(context),
            ),
            SizedBox(height: 16.h),
            ContactSupportText.supportText(context, () {}),
            SizedBox(height: 48.h),
          ],
        ),
      ),
      floatingActionButton: CustomCheckInOutWidget(
        controller: controller,
        maxWidth: 0.92.sw,
      ),
    );
  }

  Widget buildCalenderSection() {
    return Padding(
      padding: EdgeInsets.only(top: 80.h),
      child: Container(
        margin: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.r,
              offset: Offset(0, 3),
            ),
          ],
        ),
        // 💡
        child: _isCalendarReady
            ? TableCalendar(
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
                    height: 1,
                    color: AppColors.themeColor,
                    fontSize: 16.sp,
                  ),
                  weekendStyle: TextStyle(
                    height: 1,
                    color: AppColors.themeColor,
                    fontSize: 16,
                  ),
                ),
                availableGestures: AvailableGestures.horizontalSwipe,

                firstDay: _finalFirstDay,
                lastDay: _finalLastDay,
                focusedDay: _selectedDay ?? DateTime.now(),

                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),

                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                rangeSelectionMode: _rangeSelectionMode,
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _rangeStart = null;
                    _rangeEnd = null;
                    _rangeSelectionMode = RangeSelectionMode.toggledOff;
                  });
                },
                onRangeSelected: (start, end, focusedDay) {
                  setState(() {
                    _selectedDay = null;
                    _rangeStart = start;
                    _rangeEnd = end;
                    _rangeSelectionMode = RangeSelectionMode.toggledOn;
                  });
                  print('Start: $start end: $end');
                },
                headerStyle: HeaderStyle(
                  titleCentered: true,
                  formatButtonVisible: false,
                ),
                calendarBuilders: CalendarBuilders(
                  headerTitleBuilder: (_, dateTime) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: Text(
                          _monthName(dateTime.month),
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                  rangeStartBuilder: (_, day, _) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  rangeEndBuilder: (_, day, _) {
                    return Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                  selectedBuilder: (_, _, _) {
                    return Container(
                      decoration: BoxDecoration(shape: BoxShape.rectangle),
                    );
                  },
                  todayBuilder: (context, day, focusDay) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: _selectedDay != null && _selectedDay == day
                            ? AppColors.themeColor
                            : Colors.transparent,
                      ),
                      child: Text(
                        textAlign: TextAlign.start,
                        '${day.day}',
                        style: TextStyle(fontSize: 17.sp, color: Colors.black),
                      ),
                    );
                  },
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: AppColors.themeColor,
                  ),
                  rangeStartDecoration: BoxDecoration(
                    color: AppColors.themeColor,
                  ),
                ),
              )
            : SizedBox(
                height: 350.h,
                child: Center(child: LoadingAnimation()),
              ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }

  Widget buildTextFormField(TextTheme style) {
    return Expanded(
      child: TextFormField(
        style: TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: 'Search Booking',
          hintStyle: fontSize14(context)!.copyWith(letterSpacing: 0.1.sp),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 15.w, right: 10),
            child: SvgPicture.asset(IconsPath.searchIconSvg),
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 40, maxWidth: 50),
          filled: true,
          fillColor: Colors.white,
          border: border(),
          focusedBorder: border(),
          disabledBorder: border(),
          enabledBorder: border(),
          focusedErrorBorder: border(),
          errorBorder: border(),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none,
    );
  }

  Widget buildElevatedButton({
    required String buttonName,
    required VoidCallback onTap,
    double? size,
    required bool isSelected,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? AppColors.themeColor : Colors.white,
            foregroundColor: isSelected ? Colors.white : Colors.black,
            fixedSize: Size(size ?? 100.w, 40.h),
          ),
          onPressed: onTap,
          child: FittedBox(fit: BoxFit.scaleDown, child: Text(buttonName)),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
