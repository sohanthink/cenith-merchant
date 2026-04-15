import 'package:cenith_marchent/features/booking/widgets/past_booking_widget.dart';
import 'package:cenith_marchent/features/booking/widgets/today_booking_widget.dart';
import 'package:cenith_marchent/features/booking/widgets/upcoming_booking_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookingViewModel extends GetxController {
  int selectedIndex = 0;
  List<String> button = ['Today', 'Upcoming', 'Past'];
  List<Widget> screens = [
    TodayBookingWidget(),
    UpcomingBookingWidget(),
    PastBookingWidget(),
  ];
  double calenderHeight = 0.00;

  onTap(int index) {
    selectedIndex = index;
    update();
  }

  setCalenderHeight(double height) {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (height != calenderHeight) {
        calenderHeight = height;
        debugPrint('calender height updated: $height');
        update();
      }
    });
  }
}
