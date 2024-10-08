import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../server/getxserver.dart';
import '../../utils/stylings.dart';

class Buythroughwallet extends StatelessWidget {
  const Buythroughwallet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.black,
            )),
        title: Text(
          "Investment amount",
          style: Stylings.titles,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "Help",
              style: Stylings.titles
                  .copyWith(color: Stylings.yellow, fontSize: 12),
            ),
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Text(
              "Enter amount",
              style: Stylings.titles.copyWith(fontSize: 12),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: Get.width * 0.4,
              child: TextField(
                onChanged: (value) {
                  double val = double.parse(value);
                  Get.find<Jollofx>().addMoneyAmount.value = val;
                },
                textAlign: TextAlign.center,
                style: Stylings.titles.copyWith(fontSize: Get.width * 0.1),
                cursorColor: Colors.grey.shade300,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText:
                        Get.find<Jollofx>().addMoneyCurrency.value == "USDT"
                            ? "\$0.00"
                            : "₦0.00",
                    hintStyle: Stylings.titles.copyWith(
                        fontSize: Get.width * 0.1, color: Colors.grey.shade300),
                    //suffix: Get.find<Jollofx>().addMoneyCurrency.value=="USDT"?Text("USDT",style: Stylings.subTitles,):Text("Naira",style: Stylings.subTitles,),
                    border: InputBorder.none),
              ),
            ),
           const SizedBox(height: 15),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Balance : ",
                  style: Stylings.titles.copyWith(fontSize: 12)),
              Get.find<Jollofx>().addMoneyCurrency.value == "Naira"
                  ? TextSpan(
                      text: "₦${Get.find<Jollofx>().addMoneyAmount.toInt()}",
                      style: Stylings.titles.copyWith(fontSize: 12))
                  : TextSpan(
                      text: "\$${Get.find<Jollofx>().addMoneyAmount.toInt()}",
                      style: Stylings.titles.copyWith(fontSize: 12)),
              TextSpan(
                  text: ".00", style: Stylings.titles.copyWith(fontSize: 8)),
            ])),
            const Expanded(flex:3,child: SizedBox()),
            GestureDetector(
              onTap: (){
                //Get.to(()=>const Paymentmethod());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Continue",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
            const Expanded(flex:3,child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
