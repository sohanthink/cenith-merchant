import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/view/benefits_of_linking_signage_view.dart';
import 'package:cenith_marchent/features/store/view/link_bounce_signage.dart';
import 'package:cenith_marchent/features/store/view/order_tag_and_signage_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignageView extends StatefulWidget {
  const SignageView({super.key});

  static final String name = 'signage-screen';

  @override
  State<SignageView> createState() => _SignageViewState();
}

class _SignageViewState extends State<SignageView> {
  final List<Map<String, dynamic>> _orders = [
    {
      "title": "Window sticker (back)",
      "unit": "1 unit",
      "status": "Delivered",
      "date": DateTime(2025, 9, 20),
    },
    {
      "title": "Mini sticker",
      "unit": "2 unit",
      "status": "Pending",
      "date": DateTime(2025, 9, 21),
    },
    {
      "title": "Window sticker (front)",
      "unit": "1 unit",
      "status": "Cancelled",
      "date": DateTime(2025, 9, 21),
    },
    {
      "title": "Reusable tags",
      "unit": "1 unit",
      "status": "Delivered",
      "date": DateTime(2025, 9, 19),
    },
  ];
  DateTime? _selectedDate;
  String? _selectedStatus;

  final List<String> _statusList = ["Delivered", "Pending", "Cancelled"];

  Future<void> _picDate() async {
    final DateTime? picDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picDate != null) {
      setState(() {
        _selectedDate = picDate;
      });
    }
  }

  List<Map<String, dynamic>> _filterOrder() {
    return _orders.where((order) {
      final matchDate =
          _selectedDate == null ||
          (order['date'].day == _selectedDate!.day &&
              order['date'].month == _selectedDate!.month &&
              order['date'].year == _selectedDate!.year);
      final matchStatus =
          _selectedStatus == null || order['status'] == _selectedStatus;
      return matchDate && matchStatus;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            space(16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildCircleImage(),
                  space(16),
                  Text(
                    'Get walk-in bonuses and more bookings by linking your signage',
                    textAlign: TextAlign.center,
                    style: fontSize16(context)?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1.sp,
                      color: Colors.black,
                    ),
                  ),
                  space(16),
                  RichText(
                    text: TextSpan(
                      style: fontSize14(context)?.copyWith(color: Colors.black),
                      children: [
                        TextSpan(
                          text:
                              'Start by scanning the QR code on your Bounce signage to link it to your store. ',
                        ),
                        TextSpan(
                          text: 'Benefits Of Linking Signage',
                          style: fontSize14(context)?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.themColor,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                BenefitsOfLinkingSignageView.name,
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),
                  Center(
                    child: Text(
                      '6 signs linked',
                      style: fontSize14(context)?.copyWith(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, LinkBounceSignage.name),
                    child: Text('Link Cenith Signage'),
                  ),
                  space(16),
                  _buildButton(
                    onTap: () => Navigator.pushNamed(
                      context,
                      OrderTagAndSignageView.name,
                    ),
                    buttonName: 'Print A Signage',
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    'Your orders',
                    style: fontSize20(context)?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  space(16),
                  Text(
                    'Check the status of recent orders, manage returns, and create new orders.',
                    style: fontSize14(context)?.copyWith(color: Colors.black),
                  ),
                  space(16),
                  _buildButton(
                    onTap: ()=>Navigator.pushNamed(context, OrderTagAndSignageView.name),
                    buttonName: 'Order Tags & Signage',
                  ),
                  space(16),

                  _buildSelectOrderDate(context),
                  space(16),
                  _buildSelectStatus(context),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            _buildSignateAndStatus(context),
            _buildPagination(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectOrderDate(BuildContext context) {
    return GestureDetector(
      onTap: _picDate,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppColors.themColor, width: 1.5.w),
        ),
        child: Text(
          _selectedDate == null
              ? 'Select Order Date'
              : '${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}',
          style: fontSize14(context),
        ),
      ),
    );
  }

  Widget _buildSelectStatus(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.r),
        border: Border.all(color: AppColors.themColor, width: 1.5.w),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedStatus,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down_sharp,
            color: AppColors.themColor,
          ),
          hint: Text('Select Status', style: fontSize14(context)),
          items: _statusList.map((status) {
            return DropdownMenuItem(
              value: status,
              child: Text(status, style: fontSize14(context)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
          },
        ),
      ),
    );
  }

  Widget _buildSignateAndStatus(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          SizedBox(height: 32.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  topLeft: Radius.circular(12.r),
                ),
                color: Colors.blue.shade100.withOpacity(0.2),
              ),
              child: Text(
                'Signage and Status',
                style: fontSize16(context)?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.1.sp,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          space(16),
          ..._filterOrder().map((order) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: _buildSignageAndStatus(
                context,
                signageTitle: order['title'] as String,
                unit: order['unit'] as String,
                status: order['status'] as String,
                onTap: () {},
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildPagination(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 16.w),
      color: Colors.blue.shade100.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_back, color: AppColors.midLightBlue),
              ),
              Text('Previous', style: fontSize14(context)),
            ],
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.arrow_forward, color: AppColors.midLightBlue),
              ),
              Text('Next', style: fontSize14(context)),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildCircleImage() {
  return Center(
    child: ClipOval(
      child: Container(
        height: 85.h,
        width: 85.w,
        decoration: BoxDecoration(
          color: Colors.grey,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.r,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Image.asset(ImagePaths.personDemo, fit: BoxFit.cover),
      ),
    ),
  );
}

Widget _buildButton({required VoidCallback onTap, required String buttonName}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.white,
      foregroundColor: AppColors.themColor,
      side: BorderSide(color: AppColors.themColor, width: 1.6.w),
      elevation: 0,
    ),
    onPressed: onTap,
    child: Text(buttonName),
  );
}

Widget _buildSignageAndStatus(
  BuildContext context, {
  required String signageTitle,
  required String unit,
  required String status,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.0.w),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              signageTitle,
              style: fontSize16(context)?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.1.sp,
                color: Colors.black,
              ),
            ),
            Text(unit, style: fontSize14(context)),
          ],
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 10.h,
            bottom: 10.h,
          ),
          decoration: BoxDecoration(
            color: AppColors.greenShade.shade200,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            status,
            style: fontSize14(
              context,
            )?.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1.sp),
          ),
        ),
        IconButton(onPressed: onTap, icon: Icon(Icons.arrow_forward_ios)),
      ],
    ),
  );
}

SizedBox space(double h) => SizedBox(height: h.h);
