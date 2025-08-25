import 'package:cenith_storage/core/controller_bindings/controller_bindings.dart';
import 'package:cenith_storage/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'core/routes/app_routes.dart';
class CenithStorage extends StatelessWidget {
  const CenithStorage({super.key});



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      initialBinding: ControllerBindings(),
      onGenerateRoute: AppRoutes.routes,
      theme: AppTheme.themeData



    );
  }
}
