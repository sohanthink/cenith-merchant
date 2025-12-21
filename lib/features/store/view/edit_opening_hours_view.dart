import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/view_model/edit_hour_view_model.dart';
import 'package:cenith_marchent/features/store/widgets/edit_time_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditOpeningHoursView extends StatefulWidget {
  const EditOpeningHoursView({super.key});

  static const name = 'edit-opening-hours';

  @override
  State<EditOpeningHoursView> createState() => _EditOpeningHoursViewState();
}

class _EditOpeningHoursViewState extends State<EditOpeningHoursView> {
  bool isOn = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final item = Get.find<EditHourViewModel>().dayList;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            buildTitleSection(context),
            SizedBox(height: 10.h),
            Expanded(
              child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  final itemIndex = item[index];
                  return GetBuilder<EditHourViewModel>(
                    builder: (context) {
                      return Column(
                        children: [
                          EditTimeTile(
                            day: itemIndex['day'],
                            startTime: itemIndex['startTime'],
                            endTime: itemIndex['endTime'],
                            isOpened: itemIndex['isOpened'],
                            is24hrs: itemIndex['isOpen24Hrs'],
                            index:  index,
                          ),
                          SizedBox(height: 20.h,)
                        ],
                      );
                    }
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column buildTitleSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Edit opening hours',
              style: fontSize20(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            IconButton(
              onPressed: () {Navigator.pop(context);},
              icon: Icon(Icons.close, size: 30.sp),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Open 24/7',
              style: fontSize16(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Switch(
              activeTrackColor: Colors.grey,
              inactiveTrackColor: Colors.grey,
              thumbColor: WidgetStateProperty.resolveWith((state) {
                if (state.contains(WidgetState.selected)) {
                  return Colors.white;
                } else {
                  return Colors.white;
                }
              }),
              value: isOn,
              onChanged: (value) {
                setState(() {
                  isOn = value;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
