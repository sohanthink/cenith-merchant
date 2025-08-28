import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/controller_bindings/controller_bindings.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/home/view/home_screen.dart';
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
            initialRoute: HomeScreen.name,
            initialBinding: ControllerBindings(),
            onGenerateRoute: AppRoutes.routes,
            theme: AppTheme.themeData,
            title: 'Cenith Marchent',
        );
      },
    );
  }
}
