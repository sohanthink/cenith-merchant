import 'package:cenith_marchent/features/booking/widgets/no_bookings_yet_design.dart';
import 'package:flutter/material.dart';

class TodayView extends StatefulWidget {
  const TodayView({super.key});

  @override
  State<TodayView> createState() => _TodayViewState();
}

class _TodayViewState extends State<TodayView> {
  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: NoBookingsYetDesign(style: style),
    );
  }
}


