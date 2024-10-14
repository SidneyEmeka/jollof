import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:share_plus/share_plus.dart';

import '../../../server/getxserver.dart';
import '../../../utils/stylings.dart';


class Atipfullread extends StatelessWidget {
  final dynamic whichTip;
  const Atipfullread({super.key, required this.whichTip});

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
      body: Obx(()=>Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(image: NetworkImage(whichTip['media']['source']),fit: BoxFit.fill)
                ),
                width: Get.width,
                height: Get.height*0.35,
              ),
              Container(
                alignment: Alignment.centerLeft,
                //padding: const EdgeInsets.only(left: 15),
                width: Get.width,
                height: Get.height*0.05,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300,width: 0.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //Text('${whichTip['stats']['likeCount']} likes',style: Stylings.subTitles.copyWith(fontSize: 11),),
                   // const Expanded(child: SizedBox()),
                    IconButton(padding: EdgeInsets.zero,constraints: const BoxConstraints(maxWidth: 1),onPressed: ()async{await Share.share(
                        "${whichTip.title}");}, icon: const Icon(FluentIcons.share_ios_48_regular,color: Colors.black,size: 17,)),
                    IconButton(padding: EdgeInsets.zero,constraints: const BoxConstraints(maxWidth: 1),onPressed: (){
                     Get.find<Jollofx>().likedorUnlikedId.contains(whichTip['id'])?Get.find<Jollofx>().unlikeATip(whichTip['id']) :Get.find<Jollofx>().likeATip(whichTip['id']);
                     }, icon: Get.find<Jollofx>().likedorUnlikedId.contains(whichTip['id'])?const Icon(FluentIcons.heart_48_filled,color: Colors.red,size: 17,) :const Icon(FluentIcons.heart_48_regular,color: Colors.black,size: 17,)),
          Text('${whichTip['stats']['likeCount']}',style: Stylings.subTitles.copyWith(fontSize: 11),),
                IconButton(padding: EdgeInsets.zero,constraints: const BoxConstraints(maxWidth: 1),onPressed: (){
                    }, icon: const Icon(FluentIcons.more_vertical_48_filled,color: Colors.black,size: 17,)),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(whichTip['title'],style: Stylings.titles.copyWith(fontSize: 12),),
                    const SizedBox(height: 20,),
                    Text(whichTip['content'],style: Stylings.subTitles,)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),)
    );
  }
}
