import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddBusinessPhotosView extends StatefulWidget {
  const AddBusinessPhotosView({super.key, required this.onValidChanged});

  static final String name = 'add-business-photos-screen';
  final Function(bool isValid) onValidChanged;

  @override
  State<AddBusinessPhotosView> createState() => _AddBusinessPhotosViewState();
}

class _AddBusinessPhotosViewState extends State<AddBusinessPhotosView> {
  final ImagePicker _imagePicker = ImagePicker();
  final List<XFile> _pickedImages = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onValidChanged(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        DottedBorder(
          options: RoundedRectDottedBorderOptions(
            color: Colors.grey,
            strokeWidth: 1,
            dashPattern: [6, 4],
            radius: Radius.circular(12.r),
          ),
          child: GestureDetector(
            onTap: () {
              _pickPhoto(source: ImageSource.camera);
            },
            child: Container(
              padding: EdgeInsets.all(16.w),
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey.shade200),
              child: Column(
                children: [
                  Icon(
                    Icons.cloud_upload,
                    size: 45.sp,
                    color: AppColors.themColor,
                  ),
                  Text(
                    'Tap to Upload photos or Browse',
                    style: fontSize16(context)!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Support:JPG,JPEG2000,PNG',
                    style: fontSize14(context)!.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),

        SizedBox(height: 32.h),
        Text(
          'Photo Guidelines',
          style: fontSize18(
            context,
          )!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(height: 8.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 10,
            children: [
              _buildPhotoGuidelinesCard(context),
              _buildPhotoGuidelinesCard(context),
              _buildPhotoGuidelinesCard(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoGuidelinesCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 7)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 90.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.r),
                    bottomLeft: Radius.circular(8.r),
                  ),
                ),
              ),
              SizedBox(width: 4.w),
              Container(
                height: 90.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    bottomRight: Radius.circular(8.r),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Avoid Cropped Photos',
            style: fontSize12(
              context,
            )!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 4.h),
          Text(
            '''Show where your business is\n relative to its surrounding''',
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickPhoto({required ImageSource source}) async {
    final XFile? image = await _imagePicker.pickImage(source: source);
    if (image != null) {
      _pickedImages.add(image);
      setState(() {});
      _updateValidity();
    }
  }

  void _updateValidity() {
    widget.onValidChanged(_pickedImages.isNotEmpty);
  }
}
