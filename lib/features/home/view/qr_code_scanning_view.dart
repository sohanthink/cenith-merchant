import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScanningView extends StatefulWidget {
  const QrCodeScanningView({super.key});

  static final String name = 'qrCode-scanning-screen';

  @override
  State<QrCodeScanningView> createState() => _QrCodeScanningViewState();
}

class _QrCodeScanningViewState extends State<QrCodeScanningView> {
  MobileScannerController mobileScannerController = MobileScannerController();
  String? scannedData;
  bool isScanning = true;

  @override
  void dispose() {
    mobileScannerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'scan qr code',
              style: fontSize24(
                context,
              )!.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              'Scan the customer\'s QR code to check them in or out.',
              style: fontSize14(context)!.copyWith(color: Colors.black),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.maxFinite,
              height: 300.h,
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: MobileScanner(
                  controller: mobileScannerController,
                  overlayBuilder: (context, constraints) {
                    return buildOverlaySection();
                  },
                  onDetect: (BarcodeCapture capture) {
                    if (isScanning = true) {
                      scannedData = capture.barcodes.first.rawValue;
                    }

                    if (scannedData != null) {
                      setState(() {
                        isScanning = false;
                      });
                    }
                    mobileScannerController.stop();

                    Logger().e(scannedData);
                  },
                ),
              ),
            ),
            Spacer(),
            Center(child: SvgPicture.asset(IconsPath.logWithoutBgSvg)),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  Container buildOverlaySection() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26, width: 50),
      ),
      child: DottedBorder(
        options: RectDottedBorderOptions(
          dashPattern: [8, 6],
          strokeWidth: 1,
          color: AppColors.themColor,
        ),
        child: Container(),
      ),
    );
  }
}
