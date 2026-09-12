import 'package:cenith_marchent/features/common/model/time_slot_model.dart';

class DayModel {
  String day;
  bool isOpen;
  List<ShiftSlot> slot;
  bool isOpen24Hrs;

  DayModel({
    required this.day,
    required this.isOpen,
    required this.slot,
    required this.isOpen24Hrs,
  });

  factory DayModel.fromJson(Map<String, dynamic> json) {
    return DayModel(
      day: json['day'] as String? ?? '',
      isOpen: json['isOpen'] as bool? ?? false,
      slot: (json['slot'] as List<dynamic>?)
          ?.map((item) => ShiftSlot.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
      isOpen24Hrs: json['isOpen24Hrs'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'isOpen': isOpen,
      'slot': slot.map((item) => item.toJson()).toList(),
      'isOpen24Hrs': isOpen24Hrs,
    };
  }
}