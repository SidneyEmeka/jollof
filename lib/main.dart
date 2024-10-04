import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jollof/onboarding/regemail.dart';
import 'package:jollof/onboarding/splashscreen.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:jollof/utils/stylings.dart';

void main() {
  Get.put(Jollofx());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFEC706)),
        scaffoldBackgroundColor: Stylings.bgColor,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          color: Stylings.bgColor,
          toolbarHeight: MediaQuery.of(context).size.height*0.07
        )
      ),
      home: const Splashscreen(),
    );
  }
}
