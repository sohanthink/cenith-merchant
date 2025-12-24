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
    required this.startTime,
    required this.endTime,
    required this.isOpened,
    required this.is24hrs,
    required this.index,
  });

  final String day;
  final String startTime;
  final String endTime;
  final bool isOpened;
  final bool is24hrs;
  final int index;

  @override
  State<EditTimeTile> createState() => _EditTimeTileState();
}

class _EditTimeTileState extends State<EditTimeTile> {
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
      () => Container(
        padding: isExpanded.value
            ? EdgeInsets.symmetric(horizontal: 10, vertical: 20)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isExpanded.value == true ? Colors.white : null,
        ),

        //main widget tree
        child: Column(
          children: [
            buildNormalTileView(context),
            SizedBox(height: 15.h),
            buildTimeButtonSection(),
          ],
        ),
      ),
    );
  }

  Widget buildNormalTileView(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                Get.find<EditHourViewModel>().updateOpenStatus(widget.index);
              },
              child: GetBuilder<EditHourViewModel>(
                builder: (controller) {
                  return Container(
                    height: 25.h,
                    width: 25.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.w,
                        color: Colors.grey.shade700,
                      ),
                      borderRadius: BorderRadiusGeometry.circular(2.r),
                    ),
                    child: widget.isOpened
                        ? Center(
                            child: Icon(
                              Icons.done,
                              color: AppColors.themeColor,
                              size: 20.sp,
                            ),
                          )
                        : SizedBox(),
                  );
                },
              ),
            ),
            SizedBox(width: 15.w),
            Text(
              widget.day,
              style: fontSize20(
                context,
              )!.copyWith(color: Colors.black,),
            ),
            Spacer(),
            Text(
              Get.find<EditHourViewModel>().dayList[widget.index]['isOpen24Hrs']
                  ? '24 Hour'
                  : '${widget.startTime} - ${widget.endTime}',
              style: fontSize16(context)!.copyWith(color: Colors.black),
            ),
            SizedBox(width: 12.h),
            GestureDetector(
              onTap: () {
                isExpanded.value = !isExpanded.value;
              },
              child: SvgPicture.asset(
                IconsPath.downArrowSvg,
                height: 25.h,
                width: 25.w,
              ),
            ),
          ],
        ),
        isExpanded.value == false
            ? Column(
                children: [
                  SizedBox(height: 20.h),
                  Divider(thickness: .4,color: Colors.grey,)
                ],
              )
            : SizedBox.shrink(),
      ],
    );
  }

  Widget buildTimeButtonSection() {
    return isExpanded.value == true
        ? GetBuilder<EditHourViewModel>(
            builder: (controller) {
              return Column(
                children: [
                  !widget.is24hrs
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildTimeButton(
                              time: widget.startTime,
                              onTap: () {
                                setTime((time) {
                                  controller.updateStartTime(
                                    widget.index,
                                    time,
                                  );
                                });
                              },
                            ),
                            buildTimeButton(
                              time: widget.endTime,
                              onTap: () {
                                setTime((time) {
                                  controller.updateEndTime(widget.index, time);
                                });
                              },
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Text(
                        'Open 24',
                        style: fontSize16(
                          context,
                        )!.copyWith(color: Colors.black),
                      ),
                      SizedBox(width: 10.w),

                      GetBuilder<EditHourViewModel>(
                        builder: (controller) {
                          return Switch(
                            activeTrackColor: Colors.grey,
                            inactiveTrackColor: Colors.grey,
                            thumbColor: WidgetStateProperty.resolveWith((
                              state,
                            ) {
                              if (state.contains(WidgetState.selected)) {
                                return Colors.white;
                              } else {
                                return Colors.white;
                              }
                            }),
                            value: widget.is24hrs,
                            onChanged: (value) {
                              controller.update24HoursOpen(widget.index);
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          )
        : SizedBox.shrink();
  }

  Widget buildTimeButton({required String time, required VoidCallback onTap}) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(width: 1.w, color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: fontSize14(context)!.copyWith(color: Colors.black)),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(IconsPath.downArrowSvg),
          ),
        ],
      ),
    );
  }
}
