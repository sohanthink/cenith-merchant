import 'package:get/get.dart';
import '../view_model/business_hours_model.dart';

class BusinessHoursController extends GetxController {

  bool isAllDay = false;
  String allDayFrom = "00:00";
  String allDayTo = "23:59";

  final List<DaySchedule> schedules = [
    DaySchedule(
      day: "Saturday",
      isEnabled: true,
      isExpanded: true,
      slots: [TimeSlot(from: "09:00", to: "17:00")],
    ),
    DaySchedule(day: "Sunday", slots: []),
    DaySchedule(day: "Monday", slots: []),
    DaySchedule(day: "Tuesday", slots: []),
    DaySchedule(day: "Wednesday", slots: []),
    DaySchedule(day: "Thursday", slots: []),
    DaySchedule(day: "Friday", slots: []),
  ];

  // ---------------- ALL DAY ----------------

  void toggleAllDay(bool value) {
    isAllDay = value;

    if (value) {
      // disable day-wise schedules
      for (final d in schedules) {
        d.isEnabled = false;
        d.isExpanded = false;
        d.slots.clear();
      }
    }

    update();
  }

  void setAllDayFrom(String time) {
    allDayFrom = time;
    update();
  }

  void setAllDayTo(String time) {
    allDayTo = time;
    update();
  }

  // ---------------- DAY WISE ----------------

  void toggleDayEnabled(DaySchedule day, bool value) {
    day.isEnabled = value;
    update();
  }

  void toggleExpanded(DaySchedule day) {
    day.isExpanded = !day.isExpanded;
    update();
  }

  void addSlot(DaySchedule day) {
    day.slots.add(TimeSlot(from: "09:00", to: "17:00"));
    update();
  }

  void removeSlot(DaySchedule day, int index) {
    day.slots.removeAt(index);
    update();
  }

  void updateSlotTime({
    required DaySchedule day,
    required int index,
    required bool isFrom,
    required String time,
  }) {
    final slot = day.slots[index];

    if (isFrom) {
      slot.from = time;
    } else {
      slot.to = time;
    }

    update();
  }

  // ---------------- VALIDATION ----------------

  bool get isValid {
    if (isAllDay) return true;
    return schedules.any((d) => d.isEnabled && d.slots.isNotEmpty);
  }

  // ---------------- API PAYLOAD ----------------

  Map<String, dynamic> toJson() {
    if (isAllDay) {
      return {
        "type": "all_day",
        "from": allDayFrom,
        "to": allDayTo,
      };
    }

    return {
      "type": "weekly",
      "days": schedules.map((e) => e.toJson()).toList(),
    };
  }
}
