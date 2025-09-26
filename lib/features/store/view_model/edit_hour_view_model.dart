import 'package:get/get.dart';

class EditHourViewModel extends GetxController {

   bool isChecked =false;

   List<Map<String,dynamic>> dayList = [
     {
       'day':'Sat',
       'isOpened': true,
       'startTime': '08:30',
       'endTime': '22:30',
       'isOpen24Hrs': false,
     },{
       'day':'Sun',
       'isOpened': true,
       'startTime': '08:30',
       'endTime': '22:30',
       'isOpen24Hrs': false,
     },{
       'day':'Mon',
       'isOpened': true,
       'startTime': '08:30',
       'endTime': '22:30',
       'isOpen24Hrs': false,
     },{
       'day':'Tue',
       'isOpened': true,
       'startTime': '08:30',
       'endTime': '22:30',
       'isOpen24Hrs': false,
     },{
       'day':'Wed',
       'isOpened': true,
       'startTime': '08:30',
       'endTime': '22:30',
       'isOpen24Hrs': false,
     },{
       'day':'Thu',
       'isOpened': true,
       'startTime': '08:30',
       'endTime': '22:30',
       'isOpen24Hrs': false,
     },{
       'day':'Fri',
       'isOpened': true,
       'startTime': '08:30',
       'endTime': '22:30',
       'isOpen24Hrs': false,
     },
   ];

   updateOpenStatus(int index){
     dayList[index]['isOpened'] = !dayList[index]['isOpened'];
     update();
   }
   updateStartTime(int index,String time){
     dayList[index]['startTime'] = time;
     update();
   }
   updateEndTime(int index,String time){
     dayList[index]['endTime'] = time;
     update();
   }

   update24HoursOpen(int index,){
     dayList[index]['isOpen24Hrs'] = !dayList[index]['isOpen24Hrs'];
     update();
   }

   updateButtonStatus(){
    isChecked = !isChecked;
    update();
  }


}