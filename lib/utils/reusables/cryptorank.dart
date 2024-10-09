import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../stylings.dart';

class Cryptorank extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String slug;
  final num percent;
  final num price;
  final bool isLast;
  const Cryptorank({super.key, required this.imgUrl, required this.percent, required this.price, required this.name, required this.slug, this.isLast=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.1,
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
          border:isLast==false? Border(
              bottom: BorderSide(
                  color: Colors.grey.shade200, width: 0.0)):Border.all(color: Colors.transparent)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 35,
              height:35,child: Image.asset(imgUrl,fit: BoxFit.contain,)),
          SizedBox(width:15,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Stylings.titles
                    .copyWith(fontSize: 12),
              ),
              SizedBox(height: 3,),
              Text(
                slug,
                style: Stylings.subTitles.copyWith(color: Colors.grey.shade400,fontSize: 11),
              ),
            ],
          ),
          Expanded(child: SizedBox()),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: Stylings.titles
                    .copyWith(fontSize: 12),
              ),
              SizedBox(height: 3,),
              percent.toString().contains("-")?Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_drop_down_outlined,size: 15,color: Colors.red,),
                  Text(
                    percent.toStringAsFixed(2),
                    style: Stylings.subTitles.copyWith(color: Colors.red,fontSize: 11),
                  ),
                ],
              ):
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_drop_up,size: 15,color: Colors.green,),
                  Text(
                    percent.toStringAsFixed(2),
                    style: Stylings.subTitles.copyWith(color: Colors.green,fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
