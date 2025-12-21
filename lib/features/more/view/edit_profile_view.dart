import 'package:cenith_marchent/core/constants/app_colors.dart';
import 'package:cenith_marchent/core/constants/asstes_path/icons_path.dart';
import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/more/widgets/notification_preferrence.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  static final String name = 'edit-profile-screen';

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final TextEditingController _fNameTEController = TextEditingController();
  final TextEditingController _lNameTEController = TextEditingController();
  final TextEditingController _phoneNumberTEController =
      TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _selectedLanguage = "English";

  final List<String> _languages = [
    "English",
    "Bangla",
    "Hindi",
    "Urdu",
    "Arabic",
  ];
  final List<String> _buttonCategoryName = [
    'Email',
    'SMS',
    'WhatsApp',
    'App Notification',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: fontSize20(
            context,
          )?.copyWith(fontWeight: FontWeight.w700, letterSpacing: 0.1.sp),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColors.midLightBlue),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                _buildAffiliateLinkSection(context),
                SizedBox(height: 32.h),
                _title('First name'),
                _space(10),
                TextFormField(
                  style: fontSize16(context),
                  controller: _fNameTEController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'First Name is required';
                    }
                    return null;
                  },
                ),
                _space(10),
                _title('Last Name'),
                _space(10),
                TextFormField(
                  style: fontSize16(context),
                  controller: _lNameTEController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Last Name is required';
                    }
                    return null;
                  },
                ),
                _space(10),
                _title('Phone Number'),
                _space(10),
                _buildPhoneNumberField(),
                _space(10),
                _title('Email'),
                _space(10),
                TextFormField(
                  style: fontSize16(context),
                  controller: _emailTEController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'E-mail is required';
                    }
                    return null;
                  },
                ),
                _space(10),
                _title('Language'),
                _space(10),
                _buildLanguageField(context),
                SizedBox(height: 24.h),
                Text(
                  'Your notification prefarence for Rymon srl',
                  style: fontSize16(context)?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.1.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  'Choose the topic you would like to get notified about.',
                  style: fontSize12(context),
                ),
                SizedBox(height: 32.h),

                SizedBox(height: 16.h),
                NotificationPreference(
                  buttonCategoryName: _buttonCategoryName,
                  context: context,
                  title: 'Billing',
                  directionText:
                      'Choose the topic you would like to get notified about',
                  isSwitchOn: true,
                  onTapSwitch: (value) {},
                  onTapNotificationType: (selectedButton) {},
                ),
                SizedBox(height: 16.h),
                NotificationPreference(
                  buttonCategoryName: _buttonCategoryName,
                  context: context,
                  title: 'Information',
                  directionText:
                      'Choose the topic you would like to get notified about',
                  isSwitchOn: true,
                  onTapSwitch: (value) {},
                  onTapNotificationType: (selectedButton) {},
                ),
                SizedBox(height: 16.h),
                NotificationPreference(
                  buttonCategoryName: _buttonCategoryName,
                  context: context,
                  title: 'Reminders',
                  directionText:
                      'Choose the topic you would like to get notified about',
                  isSwitchOn: true,
                  onTapSwitch: (value) {},
                  onTapNotificationType: (selectedButton) {},
                ),
                SizedBox(height: 16.h),
                NotificationPreference(
                  buttonCategoryName: _buttonCategoryName,
                  context: context,
                  title: 'Booking',
                  directionText:
                      'Choose the topic you would like to get notified about',
                  isSwitchOn: true,
                  onTapSwitch: (value) {},
                  onTapNotificationType: (selectedButton) {},
                ),
                SizedBox(height: 32.h),
                ElevatedButton(onPressed: () {}, child: Text('Save')),
                SizedBox(height: 8.h),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Delete User Profile',
                      style: fontSize16(context)?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Terms & Conditions',
                      style: fontSize12(
                        context,
                      )?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAffiliateLinkSection(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(20.r),
      child: Stack(
        children: [
          Opacity(
            opacity: 0.3,
            child: Image.asset(
              ImagePaths.bgImage,
              fit: BoxFit.cover,
              height: 190.h,
              width: 400.w,
            ),
          ),
          Positioned(
            top: 30.h,
            left: 20.w,
            child: Text(
              'Your Affiliate link',
              style: fontSize16(
                context,
              )?.copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.1.sp),
            ),
          ),
          Positioned(
            top: 70.h,
            left: 20.w,
            child: Text(
              'Share this link with others and earn money',
              style: fontSize14(context)?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            top: 110.h,
            left: 20.w,
            child: Row(
              children: [
                Container(
                  width: 250.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.r,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'https://beyondcommandandcontrol.com/',
                      style: fontSize12(context),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 22.r,
                    child: SvgPicture.asset(IconsPath.fileIconSvg, width: 25.w),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return IntlPhoneField(
      style: fontSize16(context),
      controller: _phoneNumberTEController,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      dropdownIcon: const Icon(Icons.keyboard_arrow_down),
      initialCountryCode: 'BD',
      validator: (phone) {
        if (phone == null || phone.number.isEmpty) {
          return "Phone number required";
        }
        return null;
      },
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide(color: Colors.red),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 12.w,
        ),
      ),
      dropdownTextStyle: fontSize16(context)?.copyWith(color: Colors.black),
      disableLengthCheck: true,
    );
  }

  Widget _buildLanguageField(BuildContext context) {
    return DropdownButtonFormField<String>(
      style: fontSize12(context),
      initialValue: _selectedLanguage,
      items: _languages.map((lang) {
        return DropdownMenuItem(value: lang, child: Text(lang));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selectedLanguage = value;
        });
      },
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.midLightBlue,
        ),
      ),
      borderRadius: BorderRadius.circular(14.r),
    );
  }

  Text _title(String title) => Text(title, style: fontSize14(context));

  SizedBox _space(double h) => SizedBox(height: h.h);

  @override
  void dispose() {
    _fNameTEController.dispose();
    _lNameTEController.dispose();
    _emailTEController.dispose();
    _phoneNumberTEController.dispose();
    super.dispose();
  }
}
