import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmYourLocationView extends StatefulWidget {
  const ConfirmYourLocationView({super.key, required this.onValidChanged});

  final Function(bool isValid) onValidChanged;

  @override
  State<ConfirmYourLocationView> createState() =>
      _ConfirmYourLocationViewState();
}

class _ConfirmYourLocationViewState extends State<ConfirmYourLocationView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void _checkFormValidity() {
    final isValid = _formKey.currentState?.validate() ?? false;
    widget.onValidChanged(isValid);
  }



  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Container(
            padding: EdgeInsets.all(16.w),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 7)],
            ),
            child: Column(
              children: [
                TextFormField(
                  style: style,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                  onChanged:(v) =>_checkFormValidity(),
                ),
                SizedBox(height: 16.h),
                TextFormField(
                  style: style,
                  maxLines: 3,
                  decoration: InputDecoration(),
                  validator: (v) => v == null || v.isEmpty ? 'Required' : null,
                  onChanged:(v) =>_checkFormValidity(),
                ),
                SizedBox(height: 24.h),
                Container(
                  width: double.infinity,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
