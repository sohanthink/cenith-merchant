import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmationCodeEntryView extends StatefulWidget {
  const ConfirmationCodeEntryView({super.key});

  static final String name = 'confirmation-code-entry-screen';

  @override
  State<ConfirmationCodeEntryView> createState() =>
      _ConfirmationCodeEntryViewState();
}

class _ConfirmationCodeEntryViewState extends State<ConfirmationCodeEntryView> {
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
 final TextEditingController _pinCodeTEController=TextEditingController();
 bool _isFilled = false;
 bool _isSubmitted = false;


 @override
  void initState() {
    _listen();
    super.initState();
  }

 void _listen() {
   _pinCodeTEController.addListener(_checkFilledOnly);
 }

 void _checkFilledOnly() {
   final filled = _pinCodeTEController.text.length == 4;

   if (filled != _isFilled) {
     setState(() {
       _isFilled = filled;
     });
   }
 }

 void _submit() {
   setState(() {
     _isSubmitted = true;
   });

   final valid = _formKey.currentState?.validate() ?? false;

   if (valid) {
     Navigator.pushNamedAndRemoveUntil(
       context,
       MainBottomNavView.name,
           (route) => false,
     );
   }
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTopSection(context),
                SizedBox(height: 40.h),
                _buildPinCodeFieldsSection(context),
                SizedBox(height: 32.h),
                _buildConfirmBtttonSection(context),
                SizedBox(height: 32.h),
                _buildDidnotCodeSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeFieldsSection(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 250.w,
        child: PinCodeTextField(
          length: 4,
          controller: _pinCodeTEController,
          validator: (v) {
            if (v == null || v.length != 4) {
              return 'Enter 4 digit code';
            }
            return null;
          },
          autovalidateMode: _isSubmitted
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          obscureText: false,
          hintCharacter: '-',
          hintStyle: fontSize24(context),
          keyboardType: TextInputType.number,
          animationType: AnimationType.fade,
          textStyle: fontSize20(
            context,
          )!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(25.r),
            fieldHeight: 80.h,
            fieldWidth: 50.w,
            activeFillColor: AppColors.themeColor,
            activeColor: AppColors.themeColor,
            inactiveFillColor: Colors.grey.shade100,
            inactiveBorderWidth: 1.w,
            activeBorderWidth: 1.w,
            // selectedFillColor: AppColors.themeColor.shade100,
            selectedColor: AppColors.themeColor,
            inactiveColor: Colors.grey.shade400,
          ),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Colors.transparent,
          enableActiveFill: true,
          appContext: context,
        ),
      ),
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter The Confirmation Code',
          style: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1.sp,
            color: AppColors.darkBlue,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'Enter the code to confirm your email.',
          style: fontSize14(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 16.h),
        Text(
          'INFOASRISLAMIOMAIL.COM',
          style: fontSize14(
            context,
          )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildConfirmBtttonSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _isFilled ? _submit : null,
          child: Text('Confirm'),
        ),

        SizedBox(height: 24.h),
        Text(
          'Resend the confirmation code (54s)',
          style: fontSize14(context)!.copyWith(color: Colors.black),
        ),
      ],
    );
  }

  Widget _buildDidnotCodeSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 8.h, bottom: 8.h),
      decoration: BoxDecoration(
        color: AppColors.themeColor.shade100,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.themeColor),
          SizedBox(width: 8.w),
          Text(
            "Didn't get the Code?",
            style: fontSize14(
              context,
            )!.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Text(
            ' try SMS',
            style: fontSize14(context)!.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
