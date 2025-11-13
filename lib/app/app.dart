import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realstate_ui_mark_one/core/theme/app_theme.dart';
import 'package:realstate_ui_mark_one/routes/app_pages.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Real Estate App',
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
