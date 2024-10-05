import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/stylings.dart';
import 'forgotpass.dart';

class Signinmethod extends StatelessWidget {
  const Signinmethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          width: Get.width,
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  Text("Welcome back",style: Stylings.titles,),
                  const SizedBox(width: 10,),
                  Icon(FluentIcons.hand_wave_20_filled,color: Stylings.yellow,size: 20,)
                ],
              ),
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
                        labelText: "Email",
                        floatingLabelStyle: Stylings.titles.copyWith(fontSize: 11) ,
                        labelStyle: Stylings.titles.copyWith(fontSize: 12)

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
                        labelText: "Password",
                        floatingLabelStyle: Stylings.titles.copyWith(fontSize: 11) ,
                        labelStyle: Stylings.titles.copyWith(fontSize: 12),
                      suffix: Text("Show",style: Stylings.subTitles.copyWith(color: Stylings.yellow),)
                    ),


                  ),

                ],
              ),
              const SizedBox(height: 30,),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: (){
                      Get.to(()=>const Forgotpass());
                    },child: Text("Forgot your password?",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400),)),
              ),
              const SizedBox(height: 30,),
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
                  child: Text("Log in",style: Stylings.titles.copyWith(fontSize: 12),),
                ),
              ),
              const SizedBox(height: 30,),
              Align(
                alignment: Alignment.center,
                child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(children: [
                      TextSpan(text: "Don't have an account ? ",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400)),
                      TextSpan(recognizer: TapGestureRecognizer()..onTap=(){
                        Get.to(()=>const Signinmethod());
                      },text: "Register",style: Stylings.titles.copyWith(fontSize: 12,color: Colors.grey.shade400)),
                    ])),),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                 Expanded(child: Container(height: 1,width: Get.width*0.4,color: Colors.black12,)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text("OR",style: Stylings.titles.copyWith(color: Colors.grey.shade400,fontSize: 12),),
                  ),
                  Expanded(child: Container(height: 1,width: Get.width*0.4,color: Colors.black12,)),
                ],
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
                    border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height:Get.height*0.02,width:Get.height*0.02,child: Image.asset("assets/images/fb.png"),),
                      const SizedBox(width: 10,),
                      Text("Sign in with Facebook",style: Stylings.titles.copyWith(fontSize: 12),),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),
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
                      border: Border.all(color: Colors.grey.shade300)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height:Get.height*0.02,width:Get.height*0.02,child: Image.asset("assets/images/gg.png"),),
                      const SizedBox(width: 10,),
                      Text("Sign in with Facebook",style: Stylings.titles.copyWith(fontSize: 12),),
                    ],
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(text: "By continuing you agree to our  ",style: Stylings.subTitles),
                    TextSpan(text: "Privacy Policy ",style: Stylings.subTitles.copyWith(color: Stylings.yellow)),
                    TextSpan(text: "and ",style: Stylings.subTitles),
                    TextSpan(text: "Terms and Conditions",style: Stylings.subTitles.copyWith(color: Stylings.yellow)),
                  ])),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
