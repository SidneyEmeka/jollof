import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/home/userdetails/userdetails.dart';
import 'package:jollof/server/getxserver.dart';

import '../../../utils/stylings.dart';

class Idimmageprocessing extends StatefulWidget {
  const Idimmageprocessing({super.key});

  @override
  State<Idimmageprocessing> createState() => _IdimmageprocessingState();
}

class _IdimmageprocessingState extends State<Idimmageprocessing> {
  @override
  void initState() {
    Get.find<Jollofx>().processImageIndicators();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Stylings.yellow,
      body: Obx(()=>Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex:2,child: SizedBox()),
            SizedBox(
              width: Get.width*0.3,
              height: Get.width*0.3,
              child: Image.asset("assets/images/ai.png",fit: BoxFit.fill,),
            ),
            Expanded(child: SizedBox()),
            Text("Please wait while we verify your Photo and ID Card..",style: Stylings.titles,),
            SizedBox(height: 20,),
            Get.find<Jollofx>().processingIdCheck.value>1? Text("We are conducting a background check on you and anything we discover about you would be displayed on your profile. we aim to keep everyone safe.",style: Stylings.subTitles,): Text("This should take not less than a minute, we aim to keep everyone safe",style: Stylings.subTitles,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text("Checking your Photo",style: Stylings.titles.copyWith(fontSize: 12),)),
                Get.find<Jollofx>().processingIdCheck.value>=1?Icon(Icons.check,color: Colors.black,size: 15,):SizedBox(width: 15,height: 15,child: CircularProgressIndicator(strokeCap: StrokeCap.round,strokeWidth: 2,color: Colors.white,backgroundColor: Colors.white.withOpacity(0.5),),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text("Checking your ID",style: Stylings.titles.copyWith(fontSize: 12),)),
                Get.find<Jollofx>().processingIdCheck.value>=2?Icon(Icons.check,color: Colors.black,size: 15,): SizedBox(width: 15,height: 15,child: CircularProgressIndicator(strokeCap: StrokeCap.round,strokeWidth: 2,color: Colors.white,backgroundColor: Colors.white.withOpacity(0.5),),)
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text("Finishing up...",style: Stylings.titles.copyWith(fontSize: 12),)),
                Get.find<Jollofx>().processingIdCheck.value==3?Icon(Icons.check,color: Colors.black,size: 15,):SizedBox(width: 15,height: 15,child: CircularProgressIndicator(strokeCap: StrokeCap.round,strokeWidth: 2,color: Colors.white,backgroundColor: Colors.white.withOpacity(0.5),),)
              ],
            ),
            Expanded(child: SizedBox()),
            Get.find<Jollofx>().processingIdCheck.value==3? GestureDetector(
              onTap: (){
                Get.find<Jollofx>().userDetailsNextPage();
                Get.find<Jollofx>().calcUserDetailsPercent(
                    Get.find<Jollofx>().userDetails.value);
                Get.to(()=>Userdetails());
              },
              child: Container(
                width: Get.width,
                height: Get.height*0.06,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7)
                ),
                alignment: Alignment.center,
                child: Text("Continue",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ):SizedBox()
          ],
        ),
      ),)
    );
  }
}
