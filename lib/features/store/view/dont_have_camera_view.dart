import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/view/link_bounce_signage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontHaveCameraView extends StatefulWidget {
  const DontHaveCameraView({super.key});

  static final String name = 'dont-have-camera-screen';

  @override
  State<DontHaveCameraView> createState() => _DontHaveCameraViewState();
}

class _DontHaveCameraViewState extends State<DontHaveCameraView> {
  final TextEditingController _pinCodeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Link Bounce Signage',
          style: fontSize16(
            context,
          )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
        ),
        actions: [
          IconButton(
            onPressed: _onTapPop,
            icon: Icon(Icons.close, color: AppColors.themColor),
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find the signage PIN near the QR code.',
                style: fontSize14(context),
              ),
              SizedBox(height: 24.h),
              _buildDirectionText(context),
              SizedBox(height: 24.h),
              Text(
                'PIN Code',
                style: fontSize14(
                  context,
                )?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.1.sp),
              ),
              SizedBox(height: 16.h),
              _buildPinCodeField(context),
              Spacer(),
              _buildButton(context),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Have a Camera?',
            style: fontSize14(context)?.copyWith(
              fontWeight: FontWeight.bold,
              letterSpacing: 0.1.sp,
              color: AppColors.midLightBlue.shade400,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Scan QR code', style: fontSize12(context)),
        ),
        SizedBox(height: 16.h),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.shade400,
            foregroundColor: AppColors.midLightBlue,
          ),
          onPressed: () {},
          child: Text('Link Signage'),
        ),
      ],
    );
  }

  Widget _buildPinCodeField(BuildContext context) {
    return TextFormField(
      controller: _pinCodeController,
      decoration: InputDecoration(
        hintText: 'eg.wwwrew',
        hintStyle: fontSize14(context),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Pin code is required';
        }
        return null;
      },
    );
  }

  Widget _buildDirectionText(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.r,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.error_outline_outlined, color: AppColors.themColor),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              'If your signage doesn\'t have a printed PIN, scan the QR code using your phone camera and copy url to the field below.',
              maxLines: 3,
              textAlign: TextAlign.justify,
              style: fontSize14(context)?.copyWith(letterSpacing: 0.1.sp),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  void _onTapPop() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    super.dispose();
  }
}
