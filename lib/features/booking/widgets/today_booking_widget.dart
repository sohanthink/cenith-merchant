import 'package:flutter/material.dart';

import 'booking_card.dart';
class TodayBookingWidget extends StatelessWidget {
  const TodayBookingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return BookingCard(
            title: 'Mario Chacón Bernal',
            date: 'Feb 16, 14:00 - Feb 16, 19:00',
            id: 'K571PIZ8',
            bags: 2,
            status: 'Pending check in',
          );
        },
      ),
    );
  }
}