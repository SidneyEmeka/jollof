import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../server/getxserver.dart';
import '../../utils/stylings.dart';
import 'chooseduration.dart';

class Buythroughwallet extends StatefulWidget {
   const Buythroughwallet({super.key});

  @override
  State<Buythroughwallet> createState() => _BuythroughwalletState();
}

class _BuythroughwalletState extends State<Buythroughwallet> {
  final _invAmount = TextEditingController();


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
      body: Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex:2,child: SizedBox()),
            Text(
              "Enter amount",
              style: Stylings.titles.copyWith(fontSize: 20),
            ),
            Text("Plan Start price : \$${Get.find<Jollofx>().plans[Get.find<Jollofx>().currentPlanPage.value]["amount"]}",style: Stylings.titles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Expanded(child: SizedBox()),
                Text("\$",style:Stylings.titles.copyWith(
                    fontSize: Get.width * 0.1, color: Colors.grey.shade300),),
                Expanded(
                  child: TextField(
                    controller: _invAmount,
                    textAlign: TextAlign.start,
                    style: Stylings.titles.copyWith(fontSize: Get.width * 0.1),
                    cursorColor: Colors.grey.shade300,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText:"00.00",
                        hintStyle: Stylings.titles.copyWith(
                            fontSize: Get.width * 0.1, color: Colors.grey.shade300),
                        border: InputBorder.none),
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 20),
            Text("Balance : \$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().usdBalance)}",style: Stylings.titles.copyWith(fontSize: 10),),
            const SizedBox(height: 30),
            Get.find<Jollofx>().errorText.value==""?const SizedBox(): Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,size: 11,color: Colors.red,),
                const SizedBox(width: 5),
                Text(Get.find<Jollofx>().errorText.value,style: Stylings.subTitles.copyWith(color: Colors.red),),
              ],
            ),
            const Expanded(flex:3,child: SizedBox()),
            GestureDetector(
              onTap: (){
                num val = num.parse(_invAmount.text);
                Get.find<Jollofx>().investmentAmount = val;
                Get.find<Jollofx>().checkIfInvestmentAmountCovers(Get.find<Jollofx>().plans[Get.find<Jollofx>().currentPlanPage.value]["amount"]!);
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

          ],
        ),
      ),)
    );
  }
}
