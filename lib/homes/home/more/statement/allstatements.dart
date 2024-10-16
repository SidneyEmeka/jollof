import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/utils/reusables/statementtile.dart';

import '../../../../server/getxserver.dart';
import '../../../../utils/stylings.dart';
import '../../notifications/allnotifications.dart';

class Allstatements extends StatelessWidget {
  const Allstatements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              Get.find<Jollofx>().validatedUserAvatar.value,
              fit: BoxFit.contain,
            )),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.card_giftcard_outlined,
              //   size: 17,
              //   color: Colors.black,
              // ),
              const SizedBox(width: 10),
              IconButton(alignment: Alignment.centerRight,onPressed: (){
                Get.find<Jollofx>().isLoading.value=true;
                Get.to(()=>const Allnotifications());
              }, icon: const Icon(
                Icons.notifications_none_outlined,
                size: 19,
                color: Colors.black,
              ))
            ],
          ),
        ],
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Align(alignment: Alignment.center,child: Text("${Get.find<Jollofx>().dateFormat(Get.find<Jollofx>().fromDate.value)} - ${Get.find<Jollofx>().dateFormat(Get.find<Jollofx>().toDate.value)}",style: Stylings.subTitles,)),
            const SizedBox(height: 10,),
            ...Get.find<Jollofx>().allStatements.reversed.map((aStat){
              final statId = aStat["_id"];
              final statSourceAcc = aStat["sourceAccount"];
              final statDestinationAcc = aStat["destinationAccount"];
              final statDestinationReceived = aStat["transferredAmount"];
              final statSourceSent = aStat["requestedAmount"];
              final statTime = aStat["createdAt"];
              return Statementtile(statId: statId, statSourceAcc: statSourceAcc, statDestinationAcc: statDestinationAcc, statDestinationReceived: statDestinationReceived, statSourceSent: statSourceSent, statTime: statTime);
      })
          ],
        ),
      ),
    );
  }
}
