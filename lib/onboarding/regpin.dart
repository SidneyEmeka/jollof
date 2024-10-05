import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/utils/stylings.dart';
import 'package:pinput/pinput.dart';

import 'confirmregpin.dart';

class Regpin extends StatefulWidget {
  const Regpin({super.key});

  @override
  State<Regpin> createState() => _RegpinState();
}

class _RegpinState extends State<Regpin> {
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.black,),
          onPressed: () {Get.back();},),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(flex:2,child: SizedBox()),
            //padlock
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.lightBlueAccent,width: 1),
              ),
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Stylings.yellow,width: 4),
                ),
                  child: Icon(Icons.lock_outline,color: Stylings.yellow,size: Get.width*0.15,)),
            ),
            const SizedBox(height: 20),
            Text("Welcome To Jollof",style: Stylings.titles),
            const SizedBox(height: 10),
            Text("Please create your pin",style: Stylings.subTitles.copyWith(color: Colors.grey),),
           const Expanded(child: SizedBox()),
            SizedBox(
              width: Get.width*0.32,
              child: Pinput(
                length: 4,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                defaultPinTheme: PinTheme(  width: 25,
                    height: 25,
                    textStyle: Stylings.titles,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.lightBlueAccent)
                    )),
                focusedPinTheme: PinTheme(  width: 25,
                    height: 25,
                    textStyle: Stylings.titles,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.lightBlueAccent)
                    )),
                obscureText: true,
                cursor: const SizedBox(),
                obscuringWidget: Icon(Icons.circle,color: Stylings.yellow,size: 20,),
                onCompleted: (pin){
                  Get.off(()=>const ConfirmRegpin());
                },
              ),
            ),
            const Expanded(flex:2,child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
