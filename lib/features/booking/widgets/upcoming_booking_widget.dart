import 'package:flutter/material.dart';

import 'no_booking_yet_widget.dart';

class UpcomingBookingWidget extends StatefulWidget {
  const UpcomingBookingWidget({super.key});

  @override
  State<UpcomingBookingWidget> createState() => _UpcomingBookingWidgetState();
}

class _UpcomingBookingWidgetState extends State<UpcomingBookingWidget> {
  @override
  Widget build(BuildContext context) {
    return noBookingYetWidget(context);  }
}
