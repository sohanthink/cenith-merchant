import 'package:cenith_marchent/features/auth/view_model/business_hours_view_model.dart';
import 'package:cenith_marchent/features/auth/controllers/sign_in_controller.dart';
import 'package:cenith_marchent/features/auth/view_model/location_view_model.dart';
import 'package:cenith_marchent/features/auth/view_model/present_your_location_view_model.dart';
import 'package:cenith_marchent/features/auth/view_model/registration_view_model.dart';
import 'package:cenith_marchent/features/booking/view_moel/booking_view_model.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view_model/main_bottm_nav_view_model.dart';
import 'package:cenith_marchent/features/store/view_model/add_exception_view_model.dart';
import 'package:cenith_marchent/features/store/view_model/add_new_store_view_model.dart';
import 'package:cenith_marchent/features/store/view_model/edit_hour_view_model.dart';
import 'package:cenith_marchent/features/store/view_model/overview_view_model.dart';
import 'package:cenith_marchent/features/store/view_model/print_a_signage_view_model.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddNewStoreViewModel(), fenix: true);
    Get.lazyPut(() => MainBottomNavViewModel(), fenix: true);
    Get.lazyPut(() => EditHourViewModel(), fenix: true);
    Get.lazyPut(() => BookingViewModel(), fenix: true);
    Get.lazyPut(() => LocationViewModel(), fenix: true);
    Get.lazyPut(() => BusinessHoursViewModel(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => OverviewViewModel(), fenix: true);
    Get.lazyPut(() => AddExceptionViewModel(), fenix: true);
    Get.lazyPut(() => PrintASignageViewModel(), fenix: true);
    Get.lazyPut(() => RegistrationViewModel(), fenix: true);
    Get.lazyPut(() => PresentYourLocationViewModel(), fenix: true);
  }
}
