import 'package:cenith_marchent/features/booking/widgets/no_bookings_yet_design.dart';
import 'package:flutter/material.dart';

class UpcomingView extends StatefulWidget {
  const UpcomingView({super.key});

  @override
  State<UpcomingView> createState() => _UpcomingViewState();
}

class _UpcomingViewState extends State<UpcomingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: NoBookingsYetDesign(style: Theme.of(context).textTheme));

  }
}
