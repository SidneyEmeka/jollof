import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/questionaire/questions.dart';

import '../utils/reusables/bnavmorph.dart';
import '../utils/stylings.dart';

class Setnotification extends StatelessWidget {
  const Setnotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,size: 15,color: Colors.black,)),
        title: Text("Set Notifications",style: Stylings.titles,),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: Colors.grey.shade200)
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment:Alignment.centerLeft,child: Text("Stay  up-to-date with the latest updates on your investment anytime",style: Stylings.subTitles,)),
            const Expanded(flex:2,child: SizedBox()),
            SizedBox(
              height: Get.width*0.5,
              width: Get.width*0.5,
              child: Image.asset("assets/images/bell.png",fit: BoxFit.cover,),
            ),
            const Expanded(flex:2,child: SizedBox()),
            GestureDetector(
              onTap: (){
               Get.dialog(
                   BackdropFilter(
                     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                     child: Dialog(
                       backgroundColor: Colors.transparent,
                       child: Container(
                         width: Get.width*0.7,
                         padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                         decoration: BoxDecoration(
                           color: Colors.black.withOpacity(0.5),
                           borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: Colors.white.withOpacity(0.2)),
                         ),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           mainAxisAlignment: MainAxisAlignment.center,
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             Text("\"Jollof\" Would like to Send You Notifications",style: Stylings.titles.copyWith(color: Colors.white),textAlign: TextAlign.center,),
                             const SizedBox(height: 10,),
                             Text("Notifications may include alerts, sounds and icon badges. These can be configured in Settings",style: Stylings.subTitles.copyWith(color: Colors.white),textAlign: TextAlign.center,),
                             const SizedBox(height: 15,),
                           const Divider(height: 0.5,color: Colors.black12,),
                             const SizedBox(height: 15,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Text("Don't Allow",style: Stylings.subTitles.copyWith(color: Colors.blueAccent),textAlign: TextAlign.center,),
                               Text("Allow",style: Stylings.subTitles.copyWith(color: Colors.blueAccent),textAlign: TextAlign.center,),
                             ],
                           )
                           ],
                         ),
                       ),
                     ),
                   ),
                 barrierColor: Colors.black.withOpacity(0.5),
                 transitionCurve: Curves.easeInOut,
                 transitionDuration: const Duration(milliseconds: 300),);
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Allow Notification",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(onTap:(){
              Get.to(()=>const Questions());
            },child: Text("Skip for now",style: Stylings.titles.copyWith(fontSize: 13),)),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
