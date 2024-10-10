import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/stylings.dart';

class Idimmageprocessing extends StatelessWidget {
  const Idimmageprocessing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylings.yellow,
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width*0.3,
              height: Get.width*0.3,
              child: Image.asset("assets/images/ai.png",fit: BoxFit.fill,),
            ),
          ],
        ),
      ),
    );
  }
}
