import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/view/signage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class EditStoreDetailsView extends StatefulWidget {
  const EditStoreDetailsView({super.key});

  static final String name = 'edit-store-details-screen';

  @override
  State<EditStoreDetailsView> createState() => _EditStoreDetailsViewState();
}

class _EditStoreDetailsViewState extends State<EditStoreDetailsView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fNameTEController = TextEditingController();
  final TextEditingController _lNameTEController = TextEditingController();
  final TextEditingController _mobileNmTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _businessNameTEController =
      TextEditingController();
  final TextEditingController _legalBusinessNameTEController =
      TextEditingController();
  final TextEditingController _vatTaxNmTEController = TextEditingController();
  final TextEditingController _businessAddressTEController =
      TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _postalCodeTEController = TextEditingController();
  final TextEditingController _dailyLuggageLimitTEController =
      TextEditingController();
  final TextEditingController _landMarkTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Store Details',
          style: fontSize22(context)!.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                space(16),
                CircleAvatar(
                  radius: 50.r,
                  backgroundImage: AssetImage(ImagePaths.personDemo),
                ),
                _buildTextFieldSection(context),
                space(32),
                ElevatedButton(onPressed: () {}, child: Text('Update')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        space(32),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textFieldSectionTitle('Personal Details :'),
              space(10),
              TextFormField(
                controller: _fNameTEController,
                decoration: InputDecoration(hintText: 'First Name'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (String) {},
              ),

              space(10),
              TextFormField(
                controller: _lNameTEController,
                decoration: InputDecoration(hintText: 'Last Name'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),

              space(10),
              TextFormField(
                controller: _mobileNmTEController,
                decoration: InputDecoration(hintText: 'Mobile Number'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
              space(10),
              TextFormField(
                decoration: InputDecoration(hintText: 'Email'),
                controller: _emailTEController,
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
            ],
          ),
        ),
        space(16),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              space(5),
              _textFieldSectionTitle('Business Details :'),
              space(10),
              TextFormField(
                controller: _businessNameTEController,
                decoration: InputDecoration(hintText: 'Business Name'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
              space(10),
              TextFormField(
                controller: _legalBusinessNameTEController,
                decoration: InputDecoration(hintText: 'Legal Business Name'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
              space(10),
              TextFormField(
                controller: _vatTaxNmTEController,
                decoration: InputDecoration(hintText: 'Vat Tax Number'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
              space(10),
              TextFormField(
                controller: _businessAddressTEController,
                decoration: InputDecoration(hintText: 'Business address'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
              space(10),
              TextFormField(
                controller: _cityTEController,
                decoration: InputDecoration(hintText: 'City'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
              space(10),
              TextFormField(
                controller: _postalCodeTEController,
                decoration: InputDecoration(hintText: 'Postal Code'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
              space(10),
              TextFormField(
                controller: _dailyLuggageLimitTEController,
                decoration: InputDecoration(hintText: ' Daily Luggage Limit'),
                textInputAction: TextInputAction.next,
                style: fontSize16(context),
                validator: (v) {},
              ),
            ],
          ),
        ),
        // space(16),
        // _textFieldSectionTitle('Land Mark :'),
        // space(10),
        // TextFormField(
        //   controller: _landMarkTEController,
        //   decoration: InputDecoration(hintText: 'Land Mark'),
        //   textInputAction: TextInputAction.next,
        //   style: fontSize16(context),
        //   validator: (v) {},
        // ),
      ],
    );
  }

  Text _textFieldSectionTitle(String title) => Text(
    title,
    style: fontSize16(context)!.copyWith(fontWeight: FontWeight.w600),
  );

  @override
  void deactivate() {
    _lNameTEController.dispose();
    _fNameTEController.dispose();
    _mobileNmTEController.dispose();
    _emailTEController.dispose();
    _businessNameTEController.dispose();
    _legalBusinessNameTEController.dispose();
    _vatTaxNmTEController.dispose();
    _businessAddressTEController.dispose();
    _cityTEController.dispose();
    _postalCodeTEController.dispose();
    _dailyLuggageLimitTEController.dispose();
    _landMarkTEController.dispose();
    super.deactivate();
  }
}
