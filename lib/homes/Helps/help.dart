import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/Helps/readhelpArticle.dart';
import 'package:jollof/homes/Helps/searching.dart';
import 'package:jollof/homes/aiadvisor.dart';
import 'package:jollof/homes/home/more/statement/choosestatemmentperiod.dart';

import '../../server/getxserver.dart';
import '../../utils/stylings.dart';
import '../home/notifications/allnotifications.dart';
import '../home/settings/allsettings.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.to(() => const Allsettings());
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
          "Help Center",
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
              IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Get.find<Jollofx>().isLoading.value = true;
                    Get.to(() => const Allnotifications());
                  },
                  icon: const Icon(
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
        padding: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 15),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: Get.width*0.6,
                    child: Text(textAlign: TextAlign.center,"Hi, how can we help you today?",style: Stylings.titles.copyWith(fontSize: 20),) ),
              ),
              const SizedBox(height: 30,),
              TextFormField(
                readOnly: true,
                onTap: () {
                  Get.to(()=> Searching(),
                      fullscreenDialog: true,
                      transition: Transition.rightToLeft,
                      duration: const Duration(milliseconds: 600));
                },
                key: const Key("help"),
                style: Stylings.subTitles,
                cursorColor: Colors.grey.shade300,
                decoration: InputDecoration(
                  hintText: "Search",
                  suffixIcon: const Icon(Icons.search,color: Colors.black45,size: 20,),
                  hintStyle: Stylings.subTitles
                      .copyWith(color: Colors.grey.shade400),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          color: Colors.transparent)),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
              ),
              const SizedBox(height: 30),
              Text("Quick links",style: Stylings.titles.copyWith(fontSize: 12),),
              const SizedBox(height: 15),
              Container(
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
                        Get.to(()=>Aiadvisor());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FluentIcons.chat_48_regular,size: 20,color: Stylings.black,),
                          SizedBox(width: Get.width*0.05),
                          Text("Chat with Jollof chat assistant",style: Stylings.titles.copyWith(fontSize: 12),),
                          const Expanded(child: SizedBox()),
                          Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height*0.035),
                    GestureDetector(
                      onTap: (){
                      //  Get.to(()=>const Account());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FluentIcons.phone_48_regular,size: 20,color: Stylings.black,),
                          SizedBox(width: Get.width*0.05),
                          Text("Get in touch",style: Stylings.titles.copyWith(fontSize: 12),),
                          const Expanded(child: SizedBox()),
                          Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                        ],
                      ),
                    ),
                    SizedBox(height: Get.height*0.035),
                    GestureDetector(
                      onTap: (){
                   Get.to(()=>const Choosestatemmentperiod());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(FluentIcons.channel_48_regular,size: 20,color: Stylings.black,),
                          SizedBox(width: Get.width*0.05),
                          Text("Download a statement",style: Stylings.titles.copyWith(fontSize: 12),),
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
                        Icon(FluentIcons.chat_help_24_regular,size: 20,color: Stylings.black,),
                        SizedBox(width: Get.width*0.05),
                        Text("Question on my investment",style: Stylings.titles.copyWith(fontSize: 12),),
                        const Expanded(child: SizedBox()),
                        Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                      ],
                    ),




                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text("Recommended",style: Stylings.titles.copyWith(fontSize: 12),),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: (){
                  Get.to(()=>Readhelparticle());
                },
                child: Container(
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
                         // Get.to(()=>const Terms(title: "Advisory Agreement"));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text("I have a problem with a transaction",style: Stylings.titles.copyWith(fontSize: 12)),
                            const Expanded(child: SizedBox()),
                            Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height*0.035),
                      GestureDetector(
                        onTap: (){
                         // Get.to(()=>const Terms(title: "Terms and conditions"));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("How to keep my money safe",style: Stylings.titles.copyWith(fontSize: 12)),
                            const Expanded(child: SizedBox()),
                            Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height*0.035),
                      GestureDetector(
                        onTap: (){
                         // Get.to(()=>const Terms(title: "Privacy Policy"));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("I have a problem with a transaction",style: Stylings.titles.copyWith(fontSize: 12)),
                            const Expanded(child: SizedBox()),
                            Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height*0.035),
                      GestureDetector(
                        onTap: (){
                         // Get.to(()=>const Terms(title: "Fee Schedule"));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Why is my credit score low",style: Stylings.titles.copyWith(fontSize: 12),),
                            const Expanded(child: SizedBox()),
                            Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height*0.035),
                      GestureDetector(
                        onTap: (){
                          //Get.to(()=>const Terms(title: "Customer Agreement"));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("How to improve my savings",style: Stylings.titles.copyWith(fontSize: 12)),
                            const Expanded(child: SizedBox()),
                            Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height*0.035),
                      GestureDetector(
                        onTap: (){
                        //  Get.to(()=>const Terms(title: "Terms of use"));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Which investment plan is better for me",style: Stylings.titles.copyWith(fontSize: 12)),
                            const Expanded(child: SizedBox()),
                            Icon(FluentIcons.ios_chevron_right_20_regular,size: 20,color: Stylings.black,),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
