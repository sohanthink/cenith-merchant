import 'package:get/get.dart';

class CheckInOutViewModel extends GetxController {
  bool isExpanded = true;

  scrollDown (){
    isExpanded = false;
    update();
  }
  scrollFroward(){
    isExpanded = true;
    update();
  }

}