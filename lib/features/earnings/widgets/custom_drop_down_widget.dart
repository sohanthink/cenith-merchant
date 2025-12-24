import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';

class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({
    super.key,
    required this.selectedItem,
    required this.selectedOption,
  });

  final dynamic selectedItem;
  final List<DropdownMenuItem>? selectedOption;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {

  late dynamic selectedItem = widget.selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 40,
      width: (MediaQuery.of(context).size.width / 2) - 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: widget.selectedOption,
          value:  selectedItem,
          style: fontSize16(context),
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            size: 20,
            color: Colors.black,
          ),
          onChanged: (value) {
            //TODO: update with controller
            setState(() {
              selectedItem = value ?? DateTime.now().year;
            });
          },
        ),
      ),
    );
  }
}
