import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/home/notifications/anotification.dart';

import '../../../server/getxserver.dart';
import '../../../utils/reusables/notficationtile.dart';
import '../../../utils/stylings.dart';


class Allnotifications extends StatefulWidget {
  const Allnotifications({super.key});

  @override
  State<Allnotifications> createState() => _AllnotificationsState();
}

class _AllnotificationsState extends State<Allnotifications> {
  @override
  void initState() {
    Get.find<Jollofx>().getAllNotifications();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "Notifications",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            Get.find<Jollofx>().isLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
            ...Get.find<Jollofx>().userNotifications.map((aNot){
              final title = aNot['title'];
              final desc = aNot['description'];
              final time = aNot['createdAt'];
              final id = aNot['id'];
              return GestureDetector(
                  onTap: (){
                    Get.to(()=> Anotification(title: title, desc: desc, time: time, id: id,));
                  },child: Notficationtile(title: title, description: desc, time: time,));
            })
          ],
        ),
      ),)
    );
  }
}
