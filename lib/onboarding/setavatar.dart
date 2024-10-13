import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/setnotification.dart';
import 'package:jollof/server/getxserver.dart';

import '../utils/stylings.dart';

class Setavatar extends StatefulWidget {
  const Setavatar({super.key});

  @override
  State<Setavatar> createState() => _SetavatarState();
}

class _SetavatarState extends State<Setavatar> {
  @override
  void initState() {
    Get.find<Jollofx>().getAllAvatars();
    super.initState();
  }
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
        child:Get.find<Jollofx>().isLoading.value==true?   AlertDialog(backgroundColor: Colors.transparent,content: Center(child: CircularProgressIndicator(color: Stylings.yellow,strokeCap: StrokeCap.round,)),):Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.centerLeft,child: Text("Select an avatar for your profile to personalize your account",style: Stylings.subTitles,)),
            Get.find<Jollofx>().secondIsLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
            const Expanded(child: SizedBox()),
             Wrap(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              spacing: Get.width*0.05,
              runSpacing: Get.width*0.08,
              children:
                Get.find<Jollofx>().apiAvatars.map((av){
                  final index = Get.find<Jollofx>().apiAvatars.indexOf(av);
                  final imgAvatar = av["avatar"];
                  final imgUrl = av["image"];
                  return GestureDetector(
                    onTap: (){
                      Get.find<Jollofx>().avatarIndex.value = index;
                      Get.find<Jollofx>().userInfo["avatar"] = imgAvatar;
                      print(Get.find<Jollofx>().userInfo);
                    },
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      width: Get.width*0.18,
                      height: Get.width*0.18,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        border:  Get.find<Jollofx>().avatarIndex.value==index?Border.all(color: Stylings.yellow,width: 3):Border.all(color: Colors.transparent),
                          image: DecorationImage(image: NetworkImage("$imgUrl"),fit: BoxFit.contain)
                      ),
                    ),
                  );
                }).toList()

            ),
            const Expanded(flex:2,child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.find<Jollofx>().secondIsLoading.value=true;
              //  Get.find<Jollofx>().setAvatar(Get.to(()=>const Setnotification()));
                Get.find<Jollofx>().updateUserProfile(Get.to(()=>const Setnotification()));
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
        )
      ),)
    );
  }
}
