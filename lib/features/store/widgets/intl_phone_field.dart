import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/view_model/add_new_store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';

class IntlPhoneFieldWidget extends StatelessWidget {
  IntlPhoneFieldWidget({super.key, required this.controller});

  final TextEditingController controller;

  final AddNewStoreViewModel _controller = Get.find<AddNewStoreViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntlPhoneField(
          decoration: InputDecoration(
            border: outlineInputBorder(),
            errorBorder: outlineInputBorder(),
            focusedBorder: outlineInputBorder(),
            enabledBorder: outlineInputBorder(),
          ),
          style: fontSize16(context)!.copyWith(color: Colors.black),
          disableLengthCheck: true,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          controller: controller,
          initialCountryCode: _controller.initialCountryCode,
          languageCode: _controller.defaultLanguageCode,
          onCountryChanged: (value) => _controller.onCountryChange(value.name),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(borderSide: BorderSide(color: Colors.black54));
  }
}
