import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/features/common/widgets/contact_support_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../common/widgets/custom_checkin_out_widget.dart';
import '../widgets/booking_card.dart';

class UpcomingView extends StatefulWidget {
  const UpcomingView({super.key});

  static const String name = 'upcoming-View';

  @override
  State<UpcomingView> createState() => _UpcomingViewState();
}

class _UpcomingViewState extends State<UpcomingView> {
  //TODO: will remove this variable when integrate api;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            SizedBox(height: 15.h),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: ((context, index) {
                return BookingCard(
                  title: 'Mario Chacón Bernal',
                  date: 'Feb 16, 14:00 - Feb 16, 19:00',
                  id: 'K571PIZ8',
                  bags: 2,
                  status: 'Pending check in',
                );
              }),
            ),
            ContactSupportText.supportText(context, () {}),
            SizedBox(height: 20),
            // ElevatedButton(onPressed: (){}, child: Text('Check in/out')),
            SizedBox(height: 20),
          ],
        ),
      ),

      //TODO: Set condition for if booking is not available when fetch api
      // NoBookingsYetDesign(style: Theme.of(context).textTheme)
      floatingActionButton: CustomCheckInOutWidget(controller: _scrollController,maxWidth: 0.88.sw,),
    );
  }


}


