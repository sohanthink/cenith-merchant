import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/model/tell_about_your_self_model.dart';
import 'package:cenith_marchent/features/auth/view_model/registration_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class TellUsAboutYourselfView extends StatefulWidget {
  const TellUsAboutYourselfView({super.key, required this.onValidChanged});

  static final String name = 'Sign-up-screen';
  final Function(bool isValid) onValidChanged;

  @override
  State<TellUsAboutYourselfView> createState() =>
      TellUsAboutYourselfViewState();
}

class TellUsAboutYourselfViewState extends State<TellUsAboutYourselfView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  String selectedCountryCode = '+39';
  String initialCountry = 'IT';

  final fNameTEController = TextEditingController();
  final lNameTEController = TextEditingController();
  final phoneTEController = TextEditingController();
  final passwordTEController = TextEditingController();
  final emailTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _listen();
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      getDataFromCache();
    });
  }

  void _listen() {
    for (final c in [
      fNameTEController,
      lNameTEController,
      phoneTEController,
      passwordTEController,
      emailTEController,
    ]) {
      c.addListener(_checkFilled);
    }
  }

  void _checkFilled() {
    final filled =
        fNameTEController.text.isNotEmpty &&
        lNameTEController.text.isNotEmpty &&
        phoneTEController.text.isNotEmpty &&
        passwordTEController.text.isNotEmpty &&
        emailTEController.text.isNotEmpty;
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
    fNameTEController.dispose();
    lNameTEController.dispose();
    phoneTEController.dispose();
    passwordTEController.dispose();
    emailTEController.dispose();
    super.dispose();
  }

  void getDataFromCache() async {
    RegistrationViewModel controller = Get.find<RegistrationViewModel>();

    Map<String, dynamic> data = await controller.getDataFromCache();

    if (data.isNotEmpty) {
      TellUsAboutYourSelfModel processedData =
          TellUsAboutYourSelfModel.fromJson(data);
      fNameTEController.text = processedData.firstName;
      lNameTEController.text = processedData.lastName;
      phoneTEController.text = processedData.mobileNumber;
      emailTEController.text = processedData.email;
      passwordTEController.text = processedData.password;
      selectedCountryCode = processedData.countryCode;
      initialCountry = processedData.initialCountry;
     debugPrint(initialCountry);
    } else {
      debugPrint('failed to get data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 32.h),
        child: Form(
          key: _formKey,
          autovalidateMode: _submitted
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          child: Column(
            children: [
              SizedBox(height: 32.h),
              _buildFormField(style),
              // SizedBox(height: 200.h,)
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
          style: style,
          controller: fNameTEController,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(hintText: 'First Name'),
          validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
        ),
        SizedBox(height: 15.h),

        TextFormField(
          style: style,
          controller: lNameTEController,
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
          controller: emailTEController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(hintText: 'Email'),
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Enter a email';
            }

            final regex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

            if (!regex.hasMatch(v)) {
              return 'Invalid email';
            }

            return null;
          },
        ),
        SizedBox(height: 15.h),
        TextFormField(
          style: style,
          controller: passwordTEController,
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
      ],
    );
  }

  Widget _buildPhoneNumberField() {
    return IntlPhoneField(
      key: ValueKey(initialCountry),
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
      controller: phoneTEController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      dropdownIcon: const Icon(Icons.keyboard_arrow_down),
      initialCountryCode: initialCountry,
      onCountryChanged: (countries) {
        selectedCountryCode = '+${countries.dialCode}';
        initialCountry = countries.code;
      },
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
