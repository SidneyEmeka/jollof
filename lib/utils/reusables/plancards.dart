import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/utils/stylings.dart';

class Plancards extends StatelessWidget {
  const Plancards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      width: Get.width*0.78,
      height: Get.height*0.22,
      decoration: BoxDecoration(
        color: Stylings.yellow,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Standard plan",style: Stylings.titles.copyWith(fontSize: 10),),
              RichText(text: TextSpan(children: [
                TextSpan(text: "\$299",style: Stylings.titles),
                TextSpan(text: ".00",style: Stylings.titles.copyWith(fontSize: 10)),
              ]))
            ],
          ),
          Text("Earn 10% profit for 3 months, 25% for 6 months or 55% profit for 12 months. Trades only Bitcoin and Etherum",style: Stylings.subTitles,),
          Align(
            alignment: Alignment.bottomRight,
              child: Text("Jollof",style: Stylings.titles,)),
        ],
      ),
    );
  }
}
