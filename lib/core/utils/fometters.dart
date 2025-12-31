import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Format {
  static String text({required String text, required int length}) {
    if (text.length > length) {
      return '${text.substring(0, length - 2)}..';
    }
    return text;
  }

  static String email({required String email, required int length}) {
    List<String> mailPart = email.split('@');
    int safeLength = length < 8 ? length : length - 8;

    if (safeLength <= 0) return email;

    if (mailPart[0].length > safeLength) {
      return "${mailPart[0].substring(0, safeLength)}..@gmail.com";
    }
    return email;
  }

  static RichText customText({
    required String text,
    required int length,
    required String extension,
    VoidCallback? onTap,
    TextStyle? extensionStyle,
    TextStyle? style,
  }) {
    if (text.length > length) {
      final x = RichText(
        text: TextSpan(
          style: style ?? TextStyle(color: Colors.black),

          children: [
            TextSpan(text: '${text.substring(0, length - 2)}..'),
            TextSpan(
              text: extension,
              style: extensionStyle ?? TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()..onTap = onTap ?? () {},
            ),
          ],
        ),
      );
      return x;
    }
    return RichText(
      text: TextSpan(style: TextStyle(color: Colors.black), children: [TextSpan(text: text)]),
    );
  }
}