import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/home/settings/account.dart';
import 'package:jollof/homes/home/settings/preferences.dart';
import 'package:jollof/onboarding/signinmethod.dart';

import '../../../server/getxserver.dart';
import '../../../utils/stylings.dart';
import '../notifications/allnotifications.dart';

class Allsettings extends StatelessWidget {
  const Allsettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Get.to(()=>const Allsettings());
          },
          child: Container(
              padding: const EdgeInsets.all(13),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                Get.find<Jollofx>().validatedUserAvatar.value,
                fit: BoxFit.contain,
              )),
        ),
        title: Text(
          "Settings",
          style: Stylings.titles,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.card_giftcard_outlined,
              //   size: 17,
              //   color: Colors.black,
              // ),
              const SizedBox(width: 10),
              IconButton(alignment: Alignment.centerRight,onPressed: (){
                Get.find<Jollofx>().isLoading.value=true;
                Get.to(()=>const Allnotifications());
              }, icon: const Icon(
                Icons.notifications_none_outlined,
                size: 19,
                color: Colors.black,
              ))
            ],
          ),
        ],
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Text("Account settings",style: Stylings.subTitles.copyWith(fontSize: 13),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              width: Get.width,
              decoration: BoxDecoration(
                color: const Color(0xFFFBFBFB),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.channel_48_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Talk to us",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),
                   SizedBox(height: Get.height*0.035),
                   GestureDetector(
                     onTap: (){
                       Get.to(()=>const Account());
                     },
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(FluentIcons.inprivate_account_28_regular,size: 20,color: Stylings.black,),
                        SizedBox(width: Get.width*0.05),
                        Text("Account",style: Stylings.subTitles,),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                                       ),
                   ),
                   SizedBox(height: Get.height*0.035),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.bot_add_24_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Referral Program",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),
                   SizedBox(height: Get.height*0.035),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.money_24_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Subscription",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),

                ],
              ),
            ),
        const SizedBox(height: 20),
            Text("Information",style: Stylings.subTitles.copyWith(fontSize: 13),),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              width: Get.width,
              decoration: BoxDecoration(
                  color: const Color(0xFFFBFBFB),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Preferences());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(FluentIcons.toggle_multiple_24_regular,size: 20,color: Stylings.black,),
                        SizedBox(width: Get.width*0.05),
                        Text("Preference",style: Stylings.subTitles,),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.clipboard_bullet_list_20_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Statements",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),
                  SizedBox(height: Get.height*0.035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.calendar_48_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Schedule investment",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),
                  SizedBox(height: Get.height*0.035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.warning_48_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Security & Privacy",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),
                  SizedBox(height: Get.height*0.035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.payment_48_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Payment",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),
                  SizedBox(height: Get.height*0.035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.chat_help_24_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Help center",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),
                  SizedBox(height: Get.height*0.035),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(FluentIcons.dismiss_circle_48_regular,size: 20,color: Stylings.black,),
                      SizedBox(width: Get.width*0.05),
                      Text("Disclaimers",style: Stylings.subTitles,),
                      const Expanded(child: SizedBox()),
                      Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                    ],
                  ),

                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Get.offAll(()=>const Signinmethod());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: const Color(0xFFFBFBFB)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(FluentIcons.power_28_regular,size: 20,),
                    const SizedBox(width: 10,),
                    Text("Log Out",style: Stylings.subTitles),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
