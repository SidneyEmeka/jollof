import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/reusables/plancards.dart';
import '../../utils/stylings.dart';

class Buyplan extends StatelessWidget {
  const Buyplan({super.key});

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
          "Payment Details",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        padding: EdgeInsets.symmetric(vertical: Get.height*0.03),
        width: Get.width,
        height: Get.height,
        child:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //carosel
                CarouselSlider(
                  options: CarouselOptions(height: Get.height*0.22,
                      enlargeCenterPage: true,
                      onPageChanged: (index,reason){
                        Get.find<Jollofx>().currentPlanPage.value = index;
                      }
                  ),
                  items: [...Get.find<Jollofx>().plans.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Plancards(name: "${i["title"]}", price: "${i["amount"]}", desc: "${i["desc"]}",);
                      },
                    );
                  })],
                ),
                const SizedBox(height: 10,),
                AnimatedSmoothIndicator(
                  activeIndex: Get.find<Jollofx>().currentPlanPage.value,
                  count: 3,
                  effect: WormEffect(
                      dotColor: Colors.grey.shade400,
                      activeDotColor: Stylings.yellow,
                      dotWidth: 6,
                      dotHeight: 6
                  ),
                ),
                const Expanded(flex:2,child: SizedBox()),
                //header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("What you will get",style: Stylings.titles.copyWith(fontSize: 12),),
                      Text("Learn more",style: Stylings.titles.copyWith(fontSize: 11),),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
                //standard
               Get.find<Jollofx>().currentPlanPage.value==0?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //details
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.1,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.blue,
                              center: Text("10%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("10% profit for 3 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 10% profit in 3 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.25,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orange,
                              center: Text("25%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("25% profit for 6 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 25% profit in 6 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.55,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.pink,
                              center: Text("55%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("55% profit for 12 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 55% profit in 12 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.80,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                              center: Text("80%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("80% capital reimbursement",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("80% capital reimbursement for \$50 only",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ):
                //premium
               Get.find<Jollofx>().currentPlanPage.value==1?Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //details
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.15,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.blue,
                              center: Text("15%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("15% profit for 3 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 15% profit in 3 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.35,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orange,
                              center: Text("35%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("35% profit for 6 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 35% profit in 6 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.65,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.pink,
                              center: Text("65%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("65% profit for 12 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 65% profit in 12 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.90,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                              center: Text("90%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("90% capital reimbursement",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("90% capital reimbursement for \$100 only",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ):
                //vip
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //details
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.20,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.blue,
                              center: Text("20%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("20% profit for 3 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 20% profit in 3 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.40,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orange,
                              center: Text("40%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("40% profit for 6 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 40% profit in 6 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.70,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.pink,
                              center: Text("70%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("70% profit for 12 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 70% profit in 12 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircularPercentIndicator(
                              radius: 22,
                              percent: 0.95,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                              center: Text("95%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("95% capital reimbursement",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("95% capital reimbursement for \$150 only",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
                              ],
                            ),
                            const Expanded(child: SizedBox()),
                            const Icon(Icons.check_circle_outline_sharp,size: 20,color: Colors.green,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                const Expanded(flex:2,child: SizedBox()),
                //buy
                GestureDetector(
                  onTap: (){
                    Get.to(()=>const Buyplan());
                  },
                  child: Container(
                    height: Get.height*0.055,
                    width: Get.width,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Stylings.yellow
                    ),
                    child: Text("Start with \$${Get.find<Jollofx>().plans[Get.find<Jollofx>().currentPlanPage.value]["amount"]}",style: Stylings.titles.copyWith(fontSize: 12),),
                  ),
                ),
                const Expanded(flex:2,child: SizedBox()),
              ],
            ),
        ),
      ),

    );
  }
}
