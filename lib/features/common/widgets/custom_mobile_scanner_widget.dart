import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class CustomMobileScannerWidget extends StatefulWidget  {

  const CustomMobileScannerWidget({super.key, required this.onDetect, this.overLayBuilder,required this.controller});

  final Function onDetect;
  final LayoutWidgetBuilder? overLayBuilder;
  final MobileScannerController controller;


  @override
  State<CustomMobileScannerWidget> createState() => _CustomMobileScannerWidgetState();
}

class _CustomMobileScannerWidgetState extends State<CustomMobileScannerWidget> {

  static final RxBool isScanning = true.obs;
  static String? scannedData;

  @override
  Widget build(BuildContext context) {
     return ClipRRect(
       borderRadius: BorderRadius.circular(20.r),
       child: MobileScanner(
        controller: widget.controller,
        overlayBuilder: widget.overLayBuilder ,
        onDetect: (BarcodeCapture result){
          if(isScanning.value ){
            scannedData = result.barcodes.first.rawValue;
          }
          if(scannedData != null){
            isScanning.value = false;
            widget.onDetect(scannedData);
          }
          widget.controller.stop();
        },
           ),
     );
  }
}
