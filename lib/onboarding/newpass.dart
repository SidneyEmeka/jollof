import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/signinmethod.dart';

import '../utils/stylings.dart';

class Newpass extends StatefulWidget {
  const Newpass({super.key});

  @override
  State<Newpass> createState() => _NewpassState();
}

class _NewpassState extends State<Newpass> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //header
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/enflag.png"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text("EN",style: Stylings.titles.copyWith(fontSize: 12),)
                ],
              ),
              const SizedBox(height: 30,),
              Text("Enter new password",style: Stylings.titles,),
             const SizedBox(height: 30,),
              //textfields
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    style: Stylings.subTitles.copyWith(fontSize: 11),
                    // controller: _emailController,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.grey.shade500,
                    cursorHeight: 15,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Stylings.yellow)
                        ),
                        errorStyle: Stylings.subTitles.copyWith(fontSize: 10,color: Stylings.yellow),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Stylings.yellow)
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Stylings.yellow)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.black12,width: 1)
                        ),
                        labelText: "Password",
                        floatingLabelStyle: Stylings.titles.copyWith(fontSize: 11) ,
                        labelStyle: Stylings.titles.copyWith(fontSize: 12),
                      suffix: Icon(Icons.remove_red_eye_outlined,size: 15,color: Colors.grey.shade400,)
                    ),


                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    style: Stylings.subTitles.copyWith(fontSize: 11),
                    // controller: _emailController,
                    validator: (value){
                      if(value==null||value.isEmpty){
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.grey.shade500,
                    cursorHeight: 15,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Stylings.yellow)
                        ),
                        errorStyle: Stylings.subTitles.copyWith(fontSize: 10,color: Stylings.yellow),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Stylings.yellow)
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: BorderSide(color: Stylings.yellow)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7),
                            borderSide: const BorderSide(color: Colors.black12,width: 1)
                        ),
                        labelText: "Re-type Password",
                        floatingLabelStyle: Stylings.titles.copyWith(fontSize: 11) ,
                        labelStyle: Stylings.titles.copyWith(fontSize: 12),
                        suffix: Icon(Icons.remove_red_eye_outlined,size: 15,color: Colors.grey.shade400,)
                    ),


                  ),
                ],
              ),
              const SizedBox(height: 30,),
              //bottom
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      enableDrag: true,
                      showDragHandle: true,
                      builder: (_) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          width: Get.width,
                          height: Get.height * 0.35,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle_outline_sharp,
                                  size: Get.height*0.05,
                                  color: Colors.green,
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  "Password changed successfully",
                                  style: Stylings.titles.copyWith(fontSize: 12),
                                ),
                                const SizedBox(height: 10,),
                                Text(textAlign: TextAlign.center,
                                  "Your password has been successfully changed please log back in to continue?",
                                  style: Stylings.subTitles,
                                ),
                                const Expanded(child: SizedBox()),
                                GestureDetector(
                                  onTap: (){
                                    Get.to(()=>const Signinmethod());
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
                                const Expanded(child: SizedBox()),
                              ]),
                        );
                      });
                },
                child: Container(
                  height: Get.height*0.055,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Stylings.yellow
                  ),
                  child: Text("Set Password",style: Stylings.titles.copyWith(fontSize: 12),),
                ),
              ),
              const SizedBox(height: 15,),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      enableDrag: true,
                      showDragHandle: true,
                      builder: (_) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          width: Get.width,
                          height: Get.height * 0.35,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check_circle_outline_sharp,
                                  size: Get.height*0.05,
                                  color: Colors.green,
                                ),
                                const Expanded(child: SizedBox()),
                                Text(
                                  "Confirm you want to leave",
                                  style: Stylings.titles.copyWith(fontSize: 12),
                                ),
                                const SizedBox(height: 10,),
                                Text(textAlign: TextAlign.center,
                                  "Are you sure you want to leave this page?",
                                  style: Stylings.subTitles,
                                ),
                                const Expanded(child: SizedBox()),
                                GestureDetector(
                                  onTap: (){
                                  },
                                  child: Container(
                                    height: Get.height*0.055,
                                    width: Get.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Stylings.yellow
                                    ),
                                    child: Text("Yes",style: Stylings.titles.copyWith(fontSize: 12),),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                GestureDetector(
                                  onTap: (){
                                  },
                                  child: Container(
                                    height: Get.height*0.055,
                                    width: Get.width,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Colors.grey.shade200
                                    ),
                                    child: Text("No",style: Stylings.titles.copyWith(fontSize: 12),),
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                              ]),
                        );
                      });
                },
                child: Container(
                  height: Get.height*0.055,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Colors.grey.shade200
                  ),
                  child: Text("Cancel",style: Stylings.titles.copyWith(fontSize: 12),),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
