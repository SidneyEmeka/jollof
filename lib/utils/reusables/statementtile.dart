import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jollof/utils/reusables/bnavmorph.dart';
import 'package:jollof/utils/reusables/layoutcalc.dart';
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
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(image: AssetImage("assets/images/carddflower.png"),fit: BoxFit.fill)
      ),
      width: Get.width,
      //height: Get.height*0.15,
      child: Bnavmorph(
        blur: 5,
        opacity: 0.2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 13),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Get.find<Jollofx>().dateFormat(statTime),style: Stylings.titles.copyWith(fontSize: 12)),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("from",style: Stylings.titles.copyWith(fontSize: 12),),
                    const SizedBox(height: 2),
                    Container(
                      width: Get.width*0.08,
                      height: Get.width*0.08,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: statSourceAcc=='ngn'?const AssetImage("assets/images/ngflag.png"):const AssetImage("assets/images/usflag.jpeg"),fit: BoxFit.fill)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    statSourceAcc=='ngn'?Text("₦${NumberFormat.decimalPattern('en').format(statSourceSent)}",style: Stylings.titles.copyWith(fontSize: 12),):Text("\$${NumberFormat.decimalPattern('en').format(statSourceSent)}",style: Stylings.titles.copyWith(fontSize: 12),)
                  ],
                ),
                //const Expanded(child: SizedBox()),
               // const Icon(Icons.loop,color: Colors.black,size: 15,),
                //const Expanded(child: SizedBox()),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(alignment:Alignment.center,child: Text("to",style: Stylings.titles.copyWith(fontSize: 12),)),
                    const SizedBox(height: 2),
                    Container(
                      width: Get.width*0.08,
                      height: Get.width*0.08,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: statDestinationAcc=='ngn'?const AssetImage("assets/images/ngflag.png"):const AssetImage("assets/images/usflag.jpeg"),fit: BoxFit.fill)
                      ),
                    ),
                    const SizedBox(height: 5,),
                    statDestinationAcc=='ngn'?Text("₦${NumberFormat.decimalPattern('en').format(statDestinationReceived)}",style: Stylings.titles.copyWith(fontSize: 12),):Text("\$${NumberFormat.decimalPattern('en').format(statDestinationReceived)}",style: Stylings.titles.copyWith(fontSize: 12),)
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
              Text("Transaction ID - $statId",style: Stylings.titles.copyWith(fontSize: 12).copyWith(fontSize: 10),),
            ],
          ),
        ),
      ),
    );
  }
}
