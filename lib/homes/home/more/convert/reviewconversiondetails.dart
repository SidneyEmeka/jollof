import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../../server/getxserver.dart';
import '../../../../utils/stylings.dart';
import 'convertsuccesspage.dart';

class Reviewconversiondetails extends StatelessWidget {
  final num from;
  const Reviewconversiondetails({super.key, required this.from});

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
          "Review details",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Get.find<Jollofx>().isLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
           const SizedBox(height: 5,),
            //details
            Container(
              width: Get.width,
              height: Get.height*0.2,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300,width: 0.0),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: Get.width*0.08,
                          height: Get.width*0.08,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: Get.find<Jollofx>().fromCurrency.value=='ngn'?const AssetImage("assets/images/ngflag.png"):const AssetImage("assets/images/usflag.jpeg"),fit: BoxFit.fill)
                          ),
                        ),
                        const SizedBox(width: 12),
                        Get.find<Jollofx>().fromCurrency.value=='ngn'? Text("NGN",style: Stylings.subTitles.copyWith(fontSize: 15),):Text("USD",style: Stylings.subTitles.copyWith(fontSize: 15),),
                        const Expanded(child: SizedBox()),
                        const Icon(Icons.arrow_forward,color: Colors.black,size: 15,),
                        const Expanded(child: SizedBox()),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: Get.width*0.08,
                          height: Get.width*0.08,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: Get.find<Jollofx>().fromCurrency.value=='ngn'?const AssetImage("assets/images/usflag.jpeg"):const AssetImage("assets/images/ngflag.png"),fit: BoxFit.fill)
                          ),
                        ),
                        const SizedBox(width: 12),
                        Get.find<Jollofx>().fromCurrency.value=='ngn'? Text("USD",style: Stylings.subTitles.copyWith(fontSize: 15),):Text("NGN",style: Stylings.subTitles.copyWith(fontSize: 15),),
                      ],
                    ),
                  ),
                  Divider(thickness: 0.0,color: Colors.grey.shade300,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("You're converting",style: Stylings.subTitles),
                            const Expanded(child: SizedBox()),
                            Get.find<Jollofx>().fromCurrency.value=='ngn'?Text("₦${NumberFormat.decimalPattern('en').format(from)}",style: Stylings.titles.copyWith(fontSize: 12),):Text("\$${NumberFormat.decimalPattern('en').format(from)}",style: Stylings.titles.copyWith(fontSize: 12),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("To",style: Stylings.subTitles),
                            const Expanded(child: SizedBox()),
                            Get.find<Jollofx>().fromCurrency.value=='ngn'?Text("\$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().convertedResult.value)}",style: Stylings.titles.copyWith(fontSize: 12),):Text("₦${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().convertedResult.value)}",style: Stylings.titles.copyWith(fontSize: 12),)
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            //fromto
            Container(
              width: Get.width,
              height: Get.height*0.15,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300,width: 0.0),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Source",style: Stylings.subTitles),
                        Get.find<Jollofx>().fromCurrency.value=='ngn'? Text("Naira Account",style: Stylings.titles.copyWith(fontSize: 12),):Text("Dollar Account",style: Stylings.titles.copyWith(fontSize: 12),),
                      ],
                    ),
                  ),
                  Divider(thickness: 0.0,color: Colors.grey.shade300,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Destination",style: Stylings.subTitles),
                        Get.find<Jollofx>().fromCurrency.value=='ngn'? Text("Dollar Account",style: Stylings.titles.copyWith(fontSize: 12),):Text("Naira Account",style: Stylings.titles.copyWith(fontSize: 12),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            //rate
            Container(
              width: Get.width,
              height: Get.height*0.15,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300,width: 0.0),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Exchange rate",style: Stylings.subTitles),
                        Text("\$1 - ₦${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().dollarToNaira!)}",style: Stylings.titles.copyWith(fontSize: 12),)
                      ],
                    ),
                  ),
                  Divider(thickness: 0.0,color: Colors.grey.shade300,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Deposit time",style: Stylings.subTitles),
                        Text("Few seconds",style: Stylings.titles.copyWith(fontSize: 12),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: () {
                Get.find<Jollofx>().isLoading.value=true;
               // print(Get.find<Jollofx>().fromCurrency.value);
                Get.find<Jollofx>().fromCurrency.value=='ngn'? Get.find<Jollofx>().convertWalletPayload = {
                  "amount": from,
                  "sourceAccount": "ngn",
                  "destinationAccount": "usd"
                }:Get.find<Jollofx>().convertWalletPayload ={
                  "amount": from,
                  "sourceAccount": "usd",
                  "destinationAccount": "ngn"
                };
                //print(Get.find<Jollofx>().convertWalletPayload);
                Future.delayed(const Duration(seconds: 1),(){
                  Get.find<Jollofx>().convertIntoWallet();
                });

              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Convert money",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
