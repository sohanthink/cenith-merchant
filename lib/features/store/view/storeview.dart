import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/blank_screen.dart';
import 'package:cenith_marchent/features/store/view/overview.dart';
import 'package:cenith_marchent/features/store/view/signage_view.dart';
import 'package:flutter/material.dart';

class StoreView extends StatefulWidget {
  const StoreView({super.key});

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  //TODO: will be managed from view model
  int selectedIndex = 0;
  List<Widget> tabs =  [Overview(),BlankScreen(),SignageView()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              buildHeaderSection(context),
              SizedBox(height: 25),
              buildMenuSection(context),
              SizedBox(height: 20),
              tabs[selectedIndex]
            ],
          ),
        ),
      ),
    );
  }
  Widget buildMenuSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['Overview', 'Hours', 'Signage'].asMap().entries.map((
                  item,
                ) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = item.key;
                      //TODO: remove the setState when fetch the api
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: item.key == selectedIndex
                            ? AppColors.themColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          item.value,
                          style: fontSize14(context)!.copyWith(
                            color: item.key == selectedIndex
                                ? Colors.white
                                : null,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
    );
  }

  Widget buildHeaderSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Lavaterilla',
                    style: fontSize24(
                      context,
                    )!.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Add Store +',
                    style: fontSize16(context)!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Catamaran',
                    ),
                  ),
                ],
              ),
    );
  }
}
