import 'package:flutter/cupertino.dart';

Widget dynamicBottomILand({
  required BuildContext context,
  required Widget child,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewPadding.bottom),
    child: child,
  );
}
