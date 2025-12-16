import 'package:get/get.dart';

class BookingViewModel extends GetxController {
  int selectedIndex = 0;
  List<String> button = ['Today', 'Upcoming', 'Past'];

  onTap(int index) {
    selectedIndex = index;
    update();
  }
}
