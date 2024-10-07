import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/questionaire/transactiontrack.dart';

import '../homes/Invest/buyplan.dart';
import '../utils/stylings.dart';
import 'jollofbankdetails.dart';

class Paymentonway extends StatelessWidget {
  const Paymentonway({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylings.yellow,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
              width: Get.width*0.45,
              height: Get.width*0.5,
              child: Image.asset("assets/images/pow.png",fit: BoxFit.contain,),
            ),
            Text("Your payment is on its way",style: Stylings.titles,),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.to(()=>const Transactiontrack());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  color: Colors.white
                ),
                child: Text("View Transaction",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                Get.to(()=>const Buyplan());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.black,width: 0.0)
                ),
                child: Text("Back to Home",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
