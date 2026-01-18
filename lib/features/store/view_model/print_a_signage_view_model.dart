import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:screenshot/screenshot.dart';

class PrintASignageViewModel extends GetxController {
  Future printPdf(Uint8List image) async {
    final pwImage = pw.MemoryImage(image);

    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (context) {
          return pw.Center(child: pw.Image(pwImage));
        },
      ),
    );

    debugPrint(" Hitted on pdf");
    await Printing.layoutPdf(onLayout: (format) async => pdf.save());
  }

  Future<Uint8List?> takeScreenShoot({
    required ScreenshotController controller,
    required Widget widget,
  }) async {
    Screenshot(controller: controller, child: widget);

    Uint8List? capture = await controller.captureFromWidget(
        widget,
    delay: Duration(milliseconds: 300),
      context: Get.context
    );
    debugPrint(" Hitted on screen shoot $capture");
    return capture;
  }
}
