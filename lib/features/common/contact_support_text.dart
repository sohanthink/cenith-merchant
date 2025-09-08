import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ContactSupportText {
  static RichText supportText(BuildContext context, VoidCallback onTap) {
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.titleSmall,
        children: [
          TextSpan(text: 'Have question? '),
          TextSpan(
            text: 'Contact our support team',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
