import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../server/getxserver.dart';
import '../utils/stylings.dart';

class Explainer extends StatelessWidget {
  const Explainer({super.key});

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
          "Explainer",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body:Obx(()=> Container(
        width: Get.width,
        height: Get.height,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width*0.22,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Get.find<Jollofx>().explainer.value==1?Stylings.yellow:Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
                Container(
                  width: Get.width*0.22,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Get.find<Jollofx>().explainer.value==2?Stylings.yellow:Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
                Container(
                  width: Get.width*0.22,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Get.find<Jollofx>().explainer.value==3?Stylings.yellow:Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
                Container(
                  width: Get.width*0.22,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Get.find<Jollofx>().explainer.value==4?Stylings.yellow:Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
              ],
            ),
            const Expanded(flex:3,child: SizedBox()),
            Get.find<Jollofx>().explainer.value==1?
            //1
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height*0.25,
                    child: Image.asset("assets/images/e1.png",fit: BoxFit.contain,),
                  ),
                  SizedBox(height: Get.height*0.1,),
                  Text(textAlign: TextAlign.center,"Jollof Helps novice and others invest and profit from crypto like a pro using automated AI trading Algorithms.",
                    style: Stylings.subTitles,),
                ],
              ),
            )
            :Get.find<Jollofx>().explainer.value==2?
            //2
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height*0.25,
                    child: Image.asset("assets/images/e2.png",fit: BoxFit.contain,),
                  ),
                  SizedBox(height: Get.height*0.1,),
                  Text(textAlign: TextAlign.center,"Jollof's AI Trading BOT automatically trades cryptocurrencies based on smart contracts.",
                    style: Stylings.subTitles,),
                ],
              ),
            )
                :Get.find<Jollofx>().explainer.value==3?
            //3
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height*0.25,
                    child: Image.asset("assets/images/e3.png",fit: BoxFit.contain,),
                  ),
                  SizedBox(height: Get.height*0.1,),
                  Text(textAlign: TextAlign.center,"You receive a fixed monthly return on their investment, regardless of market fluctuations.",
                    style: Stylings.subTitles,),
                ],
              ),
            ):
            //4
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height*0.25,
                    child: Image.asset("assets/images/e4.png",fit: BoxFit.contain,),
                  ),
                  SizedBox(height: Get.height*0.1,),
                  Text(textAlign: TextAlign.center,"Jollof uses AI to analyze market trends and build a diversified portfolio of promising cryptocurrencies.",
                    style: Stylings.subTitles,),
                ],
              ),
            ),

            const Expanded(flex:2,child: SizedBox()),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.find<Jollofx>().nextExplainer();
                  print(Get.find<Jollofx>().explainer.value);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Stylings.yellow),
                  child: const Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),)
    );
  }
}
