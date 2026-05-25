import 'package:cenith_marchent/features/store/model/time_slot_model.dart';
import 'package:cenith_marchent/features/store/view_model/edit_hour_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asstes_path/icons_path.dart';
import '../../../core/theme/text_theme.dart';

class EditTimeTile extends StatefulWidget {
  const EditTimeTile({
    super.key,
    required this.day,
    // required this.startTime,
    // required this.endTime,
    required this.isOpened,
    required this.is24hrs,
    required this.index,
    required this.timeSlots,
  });

  final String day;
  // final String startTime;
  // final String endTime;
  final bool isOpened;
  final bool is24hrs;
  final int index;
  final TimeSlotModel timeSlots;

  @override
  State<EditTimeTile> createState() => _EditTimeTileState();
}

class _EditTimeTileState extends State<EditTimeTile>
    with SingleTickerProviderStateMixin {
  RxBool isExpanded = false.obs;
  TimeOfDay initialTime = TimeOfDay.now();

  Future setTime(Function(String) updateTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    updateTime(
      pickedTime != null
          ? pickedTime.format(context).toString()
          : initialTime.format(context).toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: isExpanded.value ? Colors.white : Colors.transparent,
          boxShadow: isExpanded.value
              ? [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildNormalTileView(context),
                AnimatedSize(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn,
                  alignment: Alignment.topCenter,
                  child: isExpanded.value
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 20.h),
                          child: buildTimeButtonSection(),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNormalTileView(BuildContext context) {
    return InkWell(
      onTap: () => isExpanded.value = !isExpanded.value,
      borderRadius: BorderRadius.circular(15.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.w),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.find<EditHourViewModel>().updateOpenStatus(
                      widget.index,
                    );
                  },
                  child: Container(
                    height: 22.h,
                    width: 22.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5.w,
                        color: widget.isOpened
                            ? AppColors.themeColor
                            : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(4.r),
                      color: widget.isOpened
                          ? AppColors.themeColor.withOpacity(0.1)
                          : Colors.transparent,
                    ),
                    child: widget.isOpened
                        ? Center(
                            child: Icon(
                              Icons.done,
                              color: AppColors.themeColor,
                              size: 16.sp,
                            ),
                          )
                        : null,
                  ),
                ),
                SizedBox(width: 15.w),
                Text(
                  widget.day,
                  style: fontSize20(context)!.copyWith(
                    color: Colors.black,
                    fontWeight: isExpanded.value
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                const Spacer(),
                GetBuilder<EditHourViewModel>(
                  builder: (controller) {
                    return Text(
                      controller.dayList[widget.index].isOpen24Hrs
                          ? '24 Hour'
                          : '${widget.timeSlots.timeSlots.first.startTime} - ${widget.timeSlots.timeSlots.last.endTime}',

                      style: fontSize16(
                        context,
                      )!.copyWith(color: Colors.black54),
                    );
                  },
                ),
                // Text(
                //   Get.find<EditHourViewModel>()
                //           .dayList[widget.index]
                //           .isOpen24Hrs
                //       ? '24 Hour'
                //       : '${widget.timeSlots.timeSlots.first.startTime} - ${widget.timeSlots.timeSlots.last.endTime}',

                //   style: fontSize16(context)!.copyWith(color: Colors.black54),
                // ),
                SizedBox(width: 10.w),
                AnimatedRotation(
                  turns: isExpanded.value ? 0.5 : 0.0,
                  duration: const Duration(milliseconds: 400),
                  child: SvgPicture.asset(
                    IconsPath.downArrowSvg,
                    height: 20.h,
                    width: 20.w,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
            if (!isExpanded.value)
              Padding(
                padding: EdgeInsets.only(top: 15.h),
                child: const Divider(
                  thickness: .4,
                  color: Colors.grey,
                  height: 0,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildTimeButtonSection() {
    return GetBuilder<EditHourViewModel>(
      builder: (controller) {
        return Column(
          children: [
            const Divider(thickness: .4, color: Colors.grey),
            SizedBox(height: 15.h),
            if (!widget.is24hrs)
              ...widget.timeSlots.timeSlots.asMap().entries.map((item) {
                return Column(
                  children: [
                    item.key != 0 ? SizedBox(height: 10) : SizedBox(height: 0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        buildTimeButton(
                          label: "Start Time",
                          time: item.value.startTime,
                          onTap: () {
                            setTime(
                              (time) => controller.updateStartTime(
                                widget.index,
                                item.key,
                                time,
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 5),
                        buildTimeButton(
                          label: "End Time",
                          time: item.value.endTime,
                          onTap: () {
                            setTime(
                              (time) => controller.updateEndTime(
                                widget.index,
                                time,
                                item.key,
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 5),
                        widget.timeSlots.timeSlots.length > 1
                            ? GestureDetector(
                                onTap: () {
                                  controller.removeTimeSlot(
                                    widget.index,
                                    item.key,
                                  );
                                },
                                child: Icon(Icons.close, color: Colors.red),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                    widget.timeSlots.timeSlots.length < 2
                        ? GestureDetector(
                            onTap: () {
                              controller.addNewSlot(widget.index);
                            },
                            child: Column(
                              children: [
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Add Slot',
                                      style: fontSize12(
                                        context,
                                      )!.copyWith(color: Colors.green),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.add_circle,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                    SizedBox(width: 5.w),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                );
              }),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Open 24 hour',
                  style: fontSize16(context)!.copyWith(
                    color: Colors.black.withAlpha(100),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 10),
                Switch(
                  activeTrackColor: Colors.blue,
                  inactiveTrackColor: Colors.grey,
                  thumbColor: WidgetStateProperty.resolveWith((state) {
                    if (state.contains(WidgetState.selected)) {
                      return Colors.white;
                    } else {
                      return Colors.white;
                    }
                  }),
                  // activeThumbColor: AppColors.themeColor,
                  // inactiveThumbColor: Colors.grey,
                  // inactiveTrackColor: Colors.grey.shade300,
                  value: widget.is24hrs,
                  onChanged: (value) {
                    controller.update24HoursOpen(widget.index);
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.themeColor.withAlpha(10),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.error_outline, size: 24),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          overflow: TextOverflow.visible,
                          'Copy this opening hours to all days',
                          textAlign: TextAlign.justify,
                          style: fontSize18(context),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            controller.copyScheduleToAllDay(widget.index);
                          },
                          child: Text(
                          
                            overflow: TextOverflow.visible,
                            'Yes, copy',
                            style: fontSize18(context)!.copyWith(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildTimeButton({
    required String label,
    required String time,
    required VoidCallback onTap,
  }) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: fontSize12(context)!.copyWith(color: Colors.grey)),
          SizedBox(height: 5.h),
          GestureDetector(
            onTap: onTap,
            child: Container(
              // width: 145.w,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(width: 1.w, color: Colors.grey.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    time,
                    style: fontSize14(context)!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.access_time, size: 18.sp, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
