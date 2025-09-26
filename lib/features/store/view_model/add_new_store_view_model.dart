import 'package:cenith_marchent/features/store/view/add_new_store_view.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../widgets/intl_phone_field.dart';

class AddNewStoreViewModel extends GetxController {
  String initialCountryCode = 'Bd';
  String defaultLanguageCode = 'en';
  int listLengt = 1;
  int countDirectionLength = 0;

  TextEditingController forFirstNumber = TextEditingController();
  TextEditingController forSecondNumber = TextEditingController();

  onCountryChange(String value) {
    initialCountryCode = value;
    update();
  }

  onAddNewNumber() {
    if (AddNewStoreView.phoneFieldList.length < 2) {
      AddNewStoreView.phoneFieldList.add(
        IntlPhoneFieldWidget(controller: forSecondNumber),
      );
      listLengt = AddNewStoreView.phoneFieldList.length;
    } else {}
    update();
  }

  void updateDirectionLength(int value) {
    countDirectionLength = value;
    update();
  }
}
