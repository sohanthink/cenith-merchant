import 'package:cenith_marchent/features/auth/controllers/business_hours_controller.dart';
import 'package:cenith_marchent/features/auth/controllers/sign_in_controller.dart';
import 'package:cenith_marchent/features/auth/view_model/location_view_model.dart';
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
    Get.put(AddNewStoreViewModel());
    Get.put(MainBottomNavViewModel());
    Get.put(EditHourViewModel());
    Get.put(BookingViewModel());
    Get.put(LocationViewModel());
    Get.put(BusinessHoursController());
    Get.put(SignInController());
    Get.put(OverviewViewModel());
    Get.put(AddExceptionViewModel());
    Get.put(PrintASignageViewModel());
  }
}
