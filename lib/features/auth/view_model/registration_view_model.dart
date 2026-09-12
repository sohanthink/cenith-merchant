import 'package:cenith_marchent/core/services/hive_service/hive_services.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';

class RegistrationViewModel extends GetxController {
  final List<Map<String, dynamic>> steps = [
    {
      'title': 'Tell Us About Yourself',
      'sub-title':
          'This information will help us create your profile. Please fill in all required fields.',
      'progress': 0.16,
    },
    {
      'title': 'Describe your business',
      'sub-title':
          'Tell us about your business and select the location type that fits you best.',
      'progress': 0.32,
    },
    {
      'title': 'Tell Us About Business',
      'sub-title':
          'Add your business name and fill in the details to get started.',
      'progress': 0.48,
    },
    {
      'title': 'Confirm Your Location',
      'sub-title': 'Make sure the pin is placed correctly on the map.',
      'progress': 0.64,
    },
    {
      'title': 'Set Your Business Hours',
      'sub-title':
          'Let customers know your opening times and availability for service.',
      'progress': 0.80,
    },
    {
      'title': 'Present Your Location',
      'sub-title':
          'Add photos so customers can clearly see your business and where their luggage will be stored.',
      'progress': 1.0,
    },
  ];

  final String boxName = 'Registration Box';
  final String lastPageKey = 'last_page';

  final Map<int, bool> pageValidation = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
  };

  int currentIndex = 0;
  int lastPage = 0;

  void onPageChange(int index) {
    currentIndex = index;
    debugPrint(index.toString());
    update();
  }

  void onPageValidation(bool isValid, int index) {
    pageValidation[index] = isValid;
    update();
  }

  Future<void> saveDataToCache({
    required Map<String, dynamic> body,
    List<Map<String, dynamic>>? listBody,
  }) async {
    try {
      if (listBody != null) {}

      Box box = await HiveService.openBoxIfNeeded(boxName);
      await HiveService.put(box: box, key: lastPageKey, value: currentIndex);
      Logger().d(
        'save data of index: $currentIndex, body: ${listBody ?? body}',
      );
      await HiveService.put(
        box: box,
        key: currentIndex.toString(),
        value: listBody ?? body,
      );
    } catch (e) {
      Logger().e(e);
    }
  }

   Future getDataFromCache() async {
    try {
      Box box = await HiveService.openBoxIfNeeded(boxName);
      var savedPage = await HiveService.get(box: box, key: lastPageKey);
      var body = await HiveService.get(box: box, key: currentIndex.toString());
      Logger().d('get body of index$currentIndex body:$body');
      if (savedPage != null) {
        lastPage = savedPage;
      }
      return body;
    } catch (e) {
      Logger().e("currentIndex: $currentIndex e:$e");
    }
  }
}

///last_page:0
///cach_key:0
