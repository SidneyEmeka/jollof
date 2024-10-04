import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/reusables/bnavmorph.dart';
import '../utils/stylings.dart';

class Setnotification extends StatelessWidget {
  const Setnotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("Set your avatar",style: Stylings.titles,),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: Colors.grey.shade200)
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment:Alignment.centerLeft,child: Text("Stay  up-to-date with the latest updates on your investment anytime",style: Stylings.subTitles,)),
            const Expanded(child: SizedBox()),
            SizedBox(
              height: Get.width*0.5,
              width: Get.width*0.5,
              child: Image.asset("assets/images/bell.png",fit: BoxFit.cover,),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
               Get.dialog(Center(
                 child: Bnavmorph(
                   blur: 20,
                   opacity: 0.15,
                   child: Container(
                     height: Get.height*0.25,
                     width: Get.width*0.75,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text("'Jollof' Would Like to Send You Notifications",style: Stylings.titles.copyWith(color: Colors.white),)
                       ],
                     ),
                   ),
                 ),
               ));
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
              Get.to(()=>const Setnotification());
            },child: Text("Skip for now",style: Stylings.titles.copyWith(fontSize: 13),)),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
