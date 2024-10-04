import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/regpin.dart';
import 'package:jollof/utils/stylings.dart';

class Regemail extends StatelessWidget {
  const Regemail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          height: Get.height,
          width: Get.width,
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
              SizedBox(height: Get.height*0.1,),
              Text("Please type in your email address",style: Stylings.titles.copyWith(fontSize: 20),),
              const SizedBox(height: 10),
              Text("We would be verifying your email.",style: Stylings.subTitles,),
              //textfield
              const Expanded(flex:1,child: SizedBox()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Email address.",style: Stylings.titles.copyWith(fontSize: 12),),
                  ),
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
                    ),

                  ),
                ],
              ),
              const Expanded(flex:2,child: SizedBox()),
              GestureDetector(
                onTap: (){
                  Get.to(()=>const Regpin());
                },
                child: Container(
                  height: Get.height*0.055,
                  width: Get.width,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Stylings.yellow
                  ),
                  child: Text("Confirm Email",style: Stylings.titles.copyWith(fontSize: 12),),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Get.height*0.15,
        color: Stylings.bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Already have  an account ? Log in",style: Stylings.subTitles.copyWith(color: Stylings.yellow),),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(text: "By continuing you agree to our  ",style: Stylings.subTitles),
                    TextSpan(text: "Privacy Policy ",style: Stylings.subTitles.copyWith(color: Stylings.yellow)),
                    TextSpan(text: "and ",style: Stylings.subTitles),
                    TextSpan(text: "Terms and Conditions",style: Stylings.subTitles.copyWith(color: Stylings.yellow)),
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
