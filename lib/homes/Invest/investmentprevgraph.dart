import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../server/getxserver.dart';
import '../../utils/stylings.dart';

class Investmentprevgraph extends StatelessWidget {
  const Investmentprevgraph({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Potential return",style: Stylings.titles.copyWith(fontSize: 11),),
                            SizedBox(height: 5),
                            Text("${Get.find<Jollofx>().planAt[Get.find<Jollofx>().investmentDurationAt.value]}%",style: Stylings.titles.copyWith(fontSize: 11,color: Colors.green),),
                          ],
                        ),
                        Text("This month",style: Stylings.titles.copyWith(fontSize: 11),)
                      ],
                    ),
                  ),
                   Image.asset("assets/images/graph.jpg",fit: BoxFit.contain,),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Text("Breakdown",style: Stylings.titles.copyWith(fontSize: 12),),
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
                            Text("30% capital insurance",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 2),
                            Text("Your capital is partly covered",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: "\$${((Get.find<Jollofx>().investmentAmount.value)*(30/100)).toInt()}",style: Stylings.titles.copyWith(fontSize: 12)),
                              TextSpan(text: ".00",style: Stylings.titles.copyWith(fontSize: 10))
                            ]
                        ))
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
                            Text("For ${Get.find<Jollofx>().investmentDurationAt.value==0?"3":Get.find<Jollofx>().investmentDurationAt.value==1?'6':'12'} months",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: "\$${Get.find<Jollofx>().investmentAmount.value.toInt()}",style: Stylings.titles.copyWith(fontSize: 12)),
                              TextSpan(text: ".00",style: Stylings.titles.copyWith(fontSize: 10))
                            ]
                        ))
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
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(text: "\$${((Get.find<Jollofx>().planAt[Get.find<Jollofx>().investmentDurationAt.value]/100)*Get.find<Jollofx>().investmentAmount.value).toInt()}",style: Stylings.titles.copyWith(fontSize: 12,color: Colors.green)),
                              TextSpan(text: ".00",style: Stylings.titles.copyWith(fontSize: 10,color: Colors.green))
                            ]
                        ))
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
                            Text("Total cash out + capital",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 2),
                            Text("Amount we will pay you",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                       RichText(text: TextSpan(children: [
                         TextSpan(text:"\$${(((Get.find<Jollofx>().planAt[Get.find<Jollofx>().investmentDurationAt.value]/100)*Get.find<Jollofx>().investmentAmount.value).toInt()+Get.find<Jollofx>().investmentAmount.value).toInt()}",style: Stylings.titles.copyWith(fontSize: 12,color: Colors.green)),
                         TextSpan(text:".00",style: Stylings.titles.copyWith(fontSize: 10,color: Colors.green)),
                       ]))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
          //opt out
            Container(
              width: Get.width,
              height: Get.height*0.22,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //opt out
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
                        const Icon(Icons.lightbulb_outline,size: 17,color: Colors.black,),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("You can opt out",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 2),
                            Text("Opt out on this investment anytime",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                      Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey.shade400,)
                      ],
                    ),
                  ),
                  //Get help
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
                        const Icon(Icons.help_outline_outlined,size: 17,color: Colors.black,),
                        const SizedBox(width: 15),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Get help",style: Stylings.titles.copyWith(fontSize: 12),),
                            const SizedBox(height: 2),
                            Text("Answer few questions on insight",style: Stylings.subTitles.copyWith(fontSize: 10,
                                color: Colors.grey.shade400),),
                          ],
                        ),
                        const Expanded(flex:2,child: SizedBox()),
                        Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey.shade400,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),

            GestureDetector(
              onTap: (){
                Get.to(()=>const Investmentprevgraph());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Invest \$${Get.find<Jollofx>().investmentAmount.value.toInt()}",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
