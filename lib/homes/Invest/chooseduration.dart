import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';

import '../../utils/stylings.dart';
import 'investmentpreview.dart';

class Chooseduration extends StatelessWidget {
  const Chooseduration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 15,
              color: Colors.black,
            )),
        title: Text(
          "Choose Duration",
          style: Stylings.titles,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "Help",
              style: Stylings.titles
                  .copyWith(color: Stylings.yellow, fontSize: 12),
            ),
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body:Obx(()=> Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.lock_clock_outlined,color: Stylings.yellow,size: Get.width*0.2,),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20
              ),child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Choose Duration",style: Stylings.titles,),
                const SizedBox(height: 15),
                Text(textAlign: TextAlign.center,"Please choose the duration you would like your investment to last",style: Stylings.subTitles,),
              ],
            ),),
            const Expanded(flex:2,child: SizedBox()),
            Align(alignment: Alignment.centerLeft,child: Text("Duration you want this to run",style: Stylings.subTitles,)),
           const SizedBox(height: 15),
           //plan durations
            Get.find<Jollofx>().currentPlanPage.value==0?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=0;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("3 months at 10%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==0?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=1;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("6 months at 25%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==1?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=2;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("12 months at 55%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==2?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
              ],
            ):
            Get.find<Jollofx>().currentPlanPage.value==1?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=0;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("3 months at 15%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==0?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=1;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("6 months at 35%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==1?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=2;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("12 months at 65%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==2?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
              ],
            ):
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=0;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("3 months at 20%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==0?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=1;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("6 months at 40%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==1?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().investmentDurationAt.value=2;
                  },
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                      decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(7),
                          border: Border.all(color: Colors.grey.shade300,width: 0.0)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("12 months at 70%",style: Stylings.titles.copyWith(fontSize: 12),),
                          Get.find<Jollofx>().investmentDurationAt.value==2?const Icon(Icons.check,color: Colors.green,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,),
                        ],
                      )
                  ),
                ),
              ],
            ),
            const Expanded(flex:2,child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.to(()=>const Investmentpreview());
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

          ],
        ),
      ),)
    );
  }
}
