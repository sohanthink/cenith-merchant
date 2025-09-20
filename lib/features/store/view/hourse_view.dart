import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HourseView extends StatefulWidget {
  const HourseView({super.key});

  @override
  State<HourseView> createState() => _HourseViewState();
}

class _HourseViewState extends State<HourseView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              buildHeaderSection(context),
              SizedBox(height: 20.h),
              buildHoursSection(context),
              SizedBox(height: 20.h,),
              Column(children: [

              ],)
            ],
          ),
        ),
      ),
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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: 200.w,
            child: ElevatedButton(
              onPressed: () {},
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
              childAspectRatio: 1.96,
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
          SizedBox(height: 10.h,)
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
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(day, style: fontSize20(context)!.copyWith(fontSize: 20, color: isOpened? Colors.red: Colors.black)),
          SizedBox(height: 5),
          Text(time, style: fontSize12(context)!.copyWith(color: isOpened? Colors.red: Colors.black)),
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
          style: fontSize20(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 10.h),
        Text(
          textAlign: TextAlign.justify,
          'Opening hours are when your store is open to check bags in and out.'
          ' You can add exceptions for holidays or special closures.',
        ),
      ],
    );
  }
}
