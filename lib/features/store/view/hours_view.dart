import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/common/widgets/contact_support_text.dart';
import 'package:cenith_marchent/features/store/view/add_exception_view.dart';
import 'package:cenith_marchent/features/store/view/edit_opening_hours_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HoursView extends StatefulWidget {
  const HoursView({super.key});

  @override
  State<HoursView> createState() => _HoursViewState();
}

class _HoursViewState extends State<HoursView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            buildHeaderSection(context),
            SizedBox(height: 20.h),
            buildHoursSection(context),
            SizedBox(height: 15.h),
            buildExceptionSection(context),
          ],
        ),
      ),
    );
  }

  Widget buildExceptionSection(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
          ),
          onPressed: () {},
          child: Text(
            'Close store for today',
            style: fontSize16(context)!.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(height: 12.h),
        Image.asset(ImagePaths.clockImage, height: 150.h, width: 150.w),
        SizedBox(height: 12.h),
        Text(
          'No hour exception yet',
          style: fontSize24(context)!.copyWith(color: Colors.black),
        ),
        SizedBox(height: 12.h),
        Text(
          'Set exceptions for days with different opening hours',
          style: fontSize14(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 25.h),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            onPressed: onTapAddException,
            child: Text(
              'Add Exception',
              style: fontSize14(context)!.copyWith(color: Colors.white),
            ),
          ),
        ),
        SizedBox(height: 150.h),
        ContactSupportText.supportText(context, () {}),
        SizedBox(height: 25.h),
      ],
    );
  }

  Widget buildHoursSection(BuildContext context) {
    List<Map<String, dynamic>> days = [
      {'day': 'Saturday', 'time': '08:30 - 22:30', 'isOpened': false},
      {'day': 'Sunday', 'time': '08:30 - 22:30', 'isOpened': false},
      {'day': 'Monday', 'time': '08:30 - 22:30', 'isOpened': false},
      {'day': 'Tuesday', 'time': '08:30 - 22:30', 'isOpened': false},
      {'day': 'Wednesday', 'time': '08:30 - 22:30', 'isOpened': false},
      {'day': 'Thursday', 'time': '08:30 - 22:30', 'isOpened': false},
      {'day': 'Friday', 'time': 'Closed', 'isOpened': true},
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          SizedBox(
            width: 200.w,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, EditOpeningHoursView.name);
              },
              child: Text(
                'Edit Opening Hours',
                style: fontSize16(context)!.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 15.h),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: days.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2.h,
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 10,
            ),
            itemBuilder: ((context, index) {
              return timeCard(
                context,
                day: days[index]['day'],
                time: days[index]['time'],
                isOpened: days[index]['isOpened'],
              );
            }),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  Widget timeCard(
    BuildContext context, {
    required String day,
    required String time,
    required bool isOpened,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: fontSize20(context)!.copyWith(
              overflow: TextOverflow.ellipsis,
              fontSize: 20.sp,
              color: isOpened ? Colors.red : Colors.black,
            ),
          ),
          SizedBox(height: 5.h),
          Text(
            time,
            style: fontSize12(
              context,
            )!.copyWith(color: isOpened ? Colors.red : Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Opening hours',
          style: fontSize20(context)!.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        Text(
          textAlign: TextAlign.justify,
          'Opening hours are when your store is open to check bags in and out.'
          ' You can add exceptions for holidays or special closures.',
          style: fontSize14(context),
        ),
      ],
    );
  }

  onTapAddException() {
    Navigator.pushNamed(context, AddExceptionView.name);
  }
}
