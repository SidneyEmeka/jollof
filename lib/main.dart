import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jollof/onboarding/splashscreen.dart';
import 'package:jollof/utils/stylings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFEC706)),
        scaffoldBackgroundColor: Stylings.bgColor,
        useMaterial3: true,
      ),
      home: const Splashscreen(),
    );
  }
}
