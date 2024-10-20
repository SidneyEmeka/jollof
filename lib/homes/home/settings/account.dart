import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/questionaire/questions.dart';

import '../../../server/getxserver.dart';
import '../../../utils/reusables/investmenttile.dart';
import '../../../utils/stylings.dart';
import '../notifications/allnotifications.dart';
import 'allsettings.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
            Get.to(()=>const Allsettings());
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
          "Account",
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
              IconButton(alignment: Alignment.centerRight,onPressed: (){
                Get.find<Jollofx>().isLoading.value=true;
                Get.to(()=>const Allnotifications());
              }, icon: const Icon(
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
        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Stylings.bgColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: Get.width*0.15,
                    height: Get.width*0.15,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        Get.find<Jollofx>().validatedUserAvatar.value,
                        fit: BoxFit.contain,
                      )),
                  SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${Get.find<Jollofx>().validatedfirstName} ${Get.find<Jollofx>().validatedlastName}",style: Stylings.titles.copyWith(fontSize: 10),),
                      SizedBox(height: 5),
                      Text(Get.find<Jollofx>().validatedUserEmail.value,style: Stylings.subTitles.copyWith(fontSize: 10),),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(10),
                  color: Stylings.bgColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(10)),
                      color: Colors.grey.shade300,
                    ),
                    child: Text(
                      "Balanced Investment",
                      style: Stylings.titles.copyWith(fontSize: 12),
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),child: Text("""Risk is like a casual acquaintance – you're aware it's there, but you're not hanging out too much. You acknowledge that taking some investment risks can lead to rewards, but you prefer to mix it with more stable investments. Small changes in your portfolio are okay with you.""",
                    style: Stylings.subTitles,),)
                ],
              ),
            ),
            SizedBox(height: 10,),
            //investments
            Get.find<Jollofx>().userInvestments.isEmpty
                ? const SizedBox()
                : Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 15),
              width: Get.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(10),
                  color: Stylings.bgColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...Get.find<Jollofx>().userInvestments.map((inv) {
                    final invRate = inv['interest_rate'];
                    final duration = inv['duration'];
                    final amount = inv['amount_invested'];
                    return Investmenttile(
                        invRate: invRate,
                        duration: duration,
                        amount: amount);
                  }),
                  //earnings
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width*0.11,
                            height: Get.width*0.11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green
                            ),
                            child: Icon(Icons.account_balance_wallet_outlined,size: 15,color: Colors.white,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Interest you've earned",style: Stylings.titles.copyWith(fontSize: 12),),
                              SizedBox(height: 2),
                              Text("From ${Get.find<Jollofx>().dateFormat(Get.find<Jollofx>().userInvestments[0]['createdAt'])} until today",style: Stylings.subTitles.copyWith(fontSize: 10),),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Text("\$0.00",style: Stylings.titles.copyWith(color: Colors.green,fontSize: 12),)
                        ],
                      ),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: Get.width*0.11,
                            height: Get.width*0.11,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue
                            ),
                            child: Icon(Icons.credit_card_outlined,size: 15,color: Colors.white,),
                          ),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Total Interest paid",style: Stylings.titles.copyWith(fontSize: 12),),
                              SizedBox(height: 2),
                              Text("Total interest we've paid you",style: Stylings.subTitles.copyWith(fontSize: 10),),
                            ],
                          ),
                          Expanded(child: SizedBox()),
                          Text("\$0.00",style: Stylings.titles.copyWith(color: Colors.green,fontSize: 12),)
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.to(()=>Questions());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Retake Questionnaire",style: Stylings.titles.copyWith(fontSize: 12)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
