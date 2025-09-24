import 'package:cenith_marchent/features/main_bottom_nav/view_model/main_bottm_nav_view_model.dart';
import 'package:cenith_marchent/features/store/view_model/edit_hour_view_model.dart';
import 'package:get/get.dart';

class ControllerBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavViewModel());
    Get.put(EditHourViewModel());

  }

}