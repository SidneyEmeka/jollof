import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/chooseportfolio.dart';

import '../utils/stylings.dart';

class Emailverified extends StatelessWidget {
  const Emailverified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,)),
        title: Text("Verify Email",style: Stylings.titles,),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: Colors.grey.shade200)
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex:2,child: SizedBox()),
            Text("Your email have been confirmed",style: Stylings.titles,),
            const SizedBox(height: 10,),
            Text("We have verified your email, we will now notify you on any transaction via the email you have provided",style: Stylings.subTitles,textAlign: TextAlign.center,),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.to(()=> const Chooseportfolio());
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
            const Expanded(flex:2,child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
