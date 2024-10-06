import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/questionaire/paymentmethod.dart';
import 'package:jollof/server/getxserver.dart';

import '../utils/stylings.dart';

class Addmoney extends StatelessWidget {
  const Addmoney({super.key});

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
          "Add money",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Your money is safe",style: Stylings.titles.copyWith(fontSize: 12),),
                Text("Schedule",style: Stylings.titles.copyWith(fontSize: 12,color: Stylings.yellow),),
              ],
            ),
            const SizedBox(height: 20,),
            Container(
              width: Get.width,
              height: Get.height*0.15,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade100)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(context: context,
                            isScrollControlled: true,
                            backgroundColor: Colors.grey.shade200,
                            enableDrag: true,
                            builder: (_){
                              return Container(
                                width: Get.width,
                                height: Get.height*0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children:[
                                      Container(
                                        width: Get.width,
                                        height: Get.height*0.07,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                            color: Colors.white
                                        ),
                                        alignment: Alignment.center,
                                        child: Text("Choose currency",style: Stylings.titles.copyWith(fontSize: 11),),
                                      ),
                                      const Expanded(child: SizedBox()),

                                      Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 15),
                                        width: Get.width,
                                        height: Get.height*0.12,
                                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: (){
                                                  Get.find<Jollofx>().addMoneyCurrency.value = "USDT";
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 15,
                                                      height: 15,
                                                      child: Image.asset("assets/images/usdt.png",fit: BoxFit.contain,),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text("USDT",style: Stylings.titles.copyWith(fontSize: 12),),
                                                    const Expanded(flex:2,child: SizedBox()),
                                                    Obx(()=>  Get.find<Jollofx>().addMoneyCurrency.value=="USDT"?Icon(Icons.radio_button_checked,size: 15,color: Stylings.yellow,):const Icon(Icons.circle_outlined,size: 15,color: Colors.black))
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(child: Divider(color: Colors.grey.shade100,thickness: 1,)),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: (){
                                                  Get.find<Jollofx>().addMoneyCurrency.value = "Naira";
                                                },
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 15,
                                                      height: 15,
                                                      child: Image.asset("assets/images/naira.png",fit: BoxFit.contain,),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Text("Naira",style: Stylings.titles.copyWith(fontSize: 12),),
                                                    const Expanded(flex:2,child: SizedBox()),
                                                    Obx(()=>  Get.find<Jollofx>().addMoneyCurrency.value=="Naira"?Icon(Icons.radio_button_checked,size: 15,color: Stylings.yellow,):const Icon(Icons.circle_outlined,size: 15,color: Colors.black))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const Expanded(child: SizedBox()),
                                      GestureDetector(
                                        onTap: (){
                                          Get.back();
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 15),
                                          height: Get.height*0.055,
                                          width: Get.width,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              color: Colors.white
                                          ),
                                          child: Text("Cancel",style: Stylings.titles.copyWith(fontSize: 12),),
                                        ),
                                      ),
                                      const Expanded(flex:2,child: SizedBox()),
                                    ]
                                ),
                              );
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Icon(FluentIcons.wallet_credit_card_16_regular,size: 20,color: Colors.blueAccent,),
                          const SizedBox(width: 10),
                          Text(Get.find<Jollofx>().addMoneyCurrency.value,style: Stylings.titles.copyWith(fontSize: 12),),
                          const Expanded(flex:2,child: SizedBox()),
                          const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,)
                        ],
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade100,thickness: 1,)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("You are depositing",style: Stylings.titles.copyWith(fontSize: 11,color: Colors.grey.shade400),),
                        // SizedBox(height: 5,),
                        Expanded(child: TextField(
                          onChanged: (value){
                            double val = double.parse(value);
                            Get.find<Jollofx>().addMoneyAmount.value = val;
                          },
                          textAlign: TextAlign.end,
                          style: Stylings.titles,
                          cursorColor: Colors.grey.shade300,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: Get.find<Jollofx>().addMoneyCurrency.value=="USDT"?"\$0.00":"₦0.00",
                              hintStyle: Stylings.titles.copyWith(fontSize: 15,color: Colors.grey.shade400),
                              suffix: Get.find<Jollofx>().addMoneyCurrency.value=="USDT"?Text("USDT",style: Stylings.subTitles,):Text("Naira",style: Stylings.subTitles,),
                              border: InputBorder.none
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.to(()=>const Paymentmethod());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Confirm and pay",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
            const Expanded(flex:3,child: SizedBox()),
          ],
        ),
      ),)
    );
  }
}
