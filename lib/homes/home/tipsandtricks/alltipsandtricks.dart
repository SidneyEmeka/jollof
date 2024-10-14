import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/home/tipsandtricks/atipfullread.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:jollof/utils/reusables/tipcard.dart';

import '../../../utils/stylings.dart';

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
  //date formatter
  String getRelativeTime(String isoString) {
    // Parse the ISO 8601 string to DateTime
    DateTime dateTime = DateTime.parse(isoString);

    // Get the current time
    DateTime now = DateTime.now().toUtc();

    // Calculate the difference
    Duration difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return "${difference.inDays ~/ 365} ${difference.inDays ~/ 365 == 1 ? 'year' : 'years'} ago";
    } else if (difference.inDays > 30) {
      return "${difference.inDays ~/ 30} ${difference.inDays ~/ 30 == 1 ? 'month' : 'months'} ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
    } else {
      return "just now";
    }
  }
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.notifications_none_outlined,
              size: 17,
              color: Colors.black,
            ),
          ),
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body:Obx(()=>Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        width: Get.width,
        height: Get.height,
        child: Get.find<Jollofx>().isLoading.value==true? AlertDialog(backgroundColor: Colors.transparent,content: Center(child: CircularProgressIndicator(color: Stylings.yellow,strokeCap: StrokeCap.round,)),):
        ListView(
            children: Get.find<Jollofx>().apiTips.map((aTip){
              final imgUrl = aTip.media.source;
              final time = getRelativeTime(aTip.createdAt.toString());
              final title = aTip.title;
              final id = aTip.id;
              return GestureDetector(
                  onTap: (){
                    Get.find<Jollofx>().isLoading.value=true;
                   Get.find<Jollofx>().readATipFully(aTip.id);
                  },
                  child: Tipcard(title: title, imgUrl: imgUrl, time: time, id: id,));
            }).toList()
        ),
      ),)
    );
  }
}
