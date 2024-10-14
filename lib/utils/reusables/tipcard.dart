import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:jollof/utils/stylings.dart';
import 'package:share_plus/share_plus.dart';

class Tipcard extends StatelessWidget {
  final String imgUrl;
  final String time;
  final String title;
  final String id;
  const Tipcard({super.key, required this.title, required this.imgUrl, required this.time, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      width: Get.width,
      height: Get.height*0.5,
      decoration: BoxDecoration(
        //color: Colors.red,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey.shade300,width: 0.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(image: NetworkImage(imgUrl),fit: BoxFit.fill)
            ),
            width: Get.width,
            height: Get.height*0.4,
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10),
            width: Get.width,
            height: Get.height*0.04,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300,width: 0.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(time,style: Stylings.subTitles.copyWith(fontSize: 11),),
                Expanded(child: SizedBox()),
                Obx(()=>IconButton(onPressed: (){
                  Get.find<Jollofx>().likedorUnlikedId.contains(id)?Get.find<Jollofx>().unlikeATip(id) :Get.find<Jollofx>().likeATip(id);
                }, icon: Get.find<Jollofx>().likedorUnlikedId.contains(id)?Icon(FluentIcons.heart_48_filled,color: Colors.red,size: 17,) :Icon(FluentIcons.heart_48_regular,color: Colors.black,size: 17,)),
                ),
                IconButton(onPressed: ()async{await Share.share(
                    title);}, icon: Icon(FluentIcons.share_ios_48_regular,color: Colors.black,size: 17,)),
                IconButton(onPressed: (){

                }, icon: Icon(FluentIcons.more_vertical_48_filled,color: Colors.black,size: 17,)),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 10,right: 20),
            width: Get.width*0.9,
            height: Get.height*0.05,
            child: Text(title,style: Stylings.titles.copyWith(fontSize: 10),overflow: TextOverflow.fade,),
          ),
        ],
      ),
    );
  }
}
