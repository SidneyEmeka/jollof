import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../server/getxserver.dart';
import '../../../utils/stylings.dart';
import '../notifications/allnotifications.dart';
import 'allsettings.dart';

class Referral extends StatelessWidget {
  const Referral({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        appBar: AppBar(
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
            "Referral",
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
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add a promo code",style: Stylings.titles.copyWith(fontSize: 20),),
            const SizedBox(height: 5,),
            Text("If you have a Referral Code, please enter it below",style: Stylings.subTitles.copyWith(fontSize: 12),),
            const SizedBox(height: 30,),
            TextFormField(
              key: const Key("promocode"),
              style: Stylings.subTitles,
              cursorColor: Colors.grey.shade300,
              decoration: InputDecoration(
                hintText: "Referral code",
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
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: Get.width,
                height: Get.height*0.055,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow),
                child: Text(
                  "Apply",
                  style: Stylings.titles.copyWith(fontSize: 12),
                ),
              ),
            ),
            const SizedBox(height: 40,),
            Text("Refer a friend and you both earn \$10 each",style: Stylings.titles.copyWith(fontSize: 12),),
            const SizedBox(height: 20,),
            Text("1 Share with a friend your unique referral code",style: Stylings.subTitles,),
            const SizedBox(height: 10,),
           RichText(text: TextSpan(children: [
             TextSpan(text: "2 Inform your friend to open and account with Jollof and deposit a minimum of ",style: Stylings.subTitles),
             TextSpan(text: "\$299 ",style: Stylings.titles.copyWith(fontSize: 10)),
             TextSpan(text: "for his or her first investment. ",style: Stylings.subTitles),
           ])),
            const SizedBox(height: 10,),
           RichText(text: TextSpan(children: [
             TextSpan(text: "3 You both would be credited ",style: Stylings.subTitles),
             TextSpan(text: "\$10 ",style: Stylings.titles.copyWith(fontSize: 10)),
             TextSpan(text: "each inn your wallet",style: Stylings.subTitles),
           ])),
            const SizedBox(height: 20,),
            Container(
              alignment: Alignment.center,
              height: Get.height*0.055,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(10)),
                color: Colors.grey.shade300,
              ),
              child: Text(
                Get.find<Jollofx>().validatedPromoCode.value,
                style: Stylings.titles.copyWith(fontSize: 12),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height*0.055,
              decoration: BoxDecoration(
                borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(10)),
                color: Stylings.yellow,
              ),
              child: Text(
                "Share my referral link",
                style: Stylings.titles.copyWith(fontSize: 12),
              ),
            ),
            const Expanded(child: SizedBox()),
            Align(
              alignment: Alignment.center,
              child: RichText(text: TextSpan(children: [
                TextSpan(text: "Learn more about ",style: Stylings.subTitles),
                TextSpan(text: "Jollof referral program ",style: Stylings.titles.copyWith(fontSize: 10,decoration: TextDecoration.underline)),
                TextSpan(text: "and our ",style: Stylings.subTitles),
                TextSpan(text: "Disclosure",style: Stylings.titles.copyWith(fontSize: 10,decoration: TextDecoration.underline)),
              ])),
            ),


          ],
        ),
      ),
    );
  }
}
