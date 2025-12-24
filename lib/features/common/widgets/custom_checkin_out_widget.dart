import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/home/view/qr_code_scanning_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomCheckInOutWidget extends StatefulWidget {
  const CustomCheckInOutWidget({
    super.key,
    required this.controller,
    required this.maxWidth,
    this.onTap,
  });

  final ScrollController controller;
  final double maxWidth;
  final VoidCallback? onTap;

  @override
  State<CustomCheckInOutWidget> createState() => _CustomCheckInOutWidgetState();
}

class _CustomCheckInOutWidgetState extends State<CustomCheckInOutWidget> {
  RxBool isExpanded = true.obs;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      if (widget.controller.position.userScrollDirection ==
          ScrollDirection.reverse) {
        isExpanded.value = false;
      } else if (widget.controller.position.userScrollDirection ==
          ScrollDirection.forward) {
        isExpanded.value = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedContainer(
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: isExpanded.value == false ? 60.w : widget.maxWidth,
        child: isExpanded.value == true
            ? ElevatedButton(
                onPressed: () =>
                    widget.onTap ??
                    Navigator.pushNamed(context, QrCodeScanningView.name),
                child: Text('Check in/out',style: fontSize14(context)!.copyWith(color: Colors.white,fontWeight: FontWeight.w700),),
              )
            : FloatingActionButton(
                onPressed: () =>
                    widget.onTap ??
                    Navigator.pushNamed(context, QrCodeScanningView.name),
                child: Icon(Icons.qr_code, size: 20.sp),
              ),
      );
    });
  }
}

/*
* DOCS:
* 
* 1. create a Scroll Controller on parent widget.
* 2. sign the widget on floating action button in Scaffold.
* 3. pass the scroll controller as controller parameter.
*
*
* */
