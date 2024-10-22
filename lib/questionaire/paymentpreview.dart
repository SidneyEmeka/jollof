import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:jollof/questionaire/paymentmethod.dart';

import '../server/getxserver.dart';
import '../utils/stylings.dart';
import 'jollofbankdetails.dart';

class Paymentpreview extends StatelessWidget {
  const Paymentpreview({super.key});

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
            "Add money",
            style: Stylings.titles,
          ),
          centerTitle: true,
          shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        body: Obx(()=>Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
          width: Get.width,
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Your money is safe",style: Stylings.titles.copyWith(fontSize: 12),),
                  Text("Schedule",style: Stylings.titles.copyWith(fontSize: 12,color: Stylings.yellow),),
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                width: Get.width,
                height: Get.height*0.15,
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade200)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(FluentIcons.wallet_credit_card_16_regular,size: 20,color: Colors.blueAccent,),
                          const Expanded(child: SizedBox()),
                          Text(Get.find<Jollofx>().addMoneyCurrency.toString(),style: Stylings.titles.copyWith(fontSize: 12),),

                        ],
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade200,thickness: 1,)),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("You are depositing",style: Stylings.titles.copyWith(fontSize: 11,color: Colors.grey.shade400),),
                          // SizedBox(height: 5,),
                          Get.find<Jollofx>().addMoneyCurrency.value=='Dollar'?Text("${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().addMoneyAmount)} USD",style: Stylings.titles,):Text("₦${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().addMoneyAmount)}",style: Stylings.titles,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: (){
                  Get.off(()=>const Paymentmethod());
                },
                child: Container(
                  height: Get.height*0.055,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Stylings.yellow
                  ),
                  child: Text("Transfer Funds",style: Stylings.titles.copyWith(fontSize: 12),),
                ),
              ),
            ],
          ),
        ),)
    );
  }
}
