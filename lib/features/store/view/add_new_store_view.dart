import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/view_model/add_new_store_view_model.dart';
import 'package:cenith_marchent/features/store/widgets/intl_phone_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddNewStoreView extends StatefulWidget {
  const AddNewStoreView({super.key});

  static const String name = 'Add new store';

  static List<IntlPhoneFieldWidget> phoneFieldList = [
    IntlPhoneFieldWidget(
      controller: Get.find<AddNewStoreViewModel>().forFirstNumber,
    ),
  ];

  @override
  State<AddNewStoreView> createState() => _AddNewStoreViewState();
}

class _AddNewStoreViewState extends State<AddNewStoreView> {
  final TextEditingController _storeNameTEController = TextEditingController();
  final TextEditingController _storeTypeTEController = TextEditingController();
  final TextEditingController _bagCapacityTEController =
      TextEditingController();
  final TextEditingController _streetAddressTEController =
      TextEditingController();
  final TextEditingController _zipCodeTEController = TextEditingController();
  final TextEditingController _directionTEController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildFormSection(context),
              SizedBox(height: 20.h),
              buildInquarySection(context),
              SizedBox(height: 20.h),
              buildGetNotifiedSection(context),
              SizedBox(height: 20.h),
              buildSaveSection(context),
            ],
          ),
        ),
      ),
    );
  }

  Column buildSaveSection(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: () {}, child: Text('Save Changes')),
        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () {},
          child: Text(
            'Request store closure',
            style: fontSize16(
              context,
            )!.copyWith(color: Colors.red, fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  Container buildGetNotifiedSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(IconsPath.storeIconSvg),
              SizedBox(width: 8.w),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get notified about your bookings',
                      style: fontSize16(context)!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      child: Text(
                        'Manage which users receive communications from the Users tab.',
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Visit users tab',
                            style: fontSize16(
                              context,
                            )!.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: AppColors.themeColor,
                          size: 20,
                          weight: 0.1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 10),
          GestureDetector(
            child: SvgPicture.asset(
              IconsPath.cancelIconSvg,
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }

  Column buildInquarySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Store inquiries phone numbers',
          style: fontSize17(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 25.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(IconsPath.iButtonIconSvg, color: Colors.black),
              SizedBox(width: 10.w),
              SizedBox(
                width: MediaQuery.of(context).size.width - 90,
                child: Text(
                  overflow: TextOverflow.visible,
                  'These phone numbers are only visible to Bounce customers, once they\'ve made a booking at your store.',
                  style: fontSize16(context)!.copyWith(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        GetBuilder<AddNewStoreViewModel>(
          builder: (controller) {
            return Column(
              children: AddNewStoreView.phoneFieldList.map((item) {
                return item;
              }).toList(),
            );
          },
        ),
        GetBuilder<AddNewStoreViewModel>(
          builder: (controller) {
            return controller.listLengt < 2
                ? TextButton(
                    onPressed: onTapAddNewNumber,
                    child: Text('Add another', style: fontSize16(context)),
                  )
                : Text(
                    'you can\'t add more than two numbers',
                    style: fontSize14(
                      context,
                    )!.copyWith(color: AppColors.themeColor.shade400),
                  );
          },
        ),
      ],
    );
  }

  Widget buildFormSection(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Store info',
            style: fontSize17(context)!.copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20.h),
          customInputField(
            context,
            title: 'Store name',
            hint: 'Enter you name',
            controller: _storeNameTEController,
          ),
          SizedBox(height: 20.h),
          customInputField(
            context,
            title: 'Store type',
            controller: _storeTypeTEController,
            hint: 'e. g. Retail store',
          ),
          SizedBox(height: 20.h),
          customInputField(
            context,
            title:
                'How many bags can you store at the same time, including small backpacks and purses?',
            controller: _bagCapacityTEController,
            hint: '50',
          ),
          SizedBox(height: 20.h),
          Text(
            'Store Address',
            style: fontSize17(
              context,
            )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20.h),
          customInputField(
            context,
            title: 'Street address ',
            controller: _streetAddressTEController,
            hint: 'Via di San Giovanni in Laterano, 68',
          ),
          SizedBox(height: 20.h),
          customInputField(
            context,
            title: 'Zip Code',
            controller: _zipCodeTEController,
            hint: '00184',
          ),
          SizedBox(height: 20.h),
          Text(
            'Directions',
            style: fontSize17(
              context,
            )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20.h),
          customInputField(
            context,
            title:
                'Help customers find you by giving directions to your location.',
            controller: _directionTEController,
            hint:
                'Near the Colosseum, just a one-minute walk from the Colosseum.',
          ),
          GetBuilder<AddNewStoreViewModel>(
            builder: (controller) {
              return Text(
                ' ${controller.countDirectionLength}/800 Characters',
                style: fontSize16(context)!.copyWith(color: Colors.black),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget customInputField(
    BuildContext context, {
    required String title,
    required TextEditingController controller,
    required String hint,
    int? maxLength,
    int? maxLine,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: fontSize16(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w300),
        ),
        SizedBox(height: 10.h),
        TextFormField(
          maxLength: maxLength,
          maxLines: maxLine,
          controller: controller,
          style: TextStyle(color: Colors.black, fontSize: 15),
          decoration: InputDecoration(hintText: hint),
          onChanged: (value) {
            Get.find<AddNewStoreViewModel>().updateDirectionLength(
              value.length,
            );
          },
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'Add new store',
        style: fontSize24(
          context,
        )!.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  onTapAddNewNumber() {
    Get.find<AddNewStoreViewModel>().onAddNewNumber();
  }

  @override
  void dispose() {
    _storeNameTEController.dispose();
    _storeTypeTEController.dispose();
    _bagCapacityTEController.dispose();
    _streetAddressTEController.dispose();
    _zipCodeTEController.dispose();
    _directionTEController.dispose();
    super.dispose();
  }
}
