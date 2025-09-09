import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/text_theme.dart';
class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Overview',style: fontSize20(context)!.copyWith(fontWeight: FontWeight.bold),),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.themColor,
                  disabledForegroundColor: AppColors.themColor.shade50,
      
                  side: BorderSide(
                    color: AppColors.themColor,
                    width: 2,
                  ),
      
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Print A Signage'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
