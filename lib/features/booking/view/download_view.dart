import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/booking/widgets/check_box_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DownloadView extends StatefulWidget {
  const DownloadView({super.key});

  static final String name = 'download-screen';

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
  final Map<String, bool> bookingStatus = {
    "All Status": false,
    "Upcoming": false,
    "Checked In": false,
    "Pending Check-In": false,
    "Pending Check-Out": false,
    "No Show": false,
    "Expired": false,
    "Cancelled": false,
    "Completed": false,
  };
  final Map<String, bool> bookingDate = {
    "All Time": false,
    "Last 30 Days": false,
    "Last 7 Days": false,
    "Yesterday": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        title: Text(
          'Download Booking Details',
          style: fontSize16(context)?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1.sp,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: ()=> Navigator.pop(context),
            icon: Icon(Icons.close, color: AppColors.midLightBlue),
          ),
        ],
        backgroundColor: Colors.grey.shade100,
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Text(
                'Select the data you want to add to your download.',
                style: fontSize14(context)?.copyWith(
                  color: AppColors.midLightBlue,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1.sp,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            CheckboxGroup(
              title: 'Booking Status',
              items: bookingStatus,
              onChanged: (key, value) {
                setState(() {
                  bookingStatus[key] = value;
                  if (key == 'All Status' && value == true) {
                    bookingStatus.updateAll((key, value) => true);
                  }
                  if (key == 'All Status' && value == false) {
                    bookingStatus.updateAll((key, value) => false);
                  }
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Divider(thickness: 1.4, color: Colors.grey),
            ),
            CheckboxGroup(
              title: 'Booking Date',
              items: bookingDate,
              onChanged: (key, value) {
                setState(() {
                  bookingDate.updateAll((key, value) => false);
                  bookingDate[key] = value;
                });
              },
            ),

            SizedBox(height: 16.h),
            Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.r,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 28.h),
                  ElevatedButton(onPressed: () {}, child: Text('Download CSV')),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Clear All',
                      style: fontSize14(
                        context,
                      )?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
