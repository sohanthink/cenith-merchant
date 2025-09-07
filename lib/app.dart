import 'package:cenith_marchent/core/controller_bindings/controller_bindings.dart';
import 'package:cenith_marchent/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes/app_routes.dart';
class CenithStorage extends StatelessWidget {
  const CenithStorage({super.key});



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_,child){
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: 'booking-screen',
            initialBinding: ControllerBindings(),
            onGenerateRoute: AppRoutes.routes,
            theme: AppTheme.themeData
        );
      },

    );
  }
}
