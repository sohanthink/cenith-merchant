import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/features/booking/widgets/no_bookings_yet_design.dart';
import 'package:flutter/material.dart';

class PastView extends StatefulWidget {
  const PastView({super.key});

  @override
  State<PastView> createState() => _PastViewState();
}

class _PastViewState extends State<PastView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: NoBookingsYetDesign(style: Theme.of(context).textTheme)
    );
  }
}
