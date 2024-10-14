import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/home/tipsandtricks/atipfullread.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:jollof/utils/reusables/tipcard.dart';

import '../../../utils/stylings.dart';
import '../notifications/allnotifications.dart';

class Alltipsandtricks extends StatefulWidget {
  const Alltipsandtricks({super.key});

  @override
  State<Alltipsandtricks> createState() => _AlltipsandtricksState();
}

class _AlltipsandtricksState extends State<Alltipsandtricks> {

  // @override
  // void initState() {
  //   Get.find<Jollofx>().getTipsandTricks();
  //   super.initState();
  // }
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
        scrolledUnderElevation: 0,
        title: Text(
          "Tips and Tricks",
          style: Stylings.titles,
        ),
        centerTitle: true,
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
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body:Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        width: Get.width,
        height: Get.height,
        child: Get.find<Jollofx>().isLoading.value==true? AlertDialog(backgroundColor: Colors.transparent,content: Center(child: CircularProgressIndicator(color: Stylings.yellow,strokeCap: StrokeCap.round,)),):
        ListView(
            children: [
              Get.find<Jollofx>().isLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
              ...Get.find<Jollofx>().apiTips.map((aTip){
              final imgUrl = aTip.media.source;
              final time = Get.find<Jollofx>().getRelativeTime(aTip.createdAt.toString());
              final title = aTip.title;
              final id = aTip.id;
              return GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().isLoading.value=true;
                   Get.find<Jollofx>().readATipFully(aTip.id);
                  },
                  child: Tipcard(title: title, imgUrl: imgUrl, time: time, id: id,));
            })]
        ),
      ),)
    );
  }
}
