import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/common/widgets/custom_mobile_scanner_widget.dart';
import 'package:cenith_marchent/features/store/view/dont_have_camera_view.dart';
import 'package:cenith_marchent/features/store/view/link_bounce_signage.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ReadyToLinkView extends StatefulWidget {
  const ReadyToLinkView({super.key});

  static final String name = 'ready-to-link-screen';

  @override
  State<ReadyToLinkView> createState() => _ReadyToLinkViewState();
}

class _ReadyToLinkViewState extends State<ReadyToLinkView> {
  final MobileScannerController mobileScannerController =
      MobileScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Link Cenith Signage',
          style: fontSize16(context)?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.1.sp,
          ),
        ),
        actions: [IconButton(onPressed: _onTapPop, icon: Icon(Icons.close))],
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250.h,
              width: 350.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: CustomMobileScannerWidget(
                onDetect: (result) {
                  Logger().i(result);
                },
                overLayBuilder: (_, __) {
                  return buildOverlayBuilder();
                },
                controller: mobileScannerController,
              ),
            ),
            SizedBox(height: 32.h),
            Text(
              'How To Scan Signage',
              style: fontSize16(context)?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.1.sp,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 14.h,
                children: [
                  _buildInstructionText(
                    context,
                    text: '1.  Hold your phone towards the signage',
                  ),
                  _buildInstructionText(
                    context,
                    text:
                        '2.  Make sure the QR code on the signage is at the center of the screen',
                  ),
                  _buildInstructionText(
                    context,
                    text: '3.  It wil mically scan the QR code',
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: Column(
                children: [
                  Text(
                    'Don\'t have a camera?',
                    style: fontSize14(context)?.copyWith(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1.sp,
                    ),
                  ),

                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, DontHaveCameraView.name),
                    child: Text(
                      'Link Manually',
                      style: fontSize12(
                        context,
                      )?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Container buildOverlayBuilder() {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(
          vertical: BorderSide(width: 80.w, color: Color(0x3A818181)),
          horizontal: BorderSide(width: 30.h, color: Color(0x3A818181)),
        ),
      ),
      child: DottedBorder(
        options: RectDottedBorderOptions(
          color: AppColors.themColor,
          dashPattern: [8, 5],
        ),
        child: Container(),
      ),
    );
  }

  Widget _buildInstructionText(BuildContext context, {required String text}) {
    return Text(
      text,
      style: fontSize14(context)!.copyWith(color: Colors.black),
    );
  }

  void _onTapPop() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, LinkBounceSignage.name);
    }
  }

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }
}
