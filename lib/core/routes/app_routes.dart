import 'package:cenith_marchent/features/auth/view/Search_and_pick_location.dart';
import 'package:cenith_marchent/features/auth/view/auth_view.dart';
import 'package:cenith_marchent/features/auth/view/confirmation_code_entry_view.dart';
import 'package:cenith_marchent/features/auth/view/terms_and_condition_view.dart';
import 'package:cenith_marchent/features/booking/view/all_bookings_view.dart';
import 'package:cenith_marchent/features/booking/view/booking_details_view.dart';
import 'package:cenith_marchent/features/booking/view/booking_view.dart';
import 'package:cenith_marchent/features/booking/view/download_view.dart';
import 'package:cenith_marchent/features/common/widgets/learn_how_to_take_good_photo_widget.dart';
import 'package:cenith_marchent/features/home/view/home_view.dart';
import 'package:cenith_marchent/features/home/view/qr_code_scanning_view.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:cenith_marchent/features/more/view/edit_profile_view.dart';
import 'package:cenith_marchent/features/more/view/profile_view.dart';
import 'package:cenith_marchent/features/store/view/add_exception_view.dart';
import 'package:cenith_marchent/features/store/view/add_new_store_view.dart';
import 'package:cenith_marchent/features/store/view/benefits_of_linking_signage_view.dart';
import 'package:cenith_marchent/features/store/view/dont_have_camera_view.dart';
import 'package:cenith_marchent/features/store/view/edit_opening_hours_view.dart';
import 'package:cenith_marchent/features/store/view/link_bounce_signage.dart';
import 'package:cenith_marchent/features/store/view/order_tag_and_signage_view.dart';
import 'package:cenith_marchent/features/store/view/print_a_signage_view.dart';
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
    } else if (settings.name == QrCodeScanningView.name) {
      screenWidget = QrCodeScanningView();
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
    } else if (settings.name == DontHaveCameraView.name) {
      screenWidget = DontHaveCameraView();
    } else if (settings.name == OrderTagAndSignageView.name) {
      screenWidget = OrderTagAndSignageView();
    } else if (settings.name == PrintASignageView.name) {
      screenWidget = PrintASignageView();
    } else if (settings.name == AddExceptionView.name) {
      screenWidget = AddExceptionView();
    } else if (settings.name == AddNewStoreView.name) {
      screenWidget = AddNewStoreView();
    } else if (settings.name == EditOpeningHoursView.name) {
      screenWidget = EditOpeningHoursView();
    } else if (settings.name == AddNewStoreView.name) {
      screenWidget = AddNewStoreView();
    } else if (settings.name == AuthView.name) {
      screenWidget = AuthView();
    } else if (settings.name == TermsAndConditionView.name) {
      screenWidget = TermsAndConditionView();
    } else if (settings.name == ConfirmationCodeEntryView.name) {
      screenWidget = ConfirmationCodeEntryView();
    }else if (settings.name == ConfirmationCodeEntryView.name) {
      screenWidget = ConfirmationCodeEntryView();
    }else if (settings.name == SearchAndPickLocation.name) {
      screenWidget = SearchAndPickLocation();
    }else if (settings.name == LearnHowToTakeGoodPhotoWidget.name) {
      screenWidget = LearnHowToTakeGoodPhotoWidget();
    }

    return MaterialPageRoute(builder: (context) => screenWidget);
  }
}
