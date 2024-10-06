import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/stylings.dart';

class Paymentmethod extends StatelessWidget {
  const Paymentmethod({super.key});

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
          "Payment method",
          style: Stylings.titles,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text("Skip",style: Stylings.titles.copyWith(color: Stylings.yellow),),
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
      ),
    );
  }
}
