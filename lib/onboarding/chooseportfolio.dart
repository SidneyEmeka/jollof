import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/regpin.dart';
import 'package:jollof/onboarding/setavatar.dart';
import 'package:jollof/server/getxserver.dart';

import '../utils/stylings.dart';

class Chooseportfolio extends StatelessWidget {
  const Chooseportfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios,size: 15,color: Colors.black,)),
        title: Text("Welcome",style: Stylings.titles,),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: (){
                Get.to(()=>const Regpin());
              },
            child: Text("Skip",style: Stylings.titles.copyWith(color: Stylings.yellow),),),
          )],
        shape: Border(
          bottom: BorderSide(color: Colors.grey.shade200)
        ),
      ),
      body:Obx(()=> Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(child: SizedBox()),
            Text("Welcome to Jollof",style: Stylings.titles.copyWith(fontSize: 20),),
            const SizedBox(height: 15,),
            Text("Select or create the portfolio you wish to invest in.",style: Stylings.subTitles),
            Padding(padding: const EdgeInsets.only(top:10,right: 30),
                child: Text("Begin your investment adventure with a special collection of Jollof zero risk investment package.Boost your investment power with the help of our Ai, and reach new heights in your money goals",style: Stylings.subTitles)),
            const Expanded(child: SizedBox()),

            GestureDetector(
              onTap: (){
                Get.find<Jollofx>().portfolio.value="Fixed";
              },
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: Get.height*0.05,
                        height: Get.height*0.05,
                        child: Image.asset("assets/images/fxd.png",fit: BoxFit.contain,)),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fixed investment",style: Stylings.titles.copyWith(fontSize: 12),),
                        const SizedBox(height: 2),
                        Text("Up to 100% returns",style: Stylings.titles.copyWith(color: Colors.green,fontSize: 12),),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Get.find<Jollofx>().portfolio.value=="Fixed"?Icon(Icons.radio_button_checked,size: 20,color: Stylings.yellow,):const Icon(Icons.circle_outlined,size: 20,color: Colors.black,)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20,),

            GestureDetector(
              onTap: (){
                Get.find<Jollofx>().portfolio.value="Ai";
              },
              child: Container(
                width: Get.width,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.shade300)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: Get.height*0.05,
                        height: Get.height*0.05,
                        child: Image.asset("assets/images/ai.png",fit: BoxFit.contain,)),
                    const SizedBox(width: 20,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Ai Managed Portfolio",style: Stylings.titles.copyWith(fontSize: 12),),
                        const SizedBox(height: 2),
                        Text("Up to 300% returns",style: Stylings.titles.copyWith(color: Colors.green,fontSize: 12),),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Get.find<Jollofx>().portfolio.value=="Ai"?Icon(Icons.radio_button_checked,size: 20,color: Stylings.yellow,):const Icon(Icons.circle_outlined,size: 20,color: Colors.black,)
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
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
            const SizedBox(height: 20,),
            RichText(
                textAlign: TextAlign.start,
                text: TextSpan(children: [
                  TextSpan(text: "By continuing you agree to our  ",style: Stylings.subTitles),
                  TextSpan(text: "Terms of service ",style: Stylings.subTitles.copyWith(color: Stylings.yellow)),
                  TextSpan(text: "and ",style: Stylings.subTitles),
                  TextSpan(text: "Advisory agreemement",style: Stylings.subTitles.copyWith(color: Stylings.yellow)),
                ])),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),)
    );
  }
}
