import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/regemail.dart';

import '../utils/stylings.dart';

class Enterapp extends StatelessWidget {
  const Enterapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //manmap
            SizedBox(
              height: Get.height*0.55,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      height: Get.height*0.35,
                        width: Get.width,
                        child: Image.asset("assets/images/manp.png",fit: BoxFit.contain,))]),
            ),
            //others
            const Expanded(flex:1,child: SizedBox()),
            Text("You invest and Ai trades",style: Stylings.titles,),
            const SizedBox(height: 10,),
            Text("Jollof empowers novices and others to profit from crypto like pros through automated Ai trading algorithms.",textAlign: TextAlign.center,style: Stylings.subTitles),
            const Expanded(flex:1,child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.to(()=>const Regemail());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Stylings.yellow
                ),
                child: Text("Create an account",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
            const SizedBox(height: 20,),
            RichText(
              textAlign: TextAlign.end,
                text: TextSpan(children: [
              TextSpan(text: "Already have an account ? ",style: Stylings.subTitles),
              TextSpan(text: "Log in",style: Stylings.titles.copyWith(fontSize: 12)),
            ])),
            const Expanded(flex:1,child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
