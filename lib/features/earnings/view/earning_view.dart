import 'package:cenith_marchent/features/earnings/view/earning_details_view.dart';
import 'package:cenith_marchent/features/earnings/view/overview.dart';
import 'package:cenith_marchent/features/earnings/view/payout_details_view.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/text_theme.dart';

class EarningView extends StatefulWidget {
  const EarningView({super.key});

  @override
  State<EarningView> createState() => _EarningViewState();
}

class _EarningViewState extends State<EarningView> {
  int selectedIndex = 0;
  List<Widget> tabs = [Overview(), EarningDetailsView(), PayoutDetailsView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              'Earning',
              style: fontSize24(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),
            buildMenuSection(context),
            SizedBox(height: 20),
            tabs[selectedIndex],
          ],
        ),
      ),
    );
  }

  Widget buildMenuSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: ['Overview', 'Earning Details', 'Payout Details']
          .asMap()
          .entries
          .map((item) {
            return GestureDetector(
              onTap: () {
                selectedIndex = item.key;
                //TODO: remove the setState when fetch the api
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                  color: item.key == selectedIndex
                      ? AppColors.themColor
                      : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    item.value,
                    style: fontSize12(context)!.copyWith(
                      color: item.key == selectedIndex ? Colors.white : null,
                    ),
                  ),
                ),
              ),
            );
          })
          .toList(),
    );
  }
}
