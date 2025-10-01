import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/features/booking/widgets/no_bookings_yet_design.dart';
import 'package:cenith_marchent/features/common/widgets/custom_checkin_out_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PastView extends StatefulWidget {
  const PastView({super.key});

  @override
  State<PastView> createState() => _PastViewState();
}

class _PastViewState extends State<PastView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        controller: controller,
        child: NoBookingsYetDesign(style: Theme.of(context).textTheme),
      ),
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
