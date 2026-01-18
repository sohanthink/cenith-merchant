import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/core/utils/custom_snackbar.dart';
import 'package:cenith_marchent/features/store/view_model/add_exception_view_model.dart';
import 'package:cenith_marchent/features/store/widgets/exception_date_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddExceptionView extends StatefulWidget {
  const AddExceptionView({super.key});

  static const name = 'add exception';

  @override
  State<AddExceptionView> createState() => _AddExceptionViewState();
}

class _AddExceptionViewState extends State<AddExceptionView> {
  int maxLine = 1;
  final TextEditingController _reasonTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              buildTitleSection(context),
              SizedBox(height: 20.h),
              buildExceptionSetupSection(context),
              SizedBox(height: 30.h),
              ElevatedButton(onPressed: () {}, child: Text('Add Exception')),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildExceptionSetupSection(BuildContext context) {
    return GetBuilder<AddExceptionViewModel>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ExceptionDateButton(
                  time: dateShortNer(controller.startDate),
                  onTap: () {
                    onChangeDate(
                      controller: controller,
                      dateType: DateType.startDate,
                    );
                  },
                ),
                Text('To'),
                ExceptionDateButton(
                  time: dateShortNer(controller.endDate),
                  onTap: () {
                    onChangeDate(
                      controller: controller,
                      dateType: DateType.endDate,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 25.h),
            Row(
              children: [
                Switch(
                  value: controller.isClose,
                  onChanged: (value) {
                    controller.onSwitchChange(value);
                  },
                  activeTrackColor: AppColors.themeColor,
                  inactiveTrackColor: Colors.grey,
                ),
                SizedBox(width: 10.w),
                Text(
                  'Close All Day',
                  style: fontSize20(
                    context,
                  )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Text(
              'Open Hours',
              style: fontSize16(context)!.copyWith(color: Colors.black),
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTimeCard(
                  time: timeShortNer(controller.startTime),
                  onTap: () {
                    onChangeTime(
                      controller: controller,
                      time: controller.startTime,
                      timeType: TimeType.startTime,
                    );
                  },
                ),
                Text('To'),
                buildTimeCard(
                  time: timeShortNer(controller.endTime),
                  onTap: () {
                    onChangeTime(
                      controller: controller,
                      time: controller.endTime,
                      timeType: TimeType.endTime,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Text('Reason'),
            SizedBox(height: 15.h),
            TextFormField(
              controller: _reasonTEController,
              style: TextStyle(color: Colors.black, fontSize: 15),
              maxLines: 5,
              maxLength: 100,
              decoration: InputDecoration(
                fillColor: Colors.grey.shade300,
                border: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                disabledBorder: buildOutlineInputBorder(),
                enabledBorder: buildOutlineInputBorder(),
              ),
            ),
          ],
        );
      },
    );
  }

  buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
    );
  }

  Widget buildTimeCard({required String time, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.4,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              time,
              style: fontSize16(context)!.copyWith(color: Colors.black),
            ),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(IconsPath.downArrowSvg),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTitleSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: onTapCancelButton,
            child: SvgPicture.asset(
              IconsPath.cancelIconSvg,
              height: 30.h,
              width: 30.w,
            ),
          ),
        ),
        SizedBox(height: 30.h),
        Text(
          'Add exception',
          style: fontSize24(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12.h),
        Text(
          textAlign: TextAlign.justify,
          'Specify when your store is open to receive customers.'
          ' It will be closed outside of these times.',
          style: fontSize14(context),
        ),
        SizedBox(height: 20.h),
        Text('Dates'),
      ],
    );
  }

  onTapCancelButton() {
    Navigator.pop(context);
  }

  String dateShortNer(DateTime date) {
    String formatedDate = DateFormat('EEE, MM/dd').format(date);
    return formatedDate;
  }

  String timeShortNer(TimeOfDay time) {
    String hour = '${time.hour}'.padLeft(2, '0');
    String minute = '${time.minute}'.padLeft(2, '0');

    String formatedTime = '$hour:$minute ';
    return formatedTime;
  }

  Future onChangeTime({
    required AddExceptionViewModel controller,
    required TimeOfDay time,
    required TimeType timeType,
  }) async {
    TimeOfDay? pickedTime = await controller.timePicker(context, time: time);

    if (pickedTime != null) {
      controller.updateTime(
        time: pickedTime,
        timeType: timeType,
        onInvalidTimeRange: () {
          customSnackBar(
            context: context,
            title: 'Start date cannot be after end date',
          );

          print('hit snackbar');
        },
      );
    }
  }

  Future onChangeDate({
    required AddExceptionViewModel controller,
    required DateType dateType,
  }) async {
    DateTime? pickedDate = await controller.datePicker(context);
    if (pickedDate != null) {
      controller.updateDate(
        date: pickedDate,
        dateType: dateType,
        onInvalidDateRange: () {
          customSnackBar(
            context: context,
            title: 'Start date cannot be after end date',
          );
        },
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _reasonTEController.dispose();
  }
}
