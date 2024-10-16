import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jollof/utils/stylings.dart';

import '../../server/getxserver.dart';

class Statementtile extends StatelessWidget {
  final String statId;
  final String statSourceAcc;
  final String statDestinationAcc;
  final num statDestinationReceived;
  final num statSourceSent;
  final String statTime;
  const Statementtile({super.key, required this.statId, required this.statSourceAcc, required this.statDestinationAcc, required this.statDestinationReceived, required this.statSourceSent, required this.statTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 13),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade400,
      ),
      width: Get.width,
      height: Get.height*0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(Get.find<Jollofx>().dateFormat(statTime),style: Stylings.subTitles),
          const Expanded(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width*0.08,
                  height: Get.width*0.08,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: statSourceAcc=='ngn'?const AssetImage("assets/images/ngflag.png"):const AssetImage("assets/images/usflag.jpeg"),fit: BoxFit.fill)
                  ),
                ),
                const SizedBox(height: 5,),
                statSourceAcc=='ngn'?Text("₦${NumberFormat.decimalPattern('en').format(statSourceSent)}",style: Stylings.subTitles,):Text("\$${NumberFormat.decimalPattern('en').format(statSourceSent)}",style: Stylings.subTitles,)
              ],
            ),
            const Expanded(child: SizedBox()),
            const Icon(Icons.arrow_forward,color: Colors.black,size: 15,),
            const Expanded(child: SizedBox()),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: Get.width*0.08,
                  height: Get.width*0.08,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: statDestinationAcc=='ngn'?const AssetImage("assets/images/ngflag.png"):const AssetImage("assets/images/usflag.jpeg"),fit: BoxFit.fill)
                  ),
                ),
                const SizedBox(height: 5,),
                statDestinationAcc=='ngn'?Text("₦${NumberFormat.decimalPattern('en').format(statDestinationReceived)}",style: Stylings.subTitles,):Text("\$${NumberFormat.decimalPattern('en').format(statDestinationReceived)}",style: Stylings.subTitles,)
              ],
            ),
          ],
        ),
         const Expanded(child: SizedBox()),
          Text("ID - $statId",style: Stylings.subTitles.copyWith(fontSize: 10),),
        ],
      ),
    );
  }
}
