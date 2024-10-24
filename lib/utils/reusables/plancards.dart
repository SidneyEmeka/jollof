import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/utils/stylings.dart';

class Plancards extends StatelessWidget {
  final String name;
  final String price;
  final String desc;
  const Plancards({super.key, required this.name, required this.price, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      width: Get.width*0.80,
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
              Text(name,style: Stylings.titles.copyWith(fontSize: 10),),
              RichText(text: TextSpan(children: [
                TextSpan(text: "\$$price",style: Stylings.titles),
                TextSpan(text: ".00",style: Stylings.titles.copyWith(fontSize: 10)),
              ]))
            ],
          ),
          Text(desc,style: Stylings.subTitles,),
          Align(
            alignment: Alignment.bottomRight,
              child: Text("Jollof",style: Stylings.titles,)),
        ],
      ),
    );
  }
}
