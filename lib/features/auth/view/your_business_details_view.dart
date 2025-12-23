import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourBusinessDetailsView extends StatefulWidget {
  const YourBusinessDetailsView({super.key, required this.onValidChanged});

  static final String name = 'your-business-details-screen';
  final Function(bool isValid) onValidChanged;

  @override
  State<YourBusinessDetailsView> createState() =>
      _YourBusinessDetailsViewState();
}

class _YourBusinessDetailsViewState extends State<YourBusinessDetailsView> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  void _checkFormValidity() {
    final isValid = _formKey.currentState?.validate() ?? false;
    widget.onValidChanged(isValid);
  }

  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // SizedBox(height: 8.h),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: TextButton(
            //     onPressed: () {},
            //     child: Text('Skip', style: style),
            //   ),
            // ),
            SizedBox(height: 16.h),
            TextFormField(
              style: style,
              decoration: InputDecoration(hintText: 'Business Name'),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              onChanged: (_) => _checkFormValidity(),
            ),
            SizedBox(height: 10.h),
            _dropdownField(
              hint: 'Legal Business Name',
              items: ['Name', 'Name1'],
              onChanged: (value) {},
            ),
            _dropdownField(
              hint: 'VAT Number/Tax Code',
              items: [],
              onChanged: (value) {},
            ),
            _dropdownField(
              hint: 'Business Phone Number',
              items: [],
              onChanged: (value) {},
            ),
            _dropdownField(
              hint: 'Business Address',
              items: [],
              onChanged: (value) {},
            ),
            TextFormField(
              style: style,
              decoration: InputDecoration(hintText: 'City'),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              onChanged: (_) => _checkFormValidity(),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              style: style,
              decoration: InputDecoration(hintText: 'Postal Code(ZIP Code)'),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              onChanged: (_) => _checkFormValidity(),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              style: style,
              decoration: InputDecoration(hintText: 'Daily Luggage Limit'),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              onChanged: (_) => _checkFormValidity(),
            ),
            SizedBox(height: 20.h,)

          ],
        ),
      ),
    );
  }

  Widget _dropdownField({
    required String hint,
    required List<String> items,
    String? value,
    required Function(String?) onChanged,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 1.w),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Text(
            hint,
            style: fontSize16(
              context,
            )!.copyWith(color: Colors.grey, letterSpacing: 0.1.sp),
          ),
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items
              .map(
                (e) => DropdownMenuItem<String>(
                  value: e,
                  child: Text(e, style: fontSize16(context)),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
