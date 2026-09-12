import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/auth/model/tell_us_about_your_business_model.dart';
import 'package:cenith_marchent/features/auth/view_model/registration_view_model.dart';
import 'package:cenith_marchent/features/auth/widgets/tooltip_portal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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

  RxBool submitted = false.obs;

  String initialCountry = 'IT';
  String initialCountryCode = '+39';

  final businessNameController = TextEditingController();
  final cityController = TextEditingController();
  final postalTEController = TextEditingController();
  final streetOrBuildingNumController = TextEditingController();
  final registeredNameTEController = TextEditingController();
  final vatTEController = TextEditingController();
  final phoneTEController = TextEditingController();
  final addressTEController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listen();
  }

  void listen() {
    for (final c in [
      businessNameController,
      cityController,
      postalTEController,
      streetOrBuildingNumController,
      registeredNameTEController,
      vatTEController,
      phoneTEController,
      addressTEController,
    ]) {
      c.addListener(checkFilledOnly);
    }
  }

  void checkFilledOnly() {
    final filled =
        businessNameController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        postalTEController.text.isNotEmpty &&
        streetOrBuildingNumController.text.isNotEmpty &&
        registeredNameTEController.text.isNotEmpty &&
        vatTEController.text.isNotEmpty &&
        phoneTEController.text.isNotEmpty &&
        registeredNameTEController.text.isNotEmpty;

    widget.onValidChanged(filled);
  }

  void submit() {
    setState(() => submitted.value = true);
    FocusScope.of(context).unfocus();

    final valid = _formKey.currentState?.validate() ?? false;
    widget.onValidChanged(valid);
  }

  Future<void> getDataFromCache() async {
    Map<String, dynamic> data = await Get.find<RegistrationViewModel>()
        .getDataFromCache();

    TellUsAboutYourBusinessModel processedData =
        TellUsAboutYourBusinessModel.fromJson(data);

    initialCountry = processedData.phoneNumber.country;
    businessNameController.text = processedData.businessName;
    registeredNameTEController.text = processedData.registrationName;
    vatTEController.text = processedData.vatNumber;
    phoneTEController.text = processedData.phoneNumber.number;
    addressTEController.text = processedData.address;
    cityController.text = processedData.city;
    streetOrBuildingNumController.text = processedData.streetOrBuildingNumber;
    postalTEController.text = processedData.postalCode;
  }

  @override
  void dispose() {
    businessNameController.dispose();
    cityController.dispose();
    postalTEController.dispose();
    streetOrBuildingNumController.dispose();
    registeredNameTEController.dispose();
    vatTEController.dispose();
    phoneTEController.dispose();
    addressTEController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: submitted.value
            ? AutovalidateMode.always
            : AutovalidateMode.disabled,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 12.h),
            _buildFormField(style),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(TextStyle style) {
    return Column(
      children: [
        TextFormField(
          controller: businessNameController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'Business Name',
            suffixIcon: ToolTipPortal(
              context: context,
              toolTipTitle: 'Public name of your business',
            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: registeredNameTEController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'Registered Name',
            suffixIcon: ToolTipPortal(
              context: context,
              toolTipTitle: 'Official company name',
            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: vatTEController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'VAT Number',
            suffixIcon: ToolTipPortal(
              context: context,
              toolTipTitle: 'P.IVA/C.F',
            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        _buildPhoneNumberField(),
        // TextFormField(
        //   controller: _phoneTEController,
        //   textInputAction: TextInputAction.next,
        //   style: style,
        //   decoration: InputDecoration(
        //     hintText: 'Phone Number',
        //     suffixIcon: ToolTipPortal(context: context, toolTipTitle: 'Not visible to customer'),
        //   ),
        //   validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        // ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: addressTEController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: InputDecoration(
            hintText: 'Address',
            suffixIcon: ToolTipPortal(
              context: context,
              toolTipTitle: 'Business location address',
            ),
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: streetOrBuildingNumController,
          style: style,
          decoration: const InputDecoration(
            hintText: 'Street or building number',
          ),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: cityController,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: const InputDecoration(hintText: 'City'),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
        ),
        SizedBox(height: 10.h),
        TextFormField(
          controller: postalTEController,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          style: style,
          decoration: const InputDecoration(hintText: 'Postal Code (ZIP)'),
          validator: (v) => v == null || v.isEmpty ? 'Required' : null,
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
      onCountryChanged: (countries) {
      setState(() {
        initialCountry = countries.name;
        initialCountryCode = countries.dialCode;
      });
      },
      style: fontSize16(context),
      controller: phoneTEController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      dropdownIcon: const Icon(Icons.keyboard_arrow_down),
      initialCountryCode: initialCountry,
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
