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
      builder: (controller) {
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
                            "Open 24/7",
                            style: fontSize18(context)!.copyWith(),
                          ),
                        ),
                        Switch(
                          inactiveTrackColor: Colors.grey.shade300,
                          value: controller.isAllDay,
                          onChanged: (v) {
                            controller.toggleAllDay(v);
                            widget.onValidChanged(controller.isValid);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            if (!controller.isAllDay)
              ...controller.schedules.map(
                (day) => DayTile(
                  data: day,
                  onToggleEnabled: (v) {
                    controller.toggleDayEnabled(day, v);
                    widget.onValidChanged(controller.isValid);
                  },
                  onPickTime: (bool isFrom, String currentTime) async {
                    final time = await _pickTime(currentTime: currentTime);
                    if (time != null) {
                      controller.updateSlotTime(
                        day: day,
                        isFrom: isFrom,
                        time: time,
                      );
                      widget.onValidChanged(controller.isValid);
                    }
                  },
                ),
              ),
          ],
        );
      },
    );
  }

  Future<String?> _pickTime({required String currentTime}) async {
    List<String> spilledTime = currentTime.split(':');
    int? currentHour = int.tryParse(spilledTime[0]);
    int? currentMinute = int.tryParse(spilledTime[1]);
    DateTime now = DateTime.now();
    TimeOfDay processedInitialTime = TimeOfDay(
      hour: currentHour!,
      minute: currentMinute!,
    );
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: processedInitialTime,
    );
    if (pickedTime == null) return null;
    return "${pickedTime.hour.toString().padLeft(2, '0')}:${pickedTime.minute.toString().padLeft(2, '0')}";
  }
}
