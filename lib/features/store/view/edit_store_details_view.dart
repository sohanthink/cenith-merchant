import 'package:cenith_marchent/core/constants/asstes_path/image_paths.dart';
import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:cenith_marchent/features/store/view/signage_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditStoreDetailsView extends StatefulWidget {
  const EditStoreDetailsView({super.key});

  static final String name = 'edit-store-details-screen';

  @override
  State<EditStoreDetailsView> createState() => _EditStoreDetailsViewState();
}

class _EditStoreDetailsViewState extends State<EditStoreDetailsView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _storeNameTEController = TextEditingController();
  final TextEditingController _businessNameTEController =
      TextEditingController();
  final TextEditingController _phNumTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

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
        _textFieldTitle('Store Name'),
        space(10),
        TextFormField(
          controller: _storeNameTEController,
          textInputAction: TextInputAction.next,
          style: fontSize16(context),
          validator: (String) {},
        ),
        space(10),
        _textFieldTitle('Business Name'),
        space(10),
        TextFormField(
          controller: _businessNameTEController,
          textInputAction: TextInputAction.next,
          style: fontSize16(context),
          validator: (v) {},
        ),
        space(10),
        _textFieldTitle('Phone Number'),
        space(10),
        TextFormField(
          controller: _phNumTEController,
          textInputAction: TextInputAction.next,
          style: fontSize16(context),
          validator: (v) {},
        ),
        space(10),
        _textFieldTitle('E-mail'),
        space(10),
        TextFormField(
          controller: _emailTEController,
          textInputAction: TextInputAction.next,
          style: fontSize16(context),
        ),
        space(10),
        _textFieldTitle('Password'),
        space(10),
        TextFormField(
          controller: _passwordTEController,
          style: fontSize16(context),
        ),
      ],
    );
  }

  Text _textFieldTitle(String title) => Text(title, style: fontSize16(context));

  @override
  void deactivate() {
    _storeNameTEController.dispose();
    _businessNameTEController.dispose();
    _phNumTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.deactivate();
  }
}
