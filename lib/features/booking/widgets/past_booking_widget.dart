import 'package:cenith_marchent/features/booking/widgets/no_booking_yet_widget.dart';
import 'package:flutter/material.dart';

class PastBookingWidget extends StatefulWidget {
  const PastBookingWidget({super.key});

  @override
  State<PastBookingWidget> createState() => _PastBookingWidgetState();
}

class _PastBookingWidgetState extends State<PastBookingWidget> {
  @override
  Widget build(BuildContext context) {
    return noBookingYetWidget(context);
  }
}
