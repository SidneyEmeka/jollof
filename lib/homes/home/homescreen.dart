import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../server/getxserver.dart';
import '../../utils/reusables/balancecards.dart';
import '../../utils/stylings.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
            padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              shape: BoxShape.circle,),
            child: Image.asset(Jollofx.avatars[Get.find<Jollofx>().avatarIndex.value],fit: BoxFit.contain,)
        ),
        title: Text(
          "Hello",
          style: Stylings.titles,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.card_giftcard_outlined,size: 17,color: Colors.black,),
                SizedBox(width: 10),
                Icon(Icons.notifications_none_outlined,size: 17,color: Colors.black,)
              ],
            ),
          ),
        ],
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Balancecards(thecolor: Stylings.yellow,),
                  SizedBox(width: 15,),
                  Balancecards(thecolor: Colors.green,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
