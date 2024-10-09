import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/stylings.dart';

class Tipsandtricks extends StatelessWidget {
  const Tipsandtricks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
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
          "Tips and Tricks",
          style: Stylings.titles,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  size: 17,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
    );
  }
}
