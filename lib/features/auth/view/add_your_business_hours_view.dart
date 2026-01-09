import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/controllers/business_hours_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/day_tile.dart';
import '../widgets/time_picker_box.dart';

class AddYourBusinessHoursView extends StatefulWidget {
  const AddYourBusinessHoursView({super.key, required this.onValidChanged});

  final Function(bool) onValidChanged;

  @override
  State<AddYourBusinessHoursView> createState() =>
      _AddYourBusinessHoursViewState();
}

class _AddYourBusinessHoursViewState extends State<AddYourBusinessHoursView> {
  late final BusinessHoursController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.put(BusinessHoursController());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onValidChanged(controller.isValid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessHoursController>(
      builder: (c) {
        return ListView(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 6.h),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(
                            "24 Hours / All Day",
                            style: fontSize18(
                              context,
                            )!.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Switch(
                          inactiveTrackColor: Colors.grey.shade300,
                          value: c.isAllDay,
                          onChanged: (v) {
                            c.toggleAllDay(v);
                            widget.onValidChanged(c.isValid);
                          },
                        ),
                      ],
                    ),

                    if (c.isAllDay) SizedBox(height: 12.h),

                    if (c.isAllDay)
                      Row(
                        children: [
                          TimePickerBox(
                            label: "From",
                            time: c.allDayFrom,
                            onTap: () async {
                              final t = await _pickTime(context);
                              if (t != null) {
                                c.setAllDayFrom(t);
                                widget.onValidChanged(c.isValid);
                              }
                            },
                          ),
                          SizedBox(width: 12.h),
                          TimePickerBox(
                            label: "To",
                            time: c.allDayTo,
                            onTap: () async {
                              final t = await _pickTime(context);
                              if (t != null) {
                                c.setAllDayTo(t);
                                widget.onValidChanged(c.isValid);
                              }
                            },
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),

            if (!c.isAllDay)
              ...c.schedules.map(
                (day) => DayTile(
                  data: day,
                  onToggleEnabled: (v) {
                    c.toggleDayEnabled(day, v);
                    widget.onValidChanged(c.isValid);
                  },
                  onToggleExpanded: () => c.toggleExpanded(day),
                  onAddSlot: () {
                    c.addSlot(day);
                    widget.onValidChanged(c.isValid);
                  },
                  onRemoveSlot: (i) {
                    c.removeSlot(day, i);
                    widget.onValidChanged(c.isValid);
                  },
                  onPickTime: (int index, bool isFrom) async {
                    final t = await _pickTime(context);
                    if (t != null) {
                      c.updateSlotTime(
                        day: day,
                        index: index,
                        isFrom: isFrom,
                        time: t,
                      );
                      widget.onValidChanged(c.isValid);
                    }
                  },
                ),
              ),
          ],
        );
      },
    );
  }

  Future<String?> _pickTime(BuildContext context) async {
    final t = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (t == null) return null;
    return "${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}";
  }
}
