import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExceptionViewModel extends GetxController {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  bool isClose = false;

  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay endTime = TimeOfDay.now();

  updateDate({required DateTime date, required DateType dateType, required VoidCallback onInvalidDateRange}) {
    if(dateType == DateType.startDate && date.isAfter(endDate)){
      onInvalidDateRange();
      return;
    }

        if (dateType == DateType.startDate) {
      startDate = date;
    } else {
      endDate = date;
    }
    update();
  }

  updateTime({required TimeOfDay time, required TimeType timeType, required VoidCallback onInvalidTimeRange}) {
    if(timeType == TimeType.startTime && time.isAfter(endTime)){
      onInvalidTimeRange();
      return;
    }
    if (timeType == TimeType.startTime) {
      startTime = time;
    } else {
      endTime = time;
    }
    update();
  }

  Future<DateTime?> datePicker(context) {
    var pickedDate = showDatePicker(
      context: context,
      firstDate: startDate.subtract(Duration(days: 356)),
      lastDate: endDate.add(Duration(days: 365)),
    );
    return pickedDate;
  }

  Future<TimeOfDay?> timePicker(context, {required TimeOfDay time}) {
    var pickedTime = showTimePicker(context: context, initialTime: time);
    return pickedTime;
  }

  onSwitchChange(bool value){
    isClose = !isClose;
    update();
  }

}

enum DateType { startDate, endDate }

enum TimeType { startTime, endTime }
