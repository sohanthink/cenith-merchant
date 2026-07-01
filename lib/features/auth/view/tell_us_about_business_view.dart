import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/widgets/tooltip_portal.dart';
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
            suffixIcon: ToolTipPortal(context: context, toolTipTitle: 'Public name of your business'),
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
            suffixIcon: ToolTipPortal(context: context, toolTipTitle: 'Official company name'),
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
            suffixIcon: ToolTipPortal(context: context, toolTipTitle: 'P.IVA/C.F'),
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
            suffixIcon: ToolTipPortal(context: context, toolTipTitle: 'Not visible to customer'),
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
            suffixIcon: ToolTipPortal(context: context, toolTipTitle: 'Business location address'),
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

}



