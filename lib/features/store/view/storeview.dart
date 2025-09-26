import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/view/add_new_store_view.dart';
import 'package:cenith_marchent/features/store/view/hours_view.dart';
import 'package:cenith_marchent/features/store/view/overview.dart';
import 'package:cenith_marchent/features/store/view/signage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  //TODO: will be managed from view model
  int selectedIndex = 0;
  List<Widget> tabs = [Overview(), HoursView(), SignageView()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            buildHeaderSection(context),
            SizedBox(height: 25.h),
            buildMenuSection(context),
            SizedBox(height: 20.h),
            tabs[selectedIndex],
          ],
        ),
      ),
    );
  }

  Widget buildMenuSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: ['Overview', 'Hours', 'Signage'].asMap().entries.map((item) {
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
                padding:  EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 10.h,
                ),
                child: Text(
                  item.value,
                  style: fontSize14(context)!.copyWith(
                    color: item.key == selectedIndex ? Colors.white : null,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildHeaderSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Lavaterilla',
            style: fontSize24(context)!.copyWith(fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: onTapAddStore,
            child: Text ('Add Store +',
            style: fontSize16(
              context,
            )!.copyWith(fontWeight: FontWeight.w600, fontFamily: 'Catamaran'),)
          ),
        ],
      ),
    );
  }

  onTapAddStore(){
    Navigator.pushNamed(context, AddNewStoreView.name);
  }
}
