import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';

import '../../../utils/stylings.dart';
import 'idimmageprocessing.dart';

class Idimagepreview extends StatelessWidget {
  const Idimagepreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.white,
            )),
        scrolledUnderElevation: 0,
        title: Text(
          "Proof of Identity",
          style: Stylings.titles.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Container(
              width: Get.width,
              height: Get.height*0.55,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(fit: BoxFit.fill,
                    image: Get.find<Jollofx>().file==null?const AssetImage("assets/images/carddflower.png",):FileImage(Get.find<Jollofx>().file!))
              ),
            ),
            const Expanded(flex:3,child: SizedBox()),
            Text("Are your documennts readable and ready to be sent ?",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.white),),
            const SizedBox(height: 10,),
            GestureDetector(
              onTap: (){
                Get.to(()=>const Idimmageprocessing());
              },
              child: Container(
                alignment: Alignment.center,
                width: Get.width,
                height: Get.height*0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Stylings.yellow
                ),
                child: Text("Confirm",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
                onTap: (){
                  Get.back();
                },child: Text("Take Another Photo",style: Stylings.subTitles.copyWith(color: Stylings.yellow),)),
          ],
        ),
      ),
    );
  }
}
