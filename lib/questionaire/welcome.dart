import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/stylings.dart';
import 'addmoney.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

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
          "Welcome",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              width: Get.width*0.7,
              height: Get.height*0.3,
              child: Image.asset("assets/images/welc.png",fit: BoxFit.contain,),
            ),
            const Expanded(child: SizedBox()),
            Text("Welcome to Jollof",style: Stylings.titles,),
            const SizedBox(height: 15,),
            Text("What do you want to do with Jollof",style: Stylings.subTitles,),
            const Expanded(child: SizedBox()),

            Container(
              width: Get.width,
              height: Get.height*0.3,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade100)
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
                        const Icon(Icons.list_alt_outlined,size: 20,color: Colors.black,),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Build my portfolio",style: Stylings.titles.copyWith(fontSize: 11),),
                           // SizedBox(height: 5,),
                            Text("Let Ai trade for you while you sleep",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                      ],
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade100,thickness: 1,)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.wallet_travel,size: 20,color: Colors.black,),
                       const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Invest in mutual fund",style: Stylings.titles.copyWith(fontSize: 11),),
                            // SizedBox(height: 5,),
                            Text("Earn upto 55% fixed return",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                      ],
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade100,thickness: 1,)),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Get.to(()=>const Addmoney());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(Icons.credit_card_outlined,size: 20,color: Colors.black,),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Fund my wallet",style: Stylings.titles.copyWith(fontSize: 11),),
                              // SizedBox(height: 5,),
                              Text("Add some money into your wallet",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400),),
                            ],
                          ),
                          const Expanded(flex:2,child: SizedBox()),
                          Icon(Icons.arrow_forward_ios,color: Colors.grey.shade400,size: 15,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
              //  Get.to(()=>const Regemail());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Skip",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
