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
      slot: TimeSlotModel(
        timeSlots: [
          ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
          ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
        ],
      ),
      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Sun',
      isOpen: true,
      slot: TimeSlotModel(
        timeSlots: [
          ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
          ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
        ],
      ),
      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Mon',
      isOpen: true,
      slot: TimeSlotModel(
        timeSlots: [
          ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
          ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
        ],
      ),
      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Tue',
      isOpen: true,
      slot: TimeSlotModel(
        timeSlots: [
          ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
          ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
        ],
      ),
      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Wed',
      isOpen: true,
      slot: TimeSlotModel(
        timeSlots: [
          ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
          ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
        ],
      ),
      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Thu',
      isOpen: true,
      slot: TimeSlotModel(
        timeSlots: [
          ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
          ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
        ],
      ),
      isOpen24Hrs: false,
    ),

    DayModel(
      day: 'Fri',
      isOpen: true,
      slot: TimeSlotModel(
        timeSlots: [
          ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
          ShiftSlot(startTime: '08:30 AM', endTime: '10:30 PM'),
        ],
      ),
      isOpen24Hrs: false,
    ),
  ];

  void updateOpenStatus(int index) {
    dayList[index].isOpen = !dayList[index].isOpen;
    update();
  }

  void updateStartTime(int dayIndex, int slotIndex, String time) {
    dayList[dayIndex].slot.timeSlots[slotIndex].startTime = time;
    update();
  }

  void updateEndTime(int index, String time, int slotIndex) {
    dayList[index].slot.timeSlots[slotIndex].endTime = time;
    update();
  }

  void update24HoursOpen(int index) {
    dayList[index].isOpen24Hrs = !dayList[index].isOpen24Hrs;
    update();
  }

  void isOpen247(bool v) {
    isAllDay = v;
  }

  void removeTimeSlot(int dayIndex, int slotIndex) {
    if (dayList[dayIndex].slot.timeSlots.length < 2) return;
    dayList[dayIndex].slot.timeSlots.removeAt(slotIndex);
    update();
  }

  void addNewSlot(int dayIndex) {
    if (dayList[dayIndex].slot.timeSlots.length > 1) return;
    dayList[dayIndex].slot.timeSlots.add(
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
