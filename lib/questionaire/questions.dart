import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:jollof/utils/reusables/radiolist.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../utils/stylings.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
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
              size: 20,
              color: Colors.black,
            )),
        title: Text(
          "Let us know you",
          style: Stylings.titles,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              "Skip",
              style: Stylings.titles.copyWith(color: Stylings.yellow),
            ),
          )
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //count
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: Get.height * 0.024,
                      circularStrokeCap: CircularStrokeCap.round,
                      lineWidth: 4,
                      progressColor: Stylings.yellow,
                      percent: Get.find<Jollofx>().circular.value,
                      center: Text(
                        "${Get.find<Jollofx>().percentage.value}%",
                        style: Stylings.titles.copyWith(fontSize: 10),
                      ),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        "${Get.find<Jollofx>().questionNum.value}/6",
                        style: Stylings.titles.copyWith(fontSize: 12),
                      ),
                    )
                  ],
                ),
                const Expanded(flex:3,child: SizedBox()),
                Text(
                  "Question ${Get.find<Jollofx>().questionNum.value}",
                  style: Stylings.titles.copyWith(fontSize: 20),
                ),
                const Expanded(child: SizedBox()),
                //q1
                Get.find<Jollofx>().questionNum.value==1?
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Considering your financial goals, which statement aligns most with your preference?",
                        style: Stylings.subTitles),
                    const SizedBox(
                      height: 20,
                    ),
                   ...Get.find<Jollofx>().question1.map((q){
                     return GestureDetector(
                       onTap: (){
                         Get.find<Jollofx>().answer1.value = q;
                       },
                         child: Radiolist(title:q, state: "${Get.find<Jollofx>().answer1}"));
                   })
                  ],
                )
                    :Get.find<Jollofx>().questionNum.value==2?
                //q2
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "How do you generally feel about the idea of your investment value fluctuating in the short term?",
                        style: Stylings.subTitles),
                    const SizedBox(
                      height: 20,
                    ),
                    ...Get.find<Jollofx>().question2.map((q){
                      return GestureDetector(
                          onTap: (){
                            Get.find<Jollofx>().answer2.value = q;
                          },
                          child: Radiolist(title:q, state: "${Get.find<Jollofx>().answer2}"));
                    })
                  ],
                )
                    :Get.find<Jollofx>().questionNum.value==3?
                //q3
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "What would be your reaction if your investment portfolio experienced a temporary decline?",
                        style: Stylings.subTitles),
                    const SizedBox(
                      height: 20,
                    ),
                    ...Get.find<Jollofx>().question3.map((q){
                      return GestureDetector(
                          onTap: (){
                            Get.find<Jollofx>().answer3.value = q;
                          },
                          child: Radiolist(title:q, state: "${Get.find<Jollofx>().answer3}"));
                    })
                  ],
                )
                    :Get.find<Jollofx>().questionNum.value==4?
                //q4
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "When it comes to investing, what is your preferred timeline for achieving financial goals?",
                        style: Stylings.subTitles),
                    const SizedBox(
                      height: 20,
                    ),
                    ...Get.find<Jollofx>().question4.map((q){
                      return GestureDetector(
                          onTap: (){
                            Get.find<Jollofx>().answer4.value = q;
                          },
                          child: Radiolist(title:q, state: "${Get.find<Jollofx>().answer4}"));
                    })
                  ],
                )
                    :Get.find<Jollofx>().questionNum.value==5?
                //q5
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "How would you describe your knowledge and experience with investment markets?",
                        style: Stylings.subTitles),
                    const SizedBox(
                      height: 20,
                    ),
                    ...Get.find<Jollofx>().question5.map((q){
                      return GestureDetector(
                          onTap: (){
                            Get.find<Jollofx>().answer5.value = q;
                          },
                          child: Radiolist(title:q, state: "${Get.find<Jollofx>().answer5}"));
                    })
                  ],
                ):
                //q6
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "In the face of market uncertainty, what is your inclination regarding investment decisions?",
                        style: Stylings.subTitles),
                    const SizedBox(
                      height: 20,
                    ),
                    ...Get.find<Jollofx>().question6.map((q){
                      return GestureDetector(
                          onTap: (){
                            Get.find<Jollofx>().answer6.value = q;
                          },
                          child: Radiolist(title:q, state: "${Get.find<Jollofx>().answer6}"));
                    })
                  ],
                ),
                const Expanded(flex:3,child: SizedBox()),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.find<Jollofx>().nextPage();
                      Get.find<Jollofx>()
                          .calcPercent(Get.find<Jollofx>().questionNum.value);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Stylings.yellow),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const Expanded(flex:3,child: SizedBox()),
              ],
            ),
          )),
    );
  }
}
