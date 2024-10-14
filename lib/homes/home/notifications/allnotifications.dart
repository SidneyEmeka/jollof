import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/stylings.dart';


class Allnotifications extends StatelessWidget {
  const Allnotifications({super.key});

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
        scrolledUnderElevation: 0,
        title: Text(
          "Notifications",
          style: Stylings.titles,
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 17,
              color: Colors.black,
            ),
          ),
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
    );
  }
}
