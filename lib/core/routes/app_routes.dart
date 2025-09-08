import 'package:cenith_marchent/features/booking/view/all_bookings_view.dart';
import 'package:cenith_marchent/features/booking/view/booking_screen.dart';
import 'package:cenith_marchent/features/home/view/home_view.dart';
import 'package:cenith_marchent/features/home/view/qr_code_scanning_screen.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;
    if (settings.name == HomeView.name) {
      screenWidget = HomeView();
    }
    if (settings.name == MainBottomNavView.name) {
      screenWidget = MainBottomNavView();
    } else if (settings.name == BookingScreen.name) {
      screenWidget = BookingScreen();
    } else if (settings.name == QrCodeScanningScreen.name) {
      screenWidget = QrCodeScanningScreen();
    } else if (settings.name == AllBookingsView.name) {
      screenWidget = AllBookingsView();
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
