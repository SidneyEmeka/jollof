import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/stylings.dart';

class Reviewconversiondetails extends StatelessWidget {
  const Reviewconversiondetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "Review details",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
    );
  }
}
