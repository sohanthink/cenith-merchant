class OpeningHourModel {
  final String day;
  final bool isOpen;
  final List<ShiftModel> shifts;

  OpeningHourModel({
    required this.day,
    required this.isOpen,
    required this.shifts,
  });

  factory OpeningHourModel.fromJson(Map<String, dynamic> json) {
    return OpeningHourModel(
      day: json['day'] ?? '',
      isOpen: json['isOpen'] ?? false,
      shifts: (json['shifts'] as List<dynamic>? ?? [])
          .map((item) => ShiftModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'isOpen': isOpen,
      'shifts': shifts.map((item) => item.toJson()).toList(),
    };
  }
}

class ShiftModel {
  final String openingTime;
  final String closingTime;

  ShiftModel({required this.openingTime, required this.closingTime});

  factory ShiftModel.fromJson(Map<String, dynamic> json) {
    return ShiftModel(
      openingTime: json['openingTime'] ?? '',
      closingTime: json['closingTime'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {'openingTime': openingTime, 'closingTime': closingTime};
  }
}
