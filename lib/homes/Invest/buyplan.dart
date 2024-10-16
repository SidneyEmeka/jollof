import 'package:carousel_slider/carousel_slider.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/Invest/buyplanthrough.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Container(
            padding: const EdgeInsets.all(13),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,),
          child:Image.network(
            Get.find<Jollofx>().validatedUserAvatar.value,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(
          "Buy Plan",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        padding: EdgeInsets.only(top: Get.height*0.01),
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
                const Expanded(flex:3,child: SizedBox()),
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
                              percent: 0.20,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orange,
                              center: Text("20%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("20% profit for 6 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 20% profit in 6 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.30,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.pink,
                              center: Text("30%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("30% profit for 12 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 30% profit in 12 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.75,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                              center: Text("75%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("75% capital reimbursement",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("75% capital reimbursement for \$50 only",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.25,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.blue,
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
                              percent: 0.50,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orange,
                              center: Text("50%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("50% profit for 12 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 50% profit in 12 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.75,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.pink,
                              center: Text("75%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("75% profit for 18 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 75% profit in 18 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.75,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                              center: Text("75%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("75% capital reimbursement",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("75% capital reimbursement for \$100 only",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.50,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.blue,
                              center: Text("50%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("50% profit for 12 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 50% profit in 12 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.85,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.orange,
                              center: Text("85%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("85% profit for 24 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 85% profit in 24 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.98,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.pink,
                              center: Text("98%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("98% profit for 36 months",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("Earns you 98% profit in 36 months",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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
                              percent: 0.75,
                              backgroundColor: Colors.grey.shade300,
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.purple,
                              center: Text("75%",style: Stylings.titles.copyWith(fontSize: 10),),),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("75% capital reimbursement",style: Stylings.titles.copyWith(fontSize: 12),),
                                Text("75% capital reimbursement for \$150 only",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),),
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


                const Expanded(flex:3,child: SizedBox()),
                //buy
                GestureDetector(
                  onTap: (){
                    Get.to(()=>const Buyplanthrough());
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
                )
              ],
            ),
        ),
      ),

    );
  }
}
