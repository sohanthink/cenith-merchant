import 'package:cenith_marchent/features/auth/view_model/registration_view_model.dart';
import 'package:cenith_marchent/features/common/model/time_slot_model.dart';
import 'package:cenith_marchent/features/store/model/day_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessHoursViewModel extends GetxController {
  bool isAllDay = false;

  List<DayModel> dayList = [
    DayModel(
      day: 'Sat',
      isOpen: true,
      slot: [
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ],

      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Sun',
      isOpen: true,
      slot: [
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ],

      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Mon',
      isOpen: true,
      slot: [
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ],

      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Tue',
      isOpen: true,
      slot: [
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ],

      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Wed',
      isOpen: true,

      slot: [
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ],
      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Thu',
      isOpen: true,
      slot: [
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ],

      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Fri',
      isOpen: true,
      slot: [
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ],

      isOpen24Hrs: false,
    ),
  ];

  void updateOpenStatus(int index) {
    if (dayList[index].isOpen) {
      dayList[index].isOpen = false;
      update();
      dayList[index].slot = <ShiftSlot>[];
      return;
    } else if (!dayList[index].isOpen) {
      dayList[index].isOpen = true;
      update();
      dayList[index].slot = <ShiftSlot>[
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ];
    }
  }

  Future<List<Map<String, dynamic>>> getCacheData() async {
    try {
      List<Map<String, dynamic>> body = List<Map<String, dynamic>>.from(
        await Get.find<RegistrationViewModel>().getDataFromCache(),
      );
      dayList = body.map((item) {
        return DayModel.fromJson(item);
      }).toList();
      return body;
    } catch (e) {
      debugPrint('failed to parse data: $e');
      return [];
    }
  }

  void updateStartTime(int dayIndex, int slotIndex, String time) {
    dayList[dayIndex].slot[slotIndex].startTime = time;
    update();
  }

  void updateEndTime(int index, String time, int slotIndex) {
    dayList[index].slot[slotIndex].endTime = time;
    update();
  }

  void update24HoursOpen(int index) {
    if (dayList[index].isOpen24Hrs == true) {
      dayList[index].slot = [
        ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
        ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
      ];

      dayList[index].isOpen24Hrs = false;
      update();
      debugPrint(
        'slot: ${dayList[index].slot}, status: ${dayList[index].isOpen24Hrs}',
      );
    } else if (dayList[index].isOpen24Hrs == false) {
      dayList[index].slot = [];
      dayList[index].isOpen24Hrs = true;
      debugPrint(
        'slot: ${dayList[index].slot}, status: ${dayList[index].isOpen24Hrs}',
      );
      update();
    }
  }

  void isOpen247(bool v) {
    isAllDay = v;
  }

  void removeTimeSlot(int dayIndex, int slotIndex) {
    if (dayList[dayIndex].slot.length < 2) return;
    dayList[dayIndex].slot.removeAt(slotIndex);
    update();
  }

  void addNewSlot(int dayIndex) {
    if (dayList[dayIndex].slot.length > 1) return;
    dayList[dayIndex].slot.add(
      ShiftSlot(startTime: '10:30 AM', endTime: '08:30 PM'),
    );
    update();
  }

  void copyScheduleToAllDay(int index) {
    if (dayList[index].isOpen24Hrs) {
      for (int i = 0; i < dayList.length; i++) {
        if (index != i) {
          dayList[i].isOpen24Hrs = dayList[index].isOpen24Hrs;
          dayList[i].isOpen = dayList[index].isOpen;
          debugPrint('date updated with $index ${dayList[index].isOpen24Hrs}');
        }
      }
      update();
    } else {
      for (int i = 0; i < dayList.length; i++) {
        if (index != i) {
          dayList[i].isOpen24Hrs = false;
          dayList[i].slot = dayList[index].slot;
          dayList[i].isOpen = dayList[index].isOpen;
          debugPrint(
            'date updated with$i $index ${dayList[index].isOpen24Hrs}',
          );
        }
      }
      update();
    }
  }

  bool get isValid {
    if (isAllDay) return true;
    return dayList.any((item) => item.isOpen);
  }

  //previous models
}
