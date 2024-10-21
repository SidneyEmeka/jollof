import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../server/getxserver.dart';
import '../../../../utils/stylings.dart';
import '../../notifications/allnotifications.dart';

class Choosestatemmentperiod extends StatefulWidget {
  const Choosestatemmentperiod({super.key});

  @override
  State<Choosestatemmentperiod> createState() => _ChoosestatemmentperiodState();
}

class _ChoosestatemmentperiodState extends State<Choosestatemmentperiod> {
  DateTime? pickedFrom;
  DateTime? pickedTo;
  Future<void> statementFromRange() async {
    DateTime? dob = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      initialDate: DateTime.now(),
      lastDate: DateTime.now(),
    );
    if (dob != null) {
      Get.find<Jollofx>().fromDate.value = dob.toString().split(" ")[0];
      pickedFrom =dob;
      setState(() {});
    } else {
      Get.find<Jollofx>().fromDate.value = "Select a date";
      setState(() {});
    }
  }

  Future<void> statementToRange() async {
    DateTime? dob = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      initialDate: DateTime.now().add(const Duration(days: 1)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (dob != null) {
      Get.find<Jollofx>().toDate.value = dob.toString().split(" ")[0];
      pickedTo =dob;
      setState(() {});
    } else {
      Get.find<Jollofx>().toDate.value = "Select a date";
      setState(() {});
    }
  }

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
          "Account Statemnt",
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
      body: Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Get.find<Jollofx>().isLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
            const Expanded(flex:4,child: SizedBox()),
            Text("Choose a time frame",style: Stylings.titles.copyWith(fontSize: 20),),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width*0.44,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Start Date",style: Stylings.titles.copyWith(fontSize: 12),),
                      const SizedBox(height: 10,),
                      TextFormField(
                        key: const Key("from"),
                        readOnly: true,
                        onTap: statementFromRange,
                        style: Stylings.subTitles,
                        cursorColor: Colors.grey.shade300,
                        onChanged: (v) {
                          Get.find<Jollofx>().fromDate.value = v;
                        },
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 15,
                            color: Colors.black,
                          ),
                          hintText: Get.find<Jollofx>().fromDate.value,
                          hintStyle: Stylings.subTitles,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.transparent)),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.grey.shade100,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  width: Get.width*0.44,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("End Date",style: Stylings.titles.copyWith(fontSize: 12),),
                      const SizedBox(height: 10,),
                      TextFormField(
                        key: const Key("to"),
                        readOnly: true,
                        onTap: statementToRange,
                        style: Stylings.subTitles,
                        cursorColor: Colors.grey.shade300,
                        decoration: InputDecoration(
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 15,
                            color: Colors.black,
                          ),
                          hintText: Get.find<Jollofx>().toDate.value,
                          hintStyle: Stylings.subTitles,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.transparent)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.transparent)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.transparent)),
                          isDense: true,
                          filled: true,
                          fillColor: Colors.grey.shade100,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
           const SizedBox(height: 5,),
           Get.find<Jollofx>().errorText.value==""?const SizedBox(): Expanded(child: Text(textAlign: TextAlign.center,Get.find<Jollofx>().errorText.value,style: Stylings.subTitles.copyWith(color: Colors.red),)),
            const Expanded(flex:4,child: SizedBox()),
            GestureDetector(
              onTap: () {
                Get.find<Jollofx>().isLoading.value=true;
                if(pickedTo!=null||pickedFrom!=null) {
                  Get.find<Jollofx>().checkRange(pickedFrom!, pickedTo!);
                }
                else{
                  Get.find<Jollofx>().isLoading.value=false;
                  Get.snackbar("Invalid Range", "Please set a time frame");
                }
              },
              child: Container(
                width: Get.width,
                height: Get.height*0.055,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow),
                child: Text(
                  "Next",
                  style: Stylings.titles.copyWith(fontSize: 12),
                ),
              ),
            ),
            //  Expanded(child: SizedBox()),
          ],
        ),
      ),)
    );
  }
}
