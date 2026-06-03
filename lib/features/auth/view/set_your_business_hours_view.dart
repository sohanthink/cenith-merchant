import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/view_model/business_hours_view_model.dart';
import 'package:cenith_marchent/features/common/widgets/edit_time_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SetYourBusinessHoursView extends StatefulWidget {
  const SetYourBusinessHoursView({super.key, required this.onValidChanged});

  final Function(bool) onValidChanged;

  @override
  State<SetYourBusinessHoursView> createState() =>
      _SetYourBusinessHoursViewState();
}

class _SetYourBusinessHoursViewState extends State<SetYourBusinessHoursView> {
  late final BusinessHoursViewModel controller;

  @override
  void initState() {
    super.initState();

    controller = Get.put(BusinessHoursViewModel());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onValidChanged(controller.isValid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessHoursViewModel>(
      builder: (controller) {
        return ListView(
          children: [
            Card(
              margin: EdgeInsets.symmetric(vertical: 6.h),
              child: Padding(
                padding: EdgeInsets.all(12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            controller.isOpen247(v);
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
              ...controller.dayList.asMap().entries.map((item) {
                final day = item.value;
                return EditTimeTileWidget(
                  controller: controller,
                  day: day.day,
                  isOpened: day.isOpen,
                  is24hrs: day.isOpen24Hrs,
                  index: item.key,
                  timeSlots: day.slot,
                );
              }),
          ],
        );
      },
    );
  }
}
