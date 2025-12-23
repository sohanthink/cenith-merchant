import 'package:cenith_marchent/core/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key, required this.onValidChanged});
  static final String name = 'Sign-up-screen';
  final Function(bool isValid) onValidChanged;

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fNameTEController = TextEditingController();
  final TextEditingController _lNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();

  @override
  void dispose() {
    _fNameTEController.dispose();
    _lNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _emailTEController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onValidChanged(false);
    });
  }

  void _checkFormValidity() {
    final isValid = _formKey.currentState?.validate() ?? false;
    widget.onValidChanged(isValid);
  }

  @override
  Widget build(BuildContext context) {
    final style = fontSize16(context)!.copyWith(color: Colors.black);
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 32.h),
            TextFormField(
              style: style,
              controller: _fNameTEController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'First Name'),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              onChanged: (_) => _checkFormValidity(),
            ),

            SizedBox(height: 10.h),

            TextFormField(
              style: style,
              controller: _lNameTEController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'Last Name'),
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              onChanged: (_) => _checkFormValidity(),
            ),

            SizedBox(height: 10.h),

            TextFormField(
              style: style,
              controller: _phoneTEController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'Phone'),
              validator: (v) =>
                  v == null || v.length < 10 ? 'Invalid phone' : null,
              onChanged: (_) => _checkFormValidity(),
            ),

            SizedBox(height: 10.h),

            TextFormField(
              style: style,
              controller: _passwordTEController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(hintText: 'Password'),
              validator: (v) =>
                  v == null || v.length < 6 ? 'Min 6 chars' : null,
              onChanged: (_) => _checkFormValidity(),
            ),

            SizedBox(height: 10.h),

            TextFormField(
              style: style,
              controller: _emailTEController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(hintText: 'Email'),
              validator: (v) =>
                  v != null && v.contains('@') ? null : 'Invalid email',
              onChanged: (_) => _checkFormValidity(),
            ),
            SizedBox(height: 90.h),
            /*ElevatedButton(onPressed: () {
              }, child: Text('Next Step'))*/
          ],
        ),
      ),
    );
  }
}
