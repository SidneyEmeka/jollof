import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/stylings.dart';
import 'forgetpassotp.dart';

class Forgotpass extends StatelessWidget {
  const Forgotpass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Reset your password",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter the email address you registered with. We'll send you an email in order to set a new password",
              style: Stylings.subTitles,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: Stylings.subTitles.copyWith(fontSize: 11),
              // controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
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
                    borderSide: BorderSide(color: Stylings.yellow)),
                errorStyle: Stylings.subTitles
                    .copyWith(fontSize: 10, color: Stylings.yellow),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Stylings.yellow)),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide: BorderSide(color: Stylings.yellow)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7),
                    borderSide:
                        const BorderSide(color: Colors.black12, width: 1)),
                labelText: "Email",
                floatingLabelStyle: Stylings.titles.copyWith(fontSize: 11),
                labelStyle: Stylings.titles.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
                                FluentIcons.key_reset_24_regular,
                                size: Get.height*0.1,
                                color: Colors.grey.shade400,
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                "OTP sent to your email",
                                style: Stylings.titles.copyWith(fontSize: 12),
                              ),
                              const SizedBox(height: 10,),
                              Text(textAlign: TextAlign.center,
                                "We sent a 6 digit code to your email address. The code is required in order to grant you access again.",
                                style: Stylings.subTitles,
                              ),
                              const Expanded(child: SizedBox()),
                              GestureDetector(
                                onTap: (){
                                  Get.back();
                                  Future.delayed(const Duration(milliseconds: 500),(){
                                    Get.to(()=>const Forgetpassotp());
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
                                  child: Text("Continue",style: Stylings.titles.copyWith(fontSize: 12),),
                                ),
                              ),
                              const Expanded(child: SizedBox()),
                            ]),
                      );
                    });
              },
              child: Container(
                height: Get.height * 0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow),
                child: Text(
                  "Reset Password",
                  style: Stylings.titles.copyWith(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
