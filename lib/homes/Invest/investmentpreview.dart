import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../server/getxserver.dart';
import '../../utils/stylings.dart';
import 'investmentprevgraph.dart';

class Investmentpreview extends StatefulWidget {
  const Investmentpreview({super.key});

  @override
  State<Investmentpreview> createState() => _InvestmentpreviewState();
}

class _InvestmentpreviewState extends State<Investmentpreview> {

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
          "Investment",
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
      body: Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              height: Get.height*0.15,
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Get.find<Jollofx>().isLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
                  Expanded(flex:2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(FluentIcons.wallet_credit_card_16_regular,size: 20,color: Colors.black,),
                        const Expanded(child: SizedBox()),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("${Get.find<Jollofx>().investmentDuration} months",style: Stylings.titles.copyWith(fontSize: 12),),
                            Text("This investment would stay for ${Get.find<Jollofx>().investmentDuration} months",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400,fontSize: 10),
                            )],
                        ),

                      ],
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey.shade200,thickness: 1,)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Investing",style: Stylings.titles.copyWith(fontSize: 11,color: Colors.grey.shade400),),
                        // SizedBox(height: 5,),
                        Text("\$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().investmentAmount)}",style: Stylings.titles.copyWith(fontSize: 15),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Text("What you will get",style: Stylings.titles.copyWith(fontSize: 12),),
            const SizedBox(height: 20,),
            //details
            Container(
              width: Get.width,
              height: Get.height*0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Insurance
                  Container(
                    width: Get.width,
                    height: Get.height*0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.calculate_outlined,size: 17,color: Colors.black,),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("75% capital insurance",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 2),
                            Text("Your capital is partly covered",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Text("\$${NumberFormat.decimalPattern('en').format((75/100)*(Get.find<Jollofx>().investmentAmount))}",style: Stylings.titles.copyWith(fontSize: 12),)
                      ],
                    ),
                  ),
                  //brief
                  Container(
                    width: Get.width,
                    height: Get.height*0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.inventory_sharp,size: 17,color: Colors.black,),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("You are investing",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 2),
                            Text("For ${Get.find<Jollofx>().investmentDuration} months",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Text("\$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().investmentAmount)}",style: Stylings.titles.copyWith(fontSize: 12),)
                      ],
                    ),
                  ),
                  //Interest
                  Container(
                    width: Get.width,
                    height: Get.height*0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.wallet_travel,size: 17,color: Colors.black,),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Expected interest",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 2),
                            Text("The return on your investment",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Text(Get.find<Jollofx>().investmentDuration==3?"\$${NumberFormat.decimalPattern('en').format((10/100)*Get.find<Jollofx>().investmentAmount)}":
                        Get.find<Jollofx>().investmentDuration==6?"\$${NumberFormat.decimalPattern('en').format((25/100)*Get.find<Jollofx>().investmentAmount)}":
                        "\$${NumberFormat.decimalPattern('en').format((50/100)*Get.find<Jollofx>().investmentAmount)}",style: Stylings.titles.copyWith(fontSize: 12,color: Colors.green),)
                      ],
                    ),
                  ),
                  //Rate
                  Container(
                    width: Get.width,
                    height: Get.height*0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.calendar_month_outlined,size: 17,color: Colors.black,),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Interest rate",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 2),
                            Text("The percentage of your return",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Text(Get.find<Jollofx>().investmentDuration==3?"10%":Get.find<Jollofx>().investmentDuration==6?"25%":"50%",style: Stylings.titles.copyWith(fontSize: 12,color: Colors.green),)

                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(flex:2,child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.find<Jollofx>().isLoading.value=true;
                Get.find<Jollofx>().buyInvestment();
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Invest \$${Get.find<Jollofx>().investmentAmount}",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
