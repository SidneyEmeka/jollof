import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jollof/homepage.dart';
import 'package:jollof/homes/home/more/convert/convertwallet.dart';

import '../../../../utils/stylings.dart';

class Convertsuccesspage extends StatelessWidget {
  final dynamic from;
  final dynamic transferredAmount;
  final dynamic destinationAccount;
  const Convertsuccesspage({super.key, required this.from, required this.transferredAmount, required this.destinationAccount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex:2,child: SizedBox()),
            Container(
              width: Get.width*0.3,
              height: Get.width*0.3,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage("assets/images/flog.png"),fit: BoxFit.cover)
              ),
            ),
            RichText(textAlign: TextAlign.center,text: TextSpan(children: [
              TextSpan(text: "Your conversion from",style: Stylings.subTitles),
            destinationAccount=='ngn'?TextSpan(text: " \$${NumberFormat.decimalPattern('en').format(from)}",style: Stylings.titles.copyWith(fontSize: 12)):TextSpan(text: " ₦${NumberFormat.decimalPattern('en').format(from)}",style: Stylings.titles.copyWith(fontSize: 12)),
              TextSpan(text: " to",style: Stylings.subTitles),
            destinationAccount=='ngn'?TextSpan(text: " ₦${NumberFormat.decimalPattern('en').format(transferredAmount)}",style: Stylings.titles.copyWith(fontSize: 12)):TextSpan(text: " \$${NumberFormat.decimalPattern('en').format(transferredAmount)}",style: Stylings.titles.copyWith(fontSize: 12)),
            destinationAccount=='ngn'?  TextSpan(text: " has been sent to your Naira wallet",style: Stylings.subTitles): TextSpan(text: " has been sent to your Dollar wallet",style: Stylings.subTitles),
            ])),
            const Expanded(flex:2,child: SizedBox()),
            GestureDetector(
              onTap: () {
                Get.to(()=>const Homepage());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Done",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
