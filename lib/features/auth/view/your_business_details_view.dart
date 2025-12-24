import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourBusinessDetailsView extends StatefulWidget {
  const YourBusinessDetailsView({Key? key, required this.onValidChanged})
    : super(key: key);

  static final String name = 'your-business-details-screen';
  final Function(bool isValid) onValidChanged;

  @override
  State<YourBusinessDetailsView> createState() =>
      YourBusinessDetailsViewState();
}

class YourBusinessDetailsViewState extends State<YourBusinessDetailsView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  bool _submitted = false;

  final _businessNameController = TextEditingController();
  final _cityController = TextEditingController();
  final _postalController = TextEditingController();
  final _luggageLimitController = TextEditingController();

  String? _legalBusinessName;
  String? _vatNumber;
  String? _businessPhone;
  String? _businessAddress;

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
      _luggageLimitController,
    ]) {
      c.addListener(_checkFilledOnly);
    }
  }

  void _checkFilledOnly() {
    final filled =
        _businessNameController.text.isNotEmpty &&
            _cityController.text.isNotEmpty &&
            _postalController.text.isNotEmpty &&
            _luggageLimitController.text.isNotEmpty &&
            _legalBusinessName != null &&
            _vatNumber != null &&
            _businessPhone != null &&
            _businessAddress != null;

    widget.onValidChanged(filled);
  }



  void submit() {
    setState(() => _submitted = true);

    final valid = _formKey.currentState?.validate() ?? false;
    widget.onValidChanged(valid);
  }



  @override
  void dispose() {
    _businessNameController.dispose();
    _cityController.dispose();
    _postalController.dispose();
    _luggageLimitController.dispose();
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
          children: [
            SizedBox(height: 16.h),
            TextFormField(
              controller: _businessNameController,
              textInputAction: TextInputAction.next,
              style: style,
              decoration: const InputDecoration(hintText: 'Business Name'),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 10.h),
            _dropdownFormField(
              hint: 'Legal Business Name',
              items: ['Name', 'Name1'],
              value: _legalBusinessName,
              onChanged: (v) {
                setState(() => _legalBusinessName = v);
                _checkFilledOnly();
              },
            ),
            SizedBox(height: 10.h),
            _dropdownFormField(
              hint: 'VAT Number/Tax Code',
              items: ['1', '2'],
              value: _vatNumber,
              onChanged: (v) {
                setState(() => _vatNumber = v);
                _checkFilledOnly();
              },
            ),
            SizedBox(height: 10.h),
            _dropdownFormField(
              hint: 'Business Phone Number',
              items: ['+8801...', '+88017...'],
              value: _businessPhone,
              onChanged: (v) {
                setState(() => _businessPhone = v);
                _checkFilledOnly();
              },
            ),
            SizedBox(height: 10.h),
            _dropdownFormField(
              hint: 'Business Address',
              items: ['Address1', 'Address2'],
              value: _businessAddress,
              onChanged: (v) {
                setState(() => _businessAddress = v);
                _checkFilledOnly();
              },
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
            SizedBox(height: 10.h),
            TextFormField(
              controller: _luggageLimitController,
              style: style,
              decoration: const InputDecoration(
                hintText: 'Daily Luggage Limit',
              ),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _dropdownFormField({
    required String hint,
    required List<String> items,
    String? value,
    required Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      style: fontSize16(context),
      icon: const Icon(Icons.keyboard_arrow_down_outlined),
      value: value,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: fontSize16(
          context,
        )!.copyWith(color: Colors.grey, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      ),
      validator: (v) => v == null || v.isEmpty ? 'Required' : null,
      items: items
          .map(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e, style: fontSize16(context)),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
