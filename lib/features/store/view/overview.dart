import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/features/common/widgets/contact_support_text.dart';
import 'package:cenith_marchent/features/store/view/print_a_signage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Expanded(
      child: SingleChildScrollView(
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
              walkinBookingCountCard(context),
              SizedBox(height: 10.h),
              buildContactInfoCard(context),
              SizedBox(height: 10.h),
              buildLocationPhotoSection(context),
              SizedBox(height: 15),
              buildReviewSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Column buildReviewSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: fontSize24(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 5.h),
        Text(
          '12 reviews',
          style: fontSize12(context)!.copyWith(color: Colors.black),
        ),
        SizedBox(height: 8.h),
        reviewCard(
          context,
          Name: 'Charise Wokes',
          date: '3 days ago',
          stars: 5,
        ),
        SizedBox(height: 8.h),
        reviewCard(
          context,
          Name: 'Charise Wokes',
          date: '3 days ago',
          stars: 5,
        ),

        SizedBox(height: 20.h),
        Text(
          'I think this is one of the best store where i leave'
          'my bag,, the staff are very friendly and I bought some others thing where they make me a good price',
        ),
        SizedBox(height: 40.h),

        Center(child: ContactSupportText.supportText(context, () {})),

        SizedBox(height: 20.h),
      ],
    );
  }

  Container reviewCard(
    BuildContext context, {
    required String Name,
    required String date,
    required int stars,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white),
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
              SizedBox(height: 10.h),
              Text(
                'Chris Wokes',
                style: fontSize20(context)!.copyWith(color: Colors.black),
              ),
              Text('3 days ago'),
            ],
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(5, (index) {
              return SvgPicture.asset(
                IconsPath.starIconSvg,
                color: AppColors.themColor,
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
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
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
        Text('Learn how to take good photos', style: fontSize14(context)),
        SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {},
              child: uploadImageCard(context, 'Add photos of\nstorefront'),
            ),
            GestureDetector(
              onTap: () {},
              child: uploadImageCard(context, 'Add photos of\nBag store'),
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
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.themColor.shade100,
                    ),
                    child: e.key == images.length - 1
                        ? Center(child: Icon(Icons.add, size: 50))
                        : null,
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(IconsPath.downloadIconSvg, color: Colors.white),
              SizedBox(width: 10),
              Text(
                'Earning Details',
                style: fontSize16(context)!.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Container uploadImageCard(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.themColor,
          width: 2,
          style: BorderStyle.solid,
        ),
        color: AppColors.themColor.shade50,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(ImagePaths.uploadImagePng),
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
                Text('Edit store details', style: fontSize16(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Card walkinBookingCountCard(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                    style: fontSize20(context)!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'of 23',
                    style: fontSize14(context)!.copyWith(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                'Walk-in bookings',
                style: fontSize20(context)!.copyWith(color: Colors.black),
              ),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Get More Walk-ins',
                  style: fontSize16(context)!.copyWith(),
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
            style: fontSize20(
              context,
            )!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10.h),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.smallBagIconSvg,
            rate: '€1.5 ',
            titleText: 'per small bag stored',
          ),
          horizontalDevider(),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.bagIconSvg,
            rate: '€3.50 ',
            titleText: 'per regular bag stored',
          ),
          horizontalDevider(),
          storeCommissionRateCard(
            context,
            iconsPath: IconsPath.cycleIconSvg,
            rate: '€3.75 ',
            titleText: 'per odd size item stored',
          ),
          horizontalDevider(),
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

  Container horizontalDevider() {
    return Container(
      width: double.infinity,
      height: 1,
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
          SizedBox(width: 6.w),
          Text(
            rate,
            style: fontSize16(
              context,
            )!.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          //TODO: if The title i get from server then i have to make it dynamic by using textOverFlow
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
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Text(
              subTitle,
              style: fontSize16(context)!.copyWith(color: Colors.black),
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
          style: fontSize20(context)!.copyWith(fontWeight: FontWeight.bold),
        ),
        OutlinedButton(
          onPressed: ()=>Navigator.pushNamed(context, PrintASignageView.name),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.themColor,
            disabledForegroundColor: AppColors.themColor.shade50,

            side: BorderSide(color: AppColors.themColor, width: 2),

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
