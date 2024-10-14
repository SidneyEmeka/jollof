import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';

import '../stylings.dart';

class Balancecards extends StatelessWidget {
  final Color thecolor;
  final String type;
  final String currency;
  final num balance;
  const Balancecards({super.key, required this.thecolor, required this.type, required this.balance, required this.currency});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 25),
        width: Get.width*0.85,
        height: Get.height*0.25,
        decoration: BoxDecoration(
          color:thecolor,
          borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(image: AssetImage("assets/images/carddflower.png"),fit: BoxFit.cover,opacity: 0.3,)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //line 1
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$type balance",style: Stylings.titles,),
                const SizedBox(width: 8),
                GestureDetector(
                    onTap: (){
                      Get.find<Jollofx>().obscure.value?Get.find<Jollofx>().obscure.value=false: Get.find<Jollofx>().obscure.value=true;
                    },child: Get.find<Jollofx>().obscure.value==false?const Icon(FluentIcons.eye_48_regular,color: Colors.black,size: 15,):const Icon(FluentIcons.eye_off_32_regular,color: Colors.black,size: 15,)),
                const Expanded(child: SizedBox()),
                Text("Card Details",style: Stylings.titles.copyWith(fontSize: 10),),
              ],
            ),
            const SizedBox(height: 10),
            //balance
            Get.find<Jollofx>().obscure.value==false? RichText(text: TextSpan(
              children: [
                TextSpan(text:currency,style: Stylings.titles.copyWith(fontSize: 20)),
                TextSpan(text:"$balance",style: Stylings.titles.copyWith(fontSize: 20)),
                TextSpan(text:".00",style: Stylings.titles.copyWith(fontSize: 10)),
              ]
            )):Text("*******",style: Stylings.titles,),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(FluentIcons.list_28_regular,color: Colors.black,size: 15,),
                const SizedBox(width: 5),
                Text("Manage",style: Stylings.titles.copyWith(fontSize: 10),),
                const Expanded(child: SizedBox()),
                Text("Jollof",style: Stylings.titles.copyWith(fontSize: 20),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
