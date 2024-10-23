import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/home/settings/terms.dart';

import '../../../server/getxserver.dart';
import '../../../utils/stylings.dart';
import '../notifications/allnotifications.dart';
import 'allsettings.dart';

class Disclaimers extends StatelessWidget {
  const Disclaimers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
          "Disclaimers",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Get to know what we stand for", style: Stylings.titles.copyWith(fontSize: 12),),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              width: Get.width,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Terms(title: "Advisory Agreement"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text("Advisory Agreement",style: Stylings.subTitles,),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.035),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Terms(title: "Terms and conditions"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Terms and conditions",style: Stylings.subTitles,),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.035),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Terms(title: "Privacy Policy"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Privacy Policy",style: Stylings.subTitles,),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.035),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Terms(title: "Fee Schedule"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Fee Schedule",style: Stylings.subTitles,),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.035),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Terms(title: "Customer Agreement"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Customer Agreement",style: Stylings.subTitles,),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height*0.035),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>const Terms(title: "Terms of use"));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Terms of use",style: Stylings.subTitles,),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
