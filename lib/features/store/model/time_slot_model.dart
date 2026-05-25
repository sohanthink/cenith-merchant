class TimeSlotModel {
  List<ShiftSlot> timeSlots;

  TimeSlotModel({required this.timeSlots});
}

class ShiftSlot {
  String startTime;
  String endTime;

  ShiftSlot({required this.startTime, required this.endTime});
}
