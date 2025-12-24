import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/common/widgets/custom_checkin_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingDetailsView extends StatefulWidget {
  const BookingDetailsView({super.key});

  static final String name = 'booking-details-screen';

  @override
  State<BookingDetailsView> createState() => _BookingDetailsViewState();
}

class _BookingDetailsViewState extends State<BookingDetailsView> {
  ScrollController controller = ScrollController();

  //TODO: from booking details
  String bookingId = 'yt56dtg';

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: buildAppBarSection(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            buildNameAndWidget(style),
            SizedBox(height: 8.h),
            buildBookingDetailsSection(style),
            SizedBox(height: 16.h),
            buildPickupDropOffSection(style),
            SizedBox(height: 16.h),
            buildBagDetailsSection(style),

            SizedBox(height: 28.h),
            Row(
              children: [
                Icon(Icons.error_outline_outlined, color: AppColors.themeColor),
                SizedBox(width: 4.w),
                Text(
                  'Learn to identify bag types',
                  style: fontSize16(context)!.copyWith(
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            bagPictureSection(style),
            SizedBox(height: 24.h),
            buildCustomTagSection(style),
            SizedBox(height: 40.h),
          ],
        ),
      ),
      floatingActionButton: CustomCheckInOutWidget(
        controller: controller,
        maxWidth: 0.92.sw,
        onTap: () {},
      ),
    );
  }

  Row buildCustomTagSection(TextTheme style) {
    return Row(
      children: [
        buildCard(
          style,
          icon: IconsPath.addIconSvg,
          moreInfoText: 'Add more\nbags',
        ),
        SizedBox(width: 10.w),
        buildCard(
          style,
          icon: IconsPath.chatIconSvg,
          moreInfoText: 'Chat with\ncustomer',
        ),
        SizedBox(width: 10.w),
        buildCard(
          style,
          icon: IconsPath.worldIconSvg,
          moreInfoText: 'Reach out to\nSupport',
        ),
      ],
    );
  }

  Container bagPictureSection(TextTheme style) {
    return Container(
      height: 130.h,
      width: 350.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.r,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bag pictures',
              style: style.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 12.h),
            Text(
              'Take photos of the items you\'re storing to help with tracking and checkout',
              style: fontSize14(context),
            ),
            SizedBox(height: 12.h),
            Text(
              'Add picture',
              style: fontSize14(context)!.copyWith(color: AppColors.themeColor),
            ),
          ],
        ),
      ),
    );
  }

  Container buildBagDetailsSection(TextTheme style) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0.w),
            child: Container(
              margin: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Icon(
                  Icons.luggage_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Regular',
                style: style.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text('Suitcases, backpacks', style: fontSize14(context)),
            ],
          ),
          SizedBox(width: 60.w),
          Text(
            '2x',
            style: style.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Container buildPickupDropOffSection(TextTheme style) {
    return Container(
      height: 100.h,
      width: 350.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.r,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          buildDropAndPicText(
            style,
            typeName: 'Drop off',
            time: '4/9/2025, 12:30',
          ),
          SizedBox(width: 25.w),
          Container(height: 50.h, width: 2.w, color: Colors.grey.shade400),

          buildDropAndPicText(
            style,
            typeName: 'Pick up',
            time: '4/9/2025, 12:30',
          ),
        ],
      ),
    );
  }

  Row buildBookingDetailsSection(TextTheme style) {
    return Row(
      children: [
        buildStatus(style, 'Online booking', size: 125.w),
        SizedBox(width: 8.w),
        CircleAvatar(radius: 3, backgroundColor: AppColors.themeColor),
        SizedBox(width: 8.w),
        Text(bookingId, style: fontSize12(context)),
        SizedBox(width: 8.w),
        InkWell(
          onTap: onTapToCopy,
          child: SvgPicture.asset(IconsPath.copyIconSvg, height: 20, width: 20),
        ),
      ],
    );
  }

  Row buildNameAndWidget(TextTheme style) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Sara Palaysi', style: fontSize20(context)),
        buildStatus(style, 'Upcoming'),
      ],
    );
  }

  AppBar buildAppBarSection(BuildContext context) {
    return AppBar(
      title: Text(
        'Booking Details',
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
      automaticallyImplyLeading: true,
      backgroundColor: Colors.grey.shade100,
    );
  }

  Widget buildCard(
    TextTheme style, {
    required String icon,
    required String moreInfoText,
  }) {
    return Container(
      height: 95.h,
      width: 107.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2.r,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(icon, width: 30.w),
            SizedBox(height: 8.h),
            Text(
              textAlign: TextAlign.start,
              moreInfoText,
              style: fontSize14(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDropAndPicText(
    TextTheme style, {
    required String typeName,
    required String time,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            typeName,
            style: style.titleSmall?.copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 4.h),
          Text(
            time,
            style: style.headlineLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget buildStatus(TextTheme style, String statusName, {double? size}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.3),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Center(child: Text(statusName, style: fontSize12(context))),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> onTapToCopy() async {
    await Clipboard.setData(ClipboardData(text: bookingId));
  }
}
