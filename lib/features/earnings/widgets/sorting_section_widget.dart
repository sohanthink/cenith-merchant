import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_drop_down_widget.dart';
class SortingSectionWidget extends StatelessWidget {
  const SortingSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomDropDownMenu(
          selectedItem: DateTime.now().year,
          selectedOption: buildDropDownYearMenu(),
        ),
        CustomDropDownMenu(
          selectedItem: DateFormat('MMMM').format(DateTime.now()),
          selectedOption: buildDropDownMonthMenu(),
        ),
      ],
    );
  }
  buildDropDownMonthMenu() {
    print(DateFormat('MMMM').format(DateTime.now()));
    List<String> allMonths = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    List<DropdownMenuItem<String>> months = [];
    for (var item in allMonths) {
      months.add(DropdownMenuItem(value: item, child: Text((item))));
    }
    return months;
  }

  buildDropDownYearMenu() {
    int currentYear = DateTime.now().year;
    List<DropdownMenuItem<int>> years = [];
    for (int i = 0; i < 10; i++) {
      years.add(
        DropdownMenuItem(
          value: currentYear - i,
          child: Text((currentYear - i).toString()),
        ),
      );
    }
    return years;
  }
}