import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/widgets/benefits_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BenefitsOfLinkingSignageView extends StatefulWidget {
  const BenefitsOfLinkingSignageView({super.key});

  static final String name = 'benefits-of-linking-signage-screen';

  @override
  State<BenefitsOfLinkingSignageView> createState() =>
      _BenefitsOfLinkingSignageViewState();
}

class _BenefitsOfLinkingSignageViewState
    extends State<BenefitsOfLinkingSignageView> {
  final List<Map<String, dynamic>> _benefits = [
    {
      "title": "Direct booking",
      "description":
          "Customer will be able to book directly by scanning the QR of the store sign.",
      "icon": Icons.phone_android_sharp,
    },
    {
      "title": "Increased visibility",
      "description":
          "Your signage attracts more customers and improves brand recognition.",
      "icon": Icons.visibility,
    },
    {
      "title": "Seamless experience",
      "description": "Customers can engage with your store in just one scan.",
      "icon": Icons.qr_code_scanner,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Benefits Of Linking Signage',
          style: fontSize16(context)?.copyWith(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.close, color: AppColors.themColor),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: _benefits.length,
              itemBuilder: (context, index) {
                return BenefitCard(context: context, benefits: _benefits[index]);
              },
              separatorBuilder: (context, index) => SizedBox(height: 12.h),
            ),
          ),
          ElevatedButton(onPressed: ()=> Navigator.pop(context), child: Text('Ok')),
          SizedBox(height: 40.h,)
        ],
      ),
    );
  }

}


