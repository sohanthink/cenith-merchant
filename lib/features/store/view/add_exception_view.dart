import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/widgets/exception_date_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddExceptionView extends StatefulWidget {
  const AddExceptionView({super.key});

  static const name = 'add exception';

  @override
  State<AddExceptionView> createState() => _AddExceptionViewState();
}

class _AddExceptionViewState extends State<AddExceptionView> {
  bool isOn = true;
  int maxLine = 1;
  final TextEditingController _resonTEController = TextEditingController();

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

  Column buildExceptionSetupSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ExceptionDateButton(time: 'Thu, 2/6'),
            Text('To'),
            ExceptionDateButton(time: 'Thu, 2/6'),
          ],
        ),
        SizedBox(height: 25.h),
        Row(
          children: [
            Switch(
              value: isOn,
              onChanged: (value) {
                setState(() {
                  isOn = !isOn;
                });
              },
              activeTrackColor: Colors.grey,
              inactiveTrackColor: Colors.grey,
            ),
            SizedBox(width: 10.w),
            Text(
              'Close All Day',
              style: fontSize20(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
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
            buildTimeCard(context, '09.00'),
            Text('To'),
            buildTimeCard(context, '09.00'),
          ],
        ),
        SizedBox(height: 15.h),
        Text('Reason'),
        SizedBox(height: 15.h),
        TextFormField(
          controller: _resonTEController,
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
  }

  buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.grey.shade500, width: 1),
    );
  }

  Container buildTimeCard(BuildContext context, String time) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.4,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: fontSize16(context)!.copyWith(color: Colors.black)),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(IconsPath.downArrowSvg),
          ),
        ],
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
          'add exception',
          style: fontSize24(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 15.h),
        Text(
          textAlign: TextAlign.justify,
          'Specify when your store is open to receive customers.'
          ' It will be closed outside of these times.',
        ),
        SizedBox(height: 20.h),
        Text('Dates'),
      ],
    );
  }

  onTapCancelButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
    _resonTEController.dispose();
  }
}
