import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/controllers/business_hours_controller.dart';
import 'package:cenith_marchent/features/auth/view_model/business_hours_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DayTile extends StatelessWidget {
  final DaySchedule data;
  final ValueChanged<bool> onToggleEnabled;
  final void Function(bool isFrom, String currentTime) onPickTime;

  const DayTile({
    super.key,
    required this.data,
    required this.onToggleEnabled,
    required this.onPickTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        children: [
          ListTile(
            leading: Switch(
              inactiveTrackColor: Colors.grey.shade300,
              value: data.isEnabled,
              onChanged: onToggleEnabled,
            ),
            title: Text(data.day),
          ),

          if (data.isEnabled)
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTimeCard(
                        context,
                        title: 'Start',
                        time: data.slots.from,
                        onTap: () {
                          onPickTime(true, data.slots.from);
                        },
                      ),
                      SizedBox(width: 20.w),
                      buildTimeCard(
                        context,
                        title: 'End',
                        time: data.slots.to,
                        onTap: () {
                          onPickTime(false, data.slots.to);
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Switch(
                    inactiveTrackColor: Colors.grey.shade300,
                    value: Get.find<BusinessHoursController>().isSameForAllDay,
                    onChanged: (value) {
                      Get.find<BusinessHoursController>().changeStatusForAllDay(
                        DaySchedule(day: data.day, slots: data.slots),value
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget buildTimeCard(
    BuildContext context, {
    required String title,
    required String time,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            margin: EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(style: BorderStyle.solid),
            ),
            child: Text(time),
          ),
          Positioned(
            left: 7,
            top: -4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              color: Colors.white,
              child: Text(title, style: fontSize14(context)),
            ),
          ),
        ],
      ),
    );
  }
}
