import 'package:cenith_marchent/features/booking/view/all_bookings_view.dart';
import 'package:cenith_marchent/features/booking/view/booking_details_view.dart';
import 'package:cenith_marchent/features/booking/view/booking_view.dart';
import 'package:cenith_marchent/features/booking/view/download_view.dart';
import 'package:cenith_marchent/features/home/view/home_view.dart';
import 'package:cenith_marchent/features/home/view/qr_code_scanning_screen.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:cenith_marchent/features/more/view/edit_profile_view.dart';
import 'package:cenith_marchent/features/more/view/profile_view.dart';
import 'package:cenith_marchent/features/store/view/benefits_of_linking_signage_view.dart';
import 'package:cenith_marchent/features/store/view/link_bounce_signage.dart';
import 'package:cenith_marchent/features/store/view/ready_to_link_view.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    late final Widget screenWidget;
    if (settings.name == HomeView.name) {
      screenWidget = HomeView();
    }
    if (settings.name == MainBottomNavView.name) {
      screenWidget = MainBottomNavView();
    } else if (settings.name == BookingView.name) {
      screenWidget = BookingView();
    } else if (settings.name == QrCodeScanningScreen.name) {
      screenWidget = QrCodeScanningScreen();
    } else if (settings.name == AllBookingsView.name) {
      screenWidget = AllBookingsView();
    } else if (settings.name == BookingDetailsView.name) {
      screenWidget = BookingDetailsView();
    } else if (settings.name == DownloadView.name) {
      screenWidget = DownloadView();
    } else if (settings.name == ProfileView.name) {
      screenWidget = ProfileView();
    } else if (settings.name == EditProfileView.name) {
      screenWidget = EditProfileView();
    } else if (settings.name == BenefitsOfLinkingSignageView.name) {
      screenWidget = BenefitsOfLinkingSignageView();
    } else if (settings.name == LinkBounceSignage.name) {
      screenWidget = LinkBounceSignage();
    } else if (settings.name == ReadyToLinkView.name) {
      screenWidget = ReadyToLinkView();
    }
    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
