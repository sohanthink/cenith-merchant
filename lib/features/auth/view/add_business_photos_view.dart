import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/common/widgets/learn_how_to_take_good_photo_widget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:image_picker/image_picker.dart';

import '../../../core/constants/asstes_path/icons_path.dart';

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          buildLocationPhotoSection(context),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }

  Row buildUploadPhotoSection() {
    return Row(
      spacing: 13,
      children: [
        buildPhotoSectionWidget('Add photo of storefront'),
        buildPhotoSectionWidget('Add photo of bag storage'),
      ],
    );
  }

  Widget buildPhotoSectionWidget(String title) {
    return Expanded(
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: Colors.grey,
          strokeWidth: 1,
          dashPattern: [6, 4],
          radius: Radius.circular(12.r),
        ),
        child: GestureDetector(
          onTap: _showAlertDialogue,
          child: Container(
            padding: EdgeInsets.all(16.w),

            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.cloud_upload, size: 45.sp, color: Colors.black),
                SizedBox(height: 8.h),
                Text(
                  textAlign: TextAlign.center,
                  title,
                  style: fontSize16(
                    context,
                  )!.copyWith(color: AppColors.themeColor),
                ),
                SizedBox(height: 6.h),
                Text(
                  'Support:JPG,JPEG2000,PNG',
                  style: fontSize14(context)!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
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

  void _showAlertDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildImageCategoryIcon(
                        context,
                        onTap: () {
                          _pickPhoto(source: ImageSource.camera);
                          Navigator.pop(context);
                        },
                        icon: Icons.camera_alt_outlined,
                        typeText: 'Camera',
                      ),

                      _buildImageCategoryIcon(
                        context,
                        onTap: () {
                          _pickPhoto(source: ImageSource.gallery);
                          Navigator.pop(context);
                        },
                        icon: Icons.cloud_upload_rounded,
                        typeText: 'Gallery',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildImageCategoryIcon(
    BuildContext context, {
    required VoidCallback onTap,
    required IconData icon,
    required String typeText,
  }) {
    return Column(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(icon, size: 40.sp, color: AppColors.themeColor),
        ),
        Text(
          typeText,
          style: fontSize16(context)!.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
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
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  height: MediaQuery.of(context).size.height*0.72,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: LearnHowToTakeGoodPhotoWidget(),
                  ),

                );
              },
            );
          },
          child: Text(
            'Learn how to take good photos',
            style: fontSize14(context)!.copyWith(color: AppColors.themeColor),
          ),
        ),
        SizedBox(height: 25),
        buildUploadPhotoSection(),
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
      ],
    );
  }
}
