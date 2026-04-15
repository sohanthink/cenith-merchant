

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text_theme.dart';
import '../../common/widgets/contact_support_text.dart';

noBookingYetWidget(dynamic context){
  return Column(children: [
    Text(
      "You Don't Have Any Booking",
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
    ),
    Text('Your booking are coming soon', style: fontSize12(context)),
    SizedBox(height: 16.h),
    ContactSupportText.supportText(context, () {}),
    SizedBox(height: 48.h),
  ]);
}