class TimeSlot {
  String from;
  String to;

  TimeSlot({required this.from, required this.to});

  Map<String, dynamic> toJson() => {"from": from, "to": to};
}

class DaySchedule {
  String day;
  bool isEnabled;
  TimeSlot slots;

  DaySchedule({required this.day, this.isEnabled = false, required this.slots});

  Map<String, dynamic> toJson() => {
    "day": day,
    "enabled": isEnabled,
    "slots": slots,
  };
}
