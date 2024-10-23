import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../stylings.dart';

class Investmenttile extends StatelessWidget {
  final num invRate;
  final num duration;
  final num amount;
  const Investmenttile({super.key, required this.invRate, required this.duration, required this.amount});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height*0.07,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(child: CircularPercentIndicator(
            radius: Get.height*0.025,percent: invRate/100,
            circularStrokeCap: CircularStrokeCap.round,
            backgroundColor: Colors.grey.shade200,
            center: Text("$invRate%",style: Stylings.titles.copyWith(fontSize: 8),),progressColor: Colors.orange),),
          const SizedBox(width: 15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Get.find<Jollofx>().checkPackage(amount),style: Stylings.titles.copyWith(fontSize: 12),),
              const SizedBox(height: 3),
              Text("$duration months package",style: Stylings.subTitles.copyWith(color: Colors.green,fontSize: 10),),
            ],
          ),
          const Expanded(child: SizedBox()),
          Text("\$${NumberFormat.decimalPattern('en').format(amount)}",style: Stylings.titles.copyWith(fontSize: 12),)
        ],
      ),
    );
  }
}
