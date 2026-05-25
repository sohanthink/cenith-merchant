import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TellUsAboutBusinessView extends StatefulWidget {
  const TellUsAboutBusinessView({super.key, required this.onValidChanged});

  static final String name = 'your-business-details-screen';
  final Function(bool isValid) onValidChanged;

  @override
  State<TellUsAboutBusinessView> createState() =>
      TellUsAboutBusinessViewState();
}

class TellUsAboutBusinessViewState extends State<TellUsAboutBusinessView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _submitted = false;

  final _businessNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalController = TextEditingController();
  final _streetOrBuildingNumController = TextEditingController();
  final _registeredNameTEController = TextEditingController();
  final _vatTEController = TextEditingController();
  final _phoneTEController = TextEditingController();
  final _addressTEController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _listen();
  }

  void _listen() {
    for (final c in [
      _businessNameController,
      _cityController,
      _postalController,
      _streetOrBuildingNumController,
      _registeredNameTEController,
      _vatTEController,
      _phoneTEController,
      _addressTEController,
    ]) {
      c.addListener(_checkFilledOnly);
    }
  }

  void _checkFilledOnly() {
    final filled =
        _businessNameController.text.isNotEmpty &&
        _cityController.text.isNotEmpty &&
        _postalController.text.isNotEmpty &&
        _streetOrBuildingNumController.text.isNotEmpty &&
        _registeredNameTEController.text.isNotEmpty &&
        _vatTEController.text.isNotEmpty &&
        _phoneTEController.text.isNotEmpty &&
        _registeredNameTEController.text.isNotEmpty;

    widget.onValidChanged(filled);
  }

  void submit() {
    setState(() => _submitted = true);
    FocusScope.of(context).unfocus();

    final valid = _formKey.currentState?.validate() ?? false;
    widget.onValidChanged(valid);
  }

  @override
  void dispose() {
    _businessNameController.dispose();
    _cityController.dispose();
    _postalController.dispose();
    _streetOrBuildingNumController.dispose();
    _registeredNameTEController.dispose();
    _vatTEController.dispose();
    _phoneTEController.dispose();
    _addressTEController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 100.h),
        child: Form(
          key: _formKey,
          autovalidateMode: _submitted
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12.h),
              _buildFormField(style),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormField(TextStyle style) {
    return Column(
      children: [
        TextFormField(
          controller: _businessNameController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'Business Name',
            suffixIcon: _buildToolTip(

              toolTipTitle: 'Public name of your business',

            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: _registeredNameTEController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'Registered Name',
            suffixIcon: _buildToolTip(

              toolTipTitle: 'Official company name (mandatory)',

            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: _vatTEController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'VAT Number',
            suffixIcon: _buildToolTip(

              toolTipTitle: 'P.IVA/C.F (mandatory)',

            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: _phoneTEController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'Phone Number',
            suffixIcon: _buildToolTip(

              toolTipTitle: 'Not visible to customer (mandatory)',

            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: _addressTEController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'Address',
            suffixIcon: _buildToolTip(

              toolTipTitle: 'Business location address',

            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: _streetOrBuildingNumController,
          style: style,
          decoration: const InputDecoration(
            hintText: 'Street or building number',
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: _cityController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: const InputDecoration(hintText: 'City'),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: _postalController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: const InputDecoration(hintText: 'Postal Code (ZIP)'),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
      ],
    );
  }

  Widget _buildToolTip({
    required String toolTipTitle,
  }) {
    return Tooltip(
      message: toolTipTitle,
      triggerMode: TooltipTriggerMode.tap,
      preferBelow: false,
      verticalOffset: 8.h,
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          topLeft: Radius.circular(8.r),
          bottomLeft: Radius.circular(8.r),
        ),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      textStyle: fontSize16(context)!.copyWith(
        color: Colors.white,

      ),
      child: Icon(
        Icons.info_outline,
        color: AppColors.themeColor.shade500,
      ),
    );
  }
}

