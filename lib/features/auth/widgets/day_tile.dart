import 'package:cenith_marchent/features/auth/view/add_your_business_hours_view.dart';
import 'package:cenith_marchent/features/auth/view_model/business_hours_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayTile extends StatelessWidget {
  final DaySchedule data;
  final ValueChanged<bool> onToggleEnabled;
  final VoidCallback onToggleExpanded;
  final VoidCallback onAddSlot;
  final ValueChanged<int> onRemoveSlot;
  final void Function(int index, bool isFrom) onPickTime;

  const DayTile({
    super.key,
    required this.data,
    required this.onToggleEnabled,
    required this.onToggleExpanded,
    required this.onAddSlot,
    required this.onRemoveSlot,
    required this.onPickTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin:  EdgeInsets.symmetric(vertical: 6.h),
      child: Column(
        children: [
          ListTile(
            leading: Switch(
              inactiveTrackColor: Colors.grey.shade300,
              value: data.isEnabled,
              onChanged: onToggleEnabled,
            ),
            title: Text(data.day),
            trailing: IconButton(
              icon: Icon(
                data.isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onPressed: onToggleExpanded,
            ),
          ),

          if (data.isExpanded && data.isEnabled)
            Padding(
              padding:  EdgeInsets.all(12.w),
              child: Column(
                children: [
                  ...data.slots.asMap().entries.map((e) {
                    final index = e.key;
                    final slot = e.value;

                    return Row(
                      children: [
                        _timeBox(
                          slot.from,
                          onTap: () => onPickTime(index, true),
                        ),
                        const Text("  to  "),
                        _timeBox(
                          slot.to,
                          onTap: () => onPickTime(index, false),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => onRemoveSlot(index),
                        ),
                      ],
                    );
                  }),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: const Icon(Icons.add_circle),
                      onPressed: onAddSlot,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _timeBox(String text, {required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(text),
      ),
    );
  }
}
