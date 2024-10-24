import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/newpass.dart';
import 'package:jollof/utils/stylings.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  @override
  void initState() {
   Future.delayed(const Duration(seconds: 2),(){
     Get.to(()=>const Newpass());
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator(
        color: Stylings.yellow,
        strokeCap: StrokeCap.round,
      ),),
    );
  }
}
