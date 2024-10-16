import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jollof/server/getxserver.dart';

import '../../utils/stylings.dart';
import 'buythroughwallet.dart';

class Buyplanthrough extends StatelessWidget {
  const Buyplanthrough({super.key});

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
          "Select how to pay",
          style: Stylings.titles,
        ),
        centerTitle: true,
        actions: [Padding(padding: const EdgeInsets.only(right: 10),child: Text("Help",style: Stylings.titles.copyWith(color: Stylings.yellow,fontSize: 12),),)],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Get.width*0.25,
              height: Get.width*0.25,
              child: Image.asset("assets/images/mbag.png",fit: BoxFit.contain,),
            ),
            SizedBox(height: Get.height*0.05,),
            Text("I want to pay from",style: Stylings.titles),
            SizedBox(height: Get.height*0.01,),
            Text("Please select how you would wish to fund your investment. You can chose from your USD wallet or from an external wallet."
              ,style: Stylings.subTitles, textAlign: TextAlign.center,),
          ],),
        ),
            const Expanded(child: SizedBox()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: Get.width,
              height: Get.height*0.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  //border: Border.all(color: Colors.grey.shade200),
                color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //wallet
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Buythroughwallet());
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.card_travel_sharp,color: Colors.black,size: 15,),
                          const SizedBox(width: 15,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Wallet",style: Stylings.titles.copyWith(fontSize:12),),
                              Text("Your USD balance is",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                            ],
                          ),
                          const Expanded(child: SizedBox()),
                         Text("\$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().usdBalance)}",style: Stylings.titles,),
                          const SizedBox(width: 8),
                          Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                        ],
                      ),
                    ),
                  ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.add_card,color: Colors.black,size: 15,),
                        const SizedBox(width: 15,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("USDT",style: Stylings.titles.copyWith(fontSize:12),),
                            Text("Fund from an external wallet",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        const SizedBox(width: 8),
                        Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                      ],
                    ),
                  ),

                ],
              ),
            ),]
        ),
      ),
    );
  }
}
