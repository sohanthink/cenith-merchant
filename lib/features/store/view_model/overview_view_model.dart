import 'package:get/get.dart';

class OverviewViewModel extends GetxController {
  bool isExpanded = false;

  changeExpandedStatus() {
    isExpanded = !isExpanded;
    update();
  }
}
