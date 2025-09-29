import 'package:cenith_marchent/core/controller_bindings/controller_bindings.dart';
import 'package:cenith_marchent/core/theme/app_theme.dart';
import 'package:cenith_marchent/features/main_bottom_nav/view/main_bottom_nav_view.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
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
          useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            initialRoute: MainBottomNavView.name,
            initialBinding: ControllerBindings(),
            onGenerateRoute: AppRoutes.routes,
            theme: AppTheme.themeData
        );
      },
    );
  }
}
