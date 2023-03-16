import 'package:demo/Utils/AppString.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'Localozation_service.dart';
import 'Views/Screens/HomeScreen.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbacklocale,
          translations: LocalizationService(),
          debugShowCheckedModeBanner: false,
          title: AppString.title,
          home: HomeScreen(),
        );
      },
    );
  }
}

