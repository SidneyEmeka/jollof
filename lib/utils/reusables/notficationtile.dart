import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';

import '../stylings.dart';

class Notficationtile extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  const Notficationtile({super.key, required this.title, required this.description, required this.time});

  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      width: Get.width,
      height: Get.height*0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200,width: 0.0),
        color: Stylings.bgColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(image: AssetImage("assets/images/notify.png"),fit: BoxFit.cover,)
            ),
            width: Get.width*0.15,
          ),
          const SizedBox(width: 10,),
          SizedBox(
            width: Get.width*0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: Stylings.titles.copyWith(fontSize: 12),),
                Text(overflow: TextOverflow.ellipsis,description,style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.black45),),
                Text(Get.find<Jollofx>().getRelativeTime(time),style: Stylings.subTitles.copyWith(fontSize: 8,color: Colors.black38),),
              ],
            ),
          ),
          const Expanded(child: SizedBox()),
          IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios,size: 15,color: Colors.grey.shade400,))
        ],
      ),
    );
  }
}
