import 'dart:io';

import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/widgets/order_tag_and_signage_card.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PrintASignageView extends StatefulWidget {
  const PrintASignageView({super.key});

  static final String name = 'print-a-signage-view';

  @override
  State<PrintASignageView> createState() => _PrintASignageViewState();
}

class _PrintASignageViewState extends State<PrintASignageView> {
  final ImagePicker _imagePicker = ImagePicker();
  final List<XFile>_pickedImages=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Tags & Signage',
          style: fontSize16(
            context,
          )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: AppColors.themeColor),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text(
                'You can select more than 1 signage type.',
                style: fontSize14(
                  context,
                )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                'Reusable security tags to attach to bags from number 1 to 60.',
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                'Reusable security tags to attach to bags from number 1 to 60.',
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                'Reusable security tags to attach to bags from number 1 to 60.',
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                'Reusable security tags to attach to bags from number 1 to 60.',
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildUploadImage(
                    context,
                    uploadImageType: 'Add Photo Of Storefront', onPickedImage: _onTapImagePickedStoreFont,
                  ),
                  _buildUploadImage(
                    context,
                    uploadImageType: 'Add Photo Of \nBag Storage', onPickedImage: _onTapImagePickedBagStorage,
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                spacing: 12.w,
                children: [
                  for (var image in _pickedImages)
                    Container(
                      height: 80.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14.r),
                        child:Image.file(
                          File(image.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: Radius.circular(14.r),
                      strokeWidth: 2,
                      dashPattern: [10,4],
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    child: Container(
                      height: 80.h,
                      width: 90.w,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Icon(
                        Icons.add,
                        color: AppColors.themeColor,
                        size: 30.sp,
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 16.h),
              OrderTagAndSignageCard(
                orderTagName: 'Reusable Tags',
                orderLength: '60 Per Year',
                orderDescription:
                'Reusable security tags to attach to bags from number 1 to 60.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadImage(
      BuildContext context, {
        required String uploadImageType,
        required VoidCallback onPickedImage
      }) {
    return GestureDetector(
      onTap: onPickedImage,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          strokeWidth: 2,
          dashPattern: [10, 4],
          radius: Radius.circular(14.r),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Container(
          height: 150.h,
          width: 160.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12.h),
              Image.asset(ImagePaths.uploadImagePng, width: 50.w),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Text(
                  uploadImageType,
                  textAlign: TextAlign.center,
                  style: fontSize14(context)?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onTapImagePickedStoreFont() async {
    XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      _pickedImages.add(image);
      setState(() {});
    }
  }
  Future<void>_onTapImagePickedBagStorage()async{
    XFile? image=await _imagePicker.pickImage(source: ImageSource.camera);
    if(image!=null){
      _pickedImages.add(image);
      setState(() {

      });
    }


  }
}
