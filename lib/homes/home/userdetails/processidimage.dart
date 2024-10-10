import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/stylings.dart';

class Processidimage extends StatelessWidget {
  const Processidimage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.black,
            )),
        scrolledUnderElevation: 0,
        title: Text(
          "Proof of Identity",
          style: Stylings.titles,
        ),
        centerTitle: true,
      ),
    );
  }
}
