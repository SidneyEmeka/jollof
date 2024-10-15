import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/questionaire/paymentpreview.dart';

import '../server/getxserver.dart';
import '../utils/stylings.dart';

class Paymentmethod extends StatelessWidget {
  const Paymentmethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Payment method",
          style: Stylings.titles,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text("Skip",style: Stylings.titles.copyWith(color: Stylings.yellow),),
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Get.find<Jollofx>().isLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
            Text("Select how you would fund your wallet",style: Stylings.titles,),
            const SizedBox(height: 15),
            Text("Experience the future of crypto investing with Jollof by funding your wallet and activating our AI-Managed Portfolio feature. Our advanced algorithms ensure smart decision-making, risk management, and 24/7 monitoring, allowing you to effortlessly optimise your crypto portfolio for maximum returns.",
              style: Stylings.subTitles,),
            const Expanded(child: SizedBox()),
            //methods
            Container(
              width: Get.width,
              height: Get.height*0.32,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //apple
                  //apple
                  // Container(
                  //   width: Get.width,
                  //   height: Get.height*0.1,
                  //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  //   decoration: BoxDecoration(
                  //       border: Border(
                  //           bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                  //       )
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       const Icon(Icons.apple_sharp,size: 20,color: Colors.black,),
                  //       const SizedBox(width: 15),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text("Apple pay",style: Stylings.titles.copyWith(fontSize: 12),),
                  //           const SizedBox(height: 5),
                  //           Text("Pay with Apple pay",style: Stylings.titles.copyWith(fontSize: 10,
                  //               color: Colors.grey.shade400),),
                  //         ],
                  //       ),
                  //       const Expanded(flex:2,child: SizedBox()),
                  //       Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                  //     ],
                  //   ),
                  // ),
                  //paypal
                  //paypal
                  Container(
                    width: Get.width,
                    height: Get.height*0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.paypal_outlined,size: 20,color: Colors.blueAccent,),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("PayPal",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 5),
                            Text("Pay with PayPal",style: Stylings.titles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                      ],
                    ),
                  ),
                  //bank
                  GestureDetector(
                    onTap: (){
                 //print(Get.find<Jollofx>().addMoneyAmount);
                 //print(Get.find<Jollofx>().theCurrency);
                 Get.find<Jollofx>().isLoading.value=true;
                 Get.find<Jollofx>().initiatePaymentMethod();
                    },
                    child: Container(
                      width: Get.width,
                      height: Get.height*0.1,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.apartment_rounded,size: 20,color: Colors.black,),
                          const SizedBox(width: 15),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Deposit ${Get.find<Jollofx>().addMoneyCurrency}",style: Stylings.titles.copyWith(fontSize: 12),),
                              const SizedBox(height: 5),
                              Text("Funds will arrive within an hour",style: Stylings.titles.copyWith(fontSize: 10,
                                  color: Colors.grey.shade400),),
                            ],
                          ),
                          const Expanded(flex:2,child: SizedBox()),
                          Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                        ],
                      ),
                    ),
                  ),
                  //card
                  //Card
                  // Container(
                  //   width: Get.width,
                  //   height: Get.height*0.1,
                  //   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                  //   decoration: BoxDecoration(
                  //       border: Border(
                  //           bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                  //       )
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       const Icon(Icons.credit_card_outlined,size: 20,color: Colors.black,),
                  //       const SizedBox(width: 15),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text("Debit Card",style: Stylings.titles.copyWith(fontSize: 12),),
                  //           const SizedBox(height: 5),
                  //           Text("Pay with your debit card",style: Stylings.titles.copyWith(fontSize: 10,
                  //               color: Colors.grey.shade400),),
                  //         ],
                  //       ),
                  //       const Expanded(flex:2,child: SizedBox()),
                  //       Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                  //     ],
                  //   ),
                  // ),
                  //apple
                  Container(
                    width: Get.width,
                    height: Get.height*0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.currency_bitcoin,size: 20,color: Stylings.yellow,),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Deposit Crypto",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 5),
                            Text("Fund wallet with crypto currency",style: Stylings.titles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            //toggle
            SwitchListTile(
                value: Get.find<Jollofx>().savePaymentMethod.value, 
                onChanged: (v){Get.find<Jollofx>().savePaymentMethod.value = v;},
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
              side: BorderSide(color: Colors.grey.shade100)
            ),
              activeTrackColor: Colors.green,
              trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                return Colors.transparent; // Use the default color.
              }),
              inactiveTrackColor: Colors.grey.shade300,
              inactiveThumbColor: Colors.white,
              thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                return Colors.white; // Use the default color.
              }),
              title: Text("Default this for future deposit",style: Stylings.subTitles,),
           ),
            const Expanded(flex:2,child: SizedBox()),
          ],
        ),
      ),)
    );
  }
}
