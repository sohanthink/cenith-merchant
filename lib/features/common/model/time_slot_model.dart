class TimeSlotModel {
  List<ShiftSlot> timeSlots;

  TimeSlotModel({required this.timeSlots});
}

class ShiftSlot {
  String startTime;
  String endTime;

  ShiftSlot({
    required this.startTime,
    required this.endTime,
  });

  factory ShiftSlot.fromJson(Map<String, dynamic> json) {
    return ShiftSlot(
      startTime: json['start_time'] as String? ?? '',
      endTime: json['end_time'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'start_time': startTime,
      'end_time': endTime,
    };
  }
}