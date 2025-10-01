import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/features/booking/widgets/no_bookings_yet_design.dart';
import 'package:cenith_marchent/features/common/widgets/custom_checkin_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(child: NoBookingsYetDesign(style: style)),
      floatingActionButton: CustomCheckInOutWidget(
        controller: controller,
        maxWidth: 0.88.sw,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
