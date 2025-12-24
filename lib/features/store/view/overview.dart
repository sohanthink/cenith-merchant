import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/features/common/widgets/contact_support_text.dart';
import 'package:cenith_marchent/features/store/view/order_tag_and_signage_view.dart';
import 'package:cenith_marchent/features/store/view/print_a_signage_view.dart';
import 'package:cenith_marchent/features/store/widgets/bottom_sheet_card.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/text_theme.dart';

class Overview extends StatefulWidget {
  const Overview({super.key});

  @override
  State<Overview> createState() => _OverviewState();
}

class _OverviewState extends State<Overview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderSection(context),
            SizedBox(height: 15.h),
            buildStoreOverViewSection(context),
            SizedBox(height: 30.h),
            buildStoreCommissionSection(context),
            SizedBox(height: 10.h),
            walkInBookingCountCard(context),
            SizedBox(height: 10.h),
            buildContactInfoCard(context),
            SizedBox(height: 10.h),
            buildLocationPhotoSection(context),
            SizedBox(height: 15),
            buildReviewSection(context),
          ],
        ),
      ),
    );
  }

  Column buildReviewSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Reviews', style: fontSize24(context)),
        SizedBox(height: 5.h),
        Text(
          '12 reviews',
          style: fontSize12(context)!.copyWith(color: Colors.black),
        ),
        SizedBox(height: 12.h),
        reviewCard(
          context,
          name: 'Charise Wokes',
          date: '3 days ago',
          stars: 5,
        ),
        SizedBox(height: 8.h),
        reviewCard(
          context,
          name: 'Charise Wokes',
          date: '3 days ago',
          stars: 3,
        ),

        SizedBox(height: 20.h),
        Text(
          textAlign: TextAlign.justify,
          'I think this is one of the best store where i leave'
          'my bag, the staff are very friendly and I bought some others thing where they make me a good price',
          style: fontSize14(context),
        ),
        SizedBox(height: 40.h),

        Center(child: ContactSupportText.supportText(context, () {})),

        SizedBox(height: 20.h),
      ],
    );
  }

  Container reviewCard(
    BuildContext context, {
    required String name,
    required String date,
    required int stars,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage(ImagePaths.personDemo),
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: fontSize16(context)!.copyWith(color: Colors.black),
              ),
              SizedBox(height: 5.h,),
              Text(date,
              style:  fontSize14(context),),
            ],
          ),
          Spacer(),
          Row(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(stars, (index) {
              return SvgPicture.asset(
                IconsPath.starIconSvg,
                color: AppColors.themeColor,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget buildLocationPhotoSection(BuildContext context) {
    List<dynamic> images = [1, 2, 3];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location Photos',
          style: fontSize20(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 10),
        Text(
          'Partners with storefront photos are preferred by '
          'customers and receive higher reviews on average. '
          'Add yours to help increase bookings.',
          style: fontSize14(
            context,
          )!.copyWith(fontWeight: FontWeight.w300, color: Colors.black),
        ),
        SizedBox(height: 20),
        Text(
          'Learn how to take good photos',
          style: fontSize14(context)!.copyWith(color: AppColors.themeColor),
        ),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: uploadImageCard(context, 'Add photos of\nstorefront'),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: uploadImageCard(context, 'Add photos of\nBag store'),
              ),
            ),
          ],
        ),
        SizedBox(height: 25),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: images
                .asMap()
                .entries
                .map(
                  (e) => Container(
                    margin: EdgeInsets.all(10),
                    height: 100,
                    width: 100,
                    decoration: DottedDecoration(
                      dash: [2, 4],
                      strokeWidth: 2,
                      shape: Shape.box,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: e.key == images.length - 1
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                            child: Center(child: Icon(Icons.add, size: 50)),
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade300,
                            ),
                          ),
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconsPath.downloadIconSvg,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                Text(
                  'Earning Details',
                  style: fontSize16(context)!.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget uploadImageCard(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: DottedDecoration(
        dash: [4, 5],
        strokeWidth: 2,
        shape: Shape.box,
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(IconsPath.uploadIconSvg, width: 100),
            SizedBox(height: 10),
            Text(
              textAlign: TextAlign.center,
              title,
              style: fontSize16(context),
            ),
          ],
        ),
      ),
    );
  }

  Card buildContactInfoCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact info',
              style: fontSize16(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SvgPicture.asset(IconsPath.callPhoneIconSvg),
                Text(
                  ' +8465845764',
                  style: fontSize14(context)!.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Edit store details',
                  style: fontSize16(
                    context,
                  )!.copyWith(color: AppColors.themeColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card walkInBookingCountCard(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Image.asset("assets/images/bag.png", height: 80, width: 80),
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '1',
                    style: fontSize24(context)!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'of 23',
                    style: fontSize16(context)!.copyWith(
                      height: 2,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Text(
                'Walk-in bookings',
                style: fontSize20(context)!.copyWith(color: Colors.black),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Get More Walk-ins',
                  style: fontSize16(
                    context,
                  )!.copyWith(color: AppColors.themeColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildStoreCommissionSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.black12,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            'Store Commission',
            style: fontSize20(context)!.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.h),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.smallBagIconSvg,
            rate: '€1.5 ',
            titleText: 'per small bag stored',
          ),
          horizontalDivider(),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.bagIconSvg,
            rate: '€3.50 ',
            titleText: 'per regular bag stored',
          ),
          horizontalDivider(),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.cycleIconSvg,
            rate: '€3.75 ',
            titleText: 'per odd size item stored',
          ),
          horizontalDivider(),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.walkWalkingIconSvg,
            rate: '€100 ',
            titleText: 'per 20 walk-in bookings',
          ),
        ],
      ),
    );
  }

  Container horizontalDivider() {
    return Container(
      width: double.infinity,
      height: 0.5,
      color: Colors.grey.shade400,
    );
  }

  Widget storeCommissionRateCard(
    BuildContext context, {
    required String iconsPath,
    required String rate,
    required String titleText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(iconsPath, height: 22, width: 22),
          SizedBox(width: 8.w),
          Text(
            rate,
            style: fontSize16(
              context,
            )!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          //TODO: if The title i get from server then i have to make it dynamic by using textOverFlow
          SizedBox(width: 5.w),
          Text(
            titleText,
            style: fontSize16(context)!.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildStoreOverViewSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        storeOverViewCard(context, title: '4.9', subTitle: 'Store rating'),
        Container(height: 60, width: 1, color: Colors.grey.shade500),
        storeOverViewCard(
          context,
          title: 'Retail Store',
          subTitle: 'Store type',
        ),
        Container(height: 60, width: 1, color: Colors.grey.shade500),
        storeOverViewCard(
          context,
          title: 'Unlimited',
          subTitle: 'Bag Capacity',
        ),
      ],
    );
  }

  Row storeOverViewCard(
    BuildContext context, {
    required String title,
    required String subTitle,
  }) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              title,
              style: fontSize20(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: fontSize14(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHeaderSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Overview',
          style: fontSize20(context)!.copyWith(fontWeight: FontWeight.w500),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pushNamed(context, PrintASignageView.name),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.themeColor,
            disabledForegroundColor: AppColors.themeColor.shade50,
            side: BorderSide(color: AppColors.themeColor, width: 1),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text('Print A Signage'),
        ),
      ],
    );
  }
}
