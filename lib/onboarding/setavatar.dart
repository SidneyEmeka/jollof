import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/setnotification.dart';
import 'package:jollof/server/getxserver.dart';

import '../utils/stylings.dart';

class Setavatar extends StatelessWidget {
  const Setavatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,size: 15,color: Colors.black,)),
        title: Text("Set your avatar",style: Stylings.titles,),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: Colors.grey.shade200)
        ),
      ),
      body: Obx(()=>Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,child: Text("Select an avatar for your profile to personalize",style: Stylings.subTitles,)),
            const Expanded(child: SizedBox()),
            Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: Get.width*0.05,
              runSpacing: Get.width*0.08,
              children: [
                ...Jollofx.avatars.map((av){
                  final index = Jollofx.avatars.indexOf(av);
                  return GestureDetector(
                    onTap: (){
                      Get.find<Jollofx>().avatarIndex.value = index;
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: Get.width*0.18,
                      height: Get.width*0.18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:  Get.find<Jollofx>().avatarIndex.value==index?Border.all(color: Stylings.yellow,width: 3):Border.all(color: Colors.black26),
                          image: DecorationImage(image: AssetImage(av),fit: BoxFit.contain)
                      ),
                    ),
                  );
                })
              ],
            ),
            const Expanded(flex:2,child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.to(());
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
            const SizedBox(height: 20),
            GestureDetector(onTap:(){
              Get.to(()=>const Setnotification());
            },child: Text("Skip for now",style: Stylings.titles.copyWith(fontSize: 13),)),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),)
    );
  }
}
