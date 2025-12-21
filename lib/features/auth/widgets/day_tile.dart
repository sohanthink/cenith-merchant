import 'package:cenith_marchent/features/auth/view/add_your_business_hours_view.dart';
import 'package:flutter/material.dart';

class DayTile extends StatelessWidget {
  final DaySchedule data;
  final ValueChanged<bool> onToggleEnabled;
  final VoidCallback onToggleExpanded;
  final VoidCallback onAddSlot;
  final ValueChanged<int> onRemoveSlot;

  const DayTile({
    super.key,
    required this.data,
    required this.onToggleEnabled,
    required this.onToggleExpanded,
    required this.onAddSlot,
    required this.onRemoveSlot,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        children: [
          ListTile(
            leading: Switch(
              value: data.isEnabled,
              inactiveTrackColor: Colors.grey.shade300,
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
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  ...data.slots.asMap().entries.map((e) {
                    final i = e.key;
                    final slot = e.value;

                    return Row(
                      children: [
                        _timeBox(slot.from),
                        const Text(" to "),
                        _timeBox(slot.to),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => onRemoveSlot(i),
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

  Widget _timeBox(String text) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Text(text),
  );
}