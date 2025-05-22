import 'package:beeto_ai/controller/theme_controller.dart';
import 'package:beeto_ai/routes/app_pages.dart';
import 'package:beeto_ai/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode:
          themeController.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
