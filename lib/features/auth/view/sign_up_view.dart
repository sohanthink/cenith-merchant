import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key, required this.onValidChanged}) : super(key: key);

  static final String name = 'Sign-up-screen';
  final Function(bool isValid) onValidChanged;

  @override
  State<SignUpView> createState() => SignUpViewState();
}

class SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _submitted = false;

  final _fNameTEController = TextEditingController();
  final _lNameTEController = TextEditingController();
  final _phoneTEController = TextEditingController();
  final _passwordTEController = TextEditingController();
  final _emailTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _listen();
  }

  void _listen() {
    for (final c in [
      _fNameTEController,
      _lNameTEController,
      _phoneTEController,
      _passwordTEController,
      _emailTEController,
    ]) {
      c.addListener(_checkFilled);
    }
  }

  void _checkFilled() {
    final filled =
        _fNameTEController.text.isNotEmpty &&
        _lNameTEController.text.isNotEmpty &&
        _phoneTEController.text.isNotEmpty &&
        _passwordTEController.text.isNotEmpty &&
        _emailTEController.text.isNotEmpty;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onValidChanged(filled);
    });
  }

  void submit() {
    setState(() => _submitted = true);

    final valid = _formKey.currentState!.validate();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onValidChanged(valid);
    });
  }

  @override
  void dispose() {
    _fNameTEController.dispose();
    _lNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _emailTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);
    return Form(
      key: _formKey,
      autovalidateMode: _submitted
          ? AutovalidateMode.always
          : AutovalidateMode.disabled,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32.h),
            TextFormField(
              style: style,
              controller: _fNameTEController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'First Name'),
              validator: (v) =>
                  v == null || v.isEmpty ? 'Enter your name' : null,
            ),
            SizedBox(height: 15.h),

            TextFormField(
              style: style,
              controller: _lNameTEController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'Last Name'),
              validator: (v) =>
                  v == null || v.isEmpty ? 'Enter your last name' : null,
            ),

            SizedBox(height: 15.h),

            _buildPhoneNumberField(),
            SizedBox(height: 15.h),

            TextFormField(
              style: style,
              controller: _passwordTEController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'Password'),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Password is required';
                final regex = RegExp(
                  r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}$',
                );
                if (!regex.hasMatch(v)) {
                  return 'Password must be 8+ chars, include uppercase, lowercase, number & special char';
                }
                return null;
              },
            ),
            SizedBox(height: 15.h),

            TextFormField(
              style: style,
              controller: _emailTEController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(hintText: 'Email'),
              validator: (v) {
                if (v == null || v.isEmpty) {
                  return 'Enter a email';
                }

                final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

                if (!regex.hasMatch(v)) {
                  return 'Invalid email';
                }

                return null;
              },
            ),
            SizedBox(height: 90.h),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return IntlPhoneField(
      countries: [
        Country(
          name: "United States",
          nameTranslations: {
            "en": "United States",
            "bn": "মার্কিন যুক্তরাষ্ট্র",
          },
          flag: "🇺🇸",
          code: "US",
          dialCode: "1",
          minLength: 10,
          maxLength: 10,
        ),
        Country(
          name: "United Kingdom",
          nameTranslations: {"en": "United Kingdom", "bn": "যুক্তরাজ্য"},
          flag: "🇬🇧",
          code: "GB",
          dialCode: "44",
          minLength: 10,
          maxLength: 10,
        ),
        Country(
          name: "Italy",
          nameTranslations: {"en": "Italy", "bn": "ইতালি"},
          flag: "🇮🇹",
          code: "IT",
          dialCode: "39",
          minLength: 10,
          maxLength: 10,
        ),
        Country(
          name: "France",
          nameTranslations: {"en": "France", "bn": "ফ্রান্স"},
          flag: "🇫🇷",
          code: "FR",
          dialCode: "33",
          minLength: 9,
          maxLength: 9,
        ),
        // Switzerland
        Country(
          name: "Switzerland",
          nameTranslations: {"en": "Switzerland", "bn": "সুইজারল্যান্ড"},
          flag: "🇨🇭",
          code: "CH",
          dialCode: "41",
          minLength: 9,
          maxLength: 9,
        ),
        // Austria
        Country(
          name: "Austria",
          nameTranslations: {"en": "Austria", "bn": "অস্ট্রিয়া"},
          flag: "🇦🇹",
          code: "AT",
          dialCode: "43",
          minLength: 10,
          maxLength: 13,
        ),
        // Germany
        Country(
          name: "Germany",
          nameTranslations: {"en": "Germany", "bn": "জার্মানি"},
          flag: "🇩🇪",
          code: "DE",
          dialCode: "49",
          minLength: 10,
          maxLength: 11,
        ),
        // Spain
        Country(
          name: "Spain",
          nameTranslations: {"en": "Spain", "bn": "স্পেন"},
          flag: "🇪🇸",
          code: "ES",
          dialCode: "34",
          minLength: 9,
          maxLength: 9,
        ),
      ],

      style: fontSize16(context),
      controller: _phoneTEController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      dropdownIcon: const Icon(Icons.keyboard_arrow_down),
      initialCountryCode: 'IT',
      validator: (phone) {
        if (phone == null || phone.number.isEmpty) {
          return 'Phone number required';
        }
        final regex = RegExp(r'^\+?[1-9]\d{1,14}$');
        if (!regex.hasMatch(phone.completeNumber)) {
          return 'Invalid phone number';
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
      ),
      dropdownTextStyle: fontSize16(context)?.copyWith(color: Colors.black),
      disableLengthCheck: true,
    );
  }
}
