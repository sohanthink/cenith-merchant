import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/features/common/widgets/contact_support_text.dart';
import 'package:cenith_marchent/features/store/view/print_a_signage_view.dart';
import 'package:cenith_marchent/features/store/view_model/overview_view_model.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/theme/text_theme.dart';
import '../widgets/bottom_sheet_card.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeaderSection(context),
            SizedBox(height: 15.h),
            buildStoreOverViewSection(context),
            SizedBox(height: 30.h),
            buildStoreCommissionSection(context),
            SizedBox(height: 15.h),
            walkInBookingCountCard(context),
            SizedBox(height: 15.h),
            buildContactInfoCard(context),
            SizedBox(height: 20.h),
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
              SizedBox(height: 5.h),
              Text(date, style: fontSize14(context)),
            ],
          ),
          Spacer(),
          Row(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(stars, (index) {
              return SvgPicture.asset(
                IconsPath.starIconSvg,
                colorFilter: ColorFilter.mode(
                  AppColors.themeColor,
                  BlendMode.srcIn,
                ),
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
          textAlign: TextAlign.justify,
          style: fontSize14(
            context,
          )!.copyWith(fontWeight: FontWeight.w300, color: Colors.black),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Learn how to take good photos',
            style: fontSize14(context)!.copyWith(color: AppColors.themeColor),
          ),
        ),
        SizedBox(height: 25),
        Row(
          spacing: 20.w,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            uploadImageCard(context, 'Add photos of\nstorefront'),
            uploadImageCard(context, 'Add photos of\nBag store')
          ],
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 12,
            mainAxisAlignment: MainAxisAlignment.start,
            children: images
                .asMap()
                .entries
                .map(
                  (e) => Container(
                    // margin: EdgeInsets.all(10),
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
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
    return Expanded(
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 10),
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
      ),
    );
  }

  Card buildContactInfoCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
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

  Widget walkInBookingCountCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(0),
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
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '1',
                    style: fontSize22(context)!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'of 23',
                    style: fontSize16(context)!.copyWith(
                      height: 2,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Text(
                'Walk-in bookings',
                style: fontSize18(context)!.copyWith(color: Colors.black),
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

  Widget buildStoreCommissionSection(BuildContext context) {
    return GetBuilder<OverviewViewModel>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.black12,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: InkWell(
              onTap: () {
                Get.find<OverviewViewModel>().changeExpandedStatus();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Store Commission',
                        style: fontSize20(
                          context,
                        )!.copyWith(fontWeight: FontWeight.w500),
                      ),
                      AnimatedRotation(
                        turns: controller.isExpanded ? 0.5 : 00,
                        duration: Duration(milliseconds: 300),
                        child: Icon(Icons.keyboard_arrow_down_rounded),
                      ),
                    ],
                  ),
                  AnimatedSize(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastEaseInToSlowEaseOut,
                    child: controller.isExpanded
                        ? Column(
                            children: [
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
                          )
                        : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
              style: fontSize18(
                context,
              )!.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 1),
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

  Future<dynamic> buildModalButtonSection(BuildContext context) {
    List bottomSheetCards = [
      LearnHowToTakeGoodPhotoWidget(title: 'AvoidCroppedPhotos'),
      LearnHowToTakeGoodPhotoWidget(title: 'AvoidCroppedPhotos'),
      LearnHowToTakeGoodPhotoWidget(
        title: 'Ensure your photo is bright enough',
      ),
      LearnHowToTakeGoodPhotoWidget(title: 'Avoid too many elements'),
    ];

    RxInt selectedIndex = 0.obs;

    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Obx(
                () => Column(
                  children: [
                    bottomSheetCards[selectedIndex.value],
                    SizedBox(height: 10.h),
                    Text(
                      '${selectedIndex.value} of ${bottomSheetCards.length}',
                      style: fontSize14(
                        context,
                      )!.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {
                  if (selectedIndex.value != bottomSheetCards.length - 1) {
                    selectedIndex + 1;
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text('Next'),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }
}
