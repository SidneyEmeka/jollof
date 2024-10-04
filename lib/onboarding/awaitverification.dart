import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/emailverified.dart';
import 'package:pinput/pinput.dart';

import '../utils/stylings.dart';
import 'chooseportfolio.dart';

class Awaitverification extends StatelessWidget {
  const Awaitverification({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: Get.height,
        child: Container(
          height: Get.height*0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: SizedBox()),
              Icon(FluentIcons.mail_32_regular,size: 60,color: Stylings.yellow,),
              const SizedBox(height: 20,),
              Text("We've sent you an email",style: Stylings.titles,),
              const SizedBox(height: 10,),
              RichText(text: TextSpan(
                children: [
                  TextSpan(text:"Enter the code we've sent by mail to theemailhesent@gmail.com ",style: Stylings.subTitles,),
                  TextSpan(text:"Change email",style: Stylings.titles.copyWith(fontSize: 12),),
                ]
              )),
              const SizedBox(height: 10,),
              const SizedBox(height: 50,),
              Text("Enter code",style: Stylings.subTitles,),
              const SizedBox(height: 10,),
              SizedBox(
                width: Get.width,
                child: Pinput(
                  length: 5,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  defaultPinTheme: PinTheme(
                      width: 65,
                      height: 55,
                      textStyle: Stylings.titles,
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey.shade300)
                      )),
                  focusedPinTheme: PinTheme(
                      width: 65,
                      height: 55,
                      textStyle: Stylings.titles,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Stylings.yellow),
                          boxShadow: [
                            BoxShadow(color: Colors.yellow.shade100,blurRadius: 2,blurStyle: BlurStyle.outer),
                            BoxShadow(color: Colors.grey.shade300,blurRadius: 10,blurStyle: BlurStyle.outer)
                          ]
                      )),
                  followingPinTheme: PinTheme(
                      width: 65,
                      height: 55,
                      textStyle: Stylings.titles,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Stylings.yellow),
                        boxShadow: [
                          BoxShadow(color: Colors.yellow.shade100,blurRadius: 2,blurStyle: BlurStyle.outer),
                          BoxShadow(color: Colors.grey.shade300,blurRadius: 10,blurStyle: BlurStyle.outer)
                        ]
                      )),
                  cursor: const SizedBox(),
                  onCompleted: (pin){
                    Get.off(()=>const Emailverified());
                  },
                ),
              ),
              const Expanded(child: SizedBox()),
              GestureDetector(
                onTap: (){
                },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Didn't get the email?  ",textAlign: TextAlign.center,style: Stylings.subTitles),
                      Text("Resend link",textAlign: TextAlign.center,style: Stylings.subTitles.copyWith(color: Stylings.yellow),),
                    ],
                  )),
              const Expanded(flex:2,child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
