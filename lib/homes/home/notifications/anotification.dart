import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../server/getxserver.dart';
import '../../../utils/stylings.dart';

class Anotification extends StatelessWidget {
  final String title;
  final String desc;
  final String time;
  final String id;
  const Anotification({super.key, required this.title, required this.desc, required this.time, required this.id});

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
          "Notification",
          style: Stylings.titles,
        ),
        centerTitle: true,
        actions: [Container(
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              Get.find<Jollofx>().validatedUserAvatar.value,
              fit: BoxFit.contain,
            )),],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width,
                height: Get.height*0.1,
                child: Image.asset("assets/images/flog.png",fit: BoxFit.contain,),
              ),
              Text(title.toUpperCase(),style: Stylings.titles,),
              const SizedBox(height: 5),
              Text(textAlign: TextAlign.justify,'Hello ${Get.find<Jollofx>().validatedlastName}, $desc',style: Stylings.titles.copyWith(fontSize: 12)),
              const SizedBox(height: 10),
              Align(alignment: Alignment.centerRight,child: Text(Get.find<Jollofx>().getRelativeTime(time),style: Stylings.titles.copyWith(fontSize: 10),)),
             const SizedBox(height: 2,),
              Align(alignment: Alignment.centerRight,child: Text("ID-$id",style: Stylings.titles.copyWith(fontSize: 10),))
             ],
          ),
        ),
      ),
    );
  }
}
