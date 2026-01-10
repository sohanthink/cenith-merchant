
import 'package:get/get.dart';
import '../view_model/business_hours_model.dart';

class BusinessHoursController extends GetxController {
  bool isAllDay = false;
  bool isSameForAllDay = false;

  List<DaySchedule> schedules = [
    DaySchedule(
      day: "Saturday",
      isEnabled: true,
      slots: TimeSlot(from: '09:30', to: '09:30'),
    ),
    DaySchedule(
      day: "Sunday",
      slots: TimeSlot(from: '09:30', to: '09:30'),
    ),
    DaySchedule(
      day: "Monday",
      slots: TimeSlot(from: '09:30', to: '09:30'),
    ),
    DaySchedule(
      day: "Tuesday",
      slots: TimeSlot(from: '09:30', to: '09:30'),
    ),
    DaySchedule(
      day: "Wednesday",
      slots: TimeSlot(from: '09:30', to: '09:30'),
    ),
    DaySchedule(
      day: "Thursday",
      slots: TimeSlot(from: '09:30', to: '09:30'),
    ),
    DaySchedule(
      day: "Friday",
      slots: TimeSlot(from: '09:30', to: '09:30'),
    ),
  ];

  // ---------------- ALL DAY ----------------

  void toggleAllDay(bool value) {
    isAllDay = value;
    update();
  }

  // ---------------- DAY WISE ----------------

  void toggleDayEnabled(DaySchedule day, bool value) {
    day.isEnabled = value;
    update();
  }

  void updateSlotTime({
    required DaySchedule day,
    required bool isFrom,
    required String time,
  }) {
    final slot = day.slots;
    if (isFrom) {
      slot.from = time;
    } else {
      slot.to = time;
    }
    print("Day ${day.day} From: ${slot.from} To: ${slot.to} ");
    update();
  }

  bool get isValid {
    if (isAllDay) return true;
    return schedules.any((item) => item.day.isNotEmpty);
  }

  changeStatusForAllDay(DaySchedule pickedTime, bool value) {
    isSameForAllDay = value;
    for (int i = 0; i < schedules.length; i++) {
      schedules[i].day = pickedTime.day;
      schedules[i].slots = pickedTime.slots;
    }
    update();
  }
}
