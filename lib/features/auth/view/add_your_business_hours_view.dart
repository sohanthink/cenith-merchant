import 'package:cenith_marchent/features/auth/widgets/day_tile.dart';
import 'package:flutter/material.dart';

class AddYourBusinessHoursView extends StatefulWidget {
  const AddYourBusinessHoursView({super.key, required this.onValidChanged});

  static final String name = 'add-your-business-hours-screen';
  final Function(bool isValid) onValidChanged;

  @override
  State<AddYourBusinessHoursView> createState() =>
      _AddYourBusinessHoursViewState();
}

class _AddYourBusinessHoursViewState extends State<AddYourBusinessHoursView> {
  final List<DaySchedule> schedules = [
    DaySchedule(
      day: "Saturday",
      isEnabled: true,
      isExpanded: true,
      slots: [TimeSlot(from: "09:00", to: "17:00")],
    ),
    DaySchedule(day: "Sunday", isEnabled: false, slots: []),
    DaySchedule(day: "Monday", isEnabled: false, slots: []),
    DaySchedule(day: "Tuesday", isEnabled: false, slots: []),
    DaySchedule(day: "Wednesday", isEnabled: false, slots: []),
    DaySchedule(day: "Thursday", isEnabled: false, slots: []),
    DaySchedule(day: "Friday", isEnabled: false, slots: []),
  ];

  void _updateAndValidate(VoidCallback action) {
    setState(action);
    widget.onValidChanged(_isValidSchedule());
  }

  bool _isValidSchedule() {
    return schedules.any((d) => d.isEnabled && d.slots.isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: schedules.length,
      itemBuilder: (context, index) {
        final day = schedules[index];

        return DayTile(
          data: day,
          onToggleEnabled: (v) => _updateAndValidate(() => day.isEnabled = v),
          onToggleExpanded: () =>
              _updateAndValidate(() => day.isExpanded = !day.isExpanded),
          onAddSlot: () => _updateAndValidate(
            () => day.slots.add(TimeSlot(from: "09:00", to: "17:00")),
          ),
          onRemoveSlot: (i) => _updateAndValidate(() => day.slots.removeAt(i)),
        );
      },
    );
  }
}

class TimeSlot {
  String from;
  String to;

  TimeSlot({required this.from, required this.to});

  Map<String, dynamic> toJson() => {"from": from, "to": to};
}

class DaySchedule {
  String day;
  bool isEnabled;
  bool isExpanded;
  List<TimeSlot> slots;

  DaySchedule({
    required this.day,
    this.isEnabled = false,
    this.isExpanded = false,
    required this.slots,
  });

  Map<String, dynamic> toJson() => {
    "day": day,
    "enabled": isEnabled,
    "slots": slots.map((e) => e.toJson()).toList(),
  };
}
