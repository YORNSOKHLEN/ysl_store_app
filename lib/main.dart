import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ysl_store_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ysl_store_app/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YSL Store',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: YAppTheme.lightTheme,
      darkTheme: YAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
