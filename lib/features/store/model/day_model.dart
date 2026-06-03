//  {
//       'day': 'Sat',
//       'isOpened': true,
//       'slots': TimeSlotModel(
//         timeSlots: [
//           ShiftSlot(startTime: '09:30 AM', endTime: '11:30 PM'),
//           ShiftSlot(startTime: '08:30 AM', endTime: '22:30 PM'),
//         ],
//       ),
//       'isOpen24Hrs': false,
//     },

import 'package:cenith_marchent/features/common/model/time_slot_model.dart';

class DayModel {
  String day;
  bool isOpen;
  TimeSlotModel slot;
  bool isOpen24Hrs;

  DayModel({
    required this.day,
    required this.isOpen,
    required this.slot,
    required this.isOpen24Hrs,
  });
}
