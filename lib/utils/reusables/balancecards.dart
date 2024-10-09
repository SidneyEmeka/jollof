import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';

import '../stylings.dart';

class Balancecards extends StatelessWidget {
  final Color thecolor;
  const Balancecards({super.key, required this.thecolor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22,vertical: 25),
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
              Text("Cash balance",style: Stylings.titles,),
              SizedBox(width: 8),
              Icon(FluentIcons.eye_48_regular,color: Colors.black,size: 15,),
              Expanded(child: SizedBox()),
              Text("Card Details",style: Stylings.titles.copyWith(fontSize: 10),),
            ],
          ),
          SizedBox(height: 10),
          //balance
          RichText(text: TextSpan(
            children: [
              TextSpan(text:"\$${Get.find<Jollofx>().addMoneyAmount.toInt()}",style: Stylings.titles.copyWith(fontSize: 20)),
              TextSpan(text:".00",style: Stylings.titles.copyWith(fontSize: 10)),
            ]
          )),
          Expanded(child: SizedBox()),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FluentIcons.list_28_regular,color: Colors.black,size: 15,),
              SizedBox(width: 5),
              Text("Manage",style: Stylings.titles.copyWith(fontSize: 10),),
              Expanded(child: SizedBox()),
              Text("Jollof",style: Stylings.titles.copyWith(fontSize: 20),),
            ],
          ),
        ],
      ),
    );
  }
}
