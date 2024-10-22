import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../server/getxserver.dart';
import '../../../utils/stylings.dart';
import '../notifications/allnotifications.dart';
import 'allsettings.dart';

class Preferences extends StatelessWidget {
  const Preferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: GestureDetector(
          onTap: (){
            Get.to(()=>const Allsettings());
          },
          child: Container(
              padding: const EdgeInsets.all(13),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.network(
                Get.find<Jollofx>().validatedUserAvatar.value,
                fit: BoxFit.contain,
              )),
        ),
        title: Text(
          "Appearance",
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
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        height: Get.height,
        child: ListView(
          children: [
            Text("Appearance",style: Stylings.titles.copyWith(fontSize: 12),),
            const SizedBox(height: 15),
            Container(
              width: Get.width,
              height: Get.height*0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                            width: Get.width*0.22,
                            height: Get.height*0.15,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(flex:2,child: SizedBox()),
                                Text("\$3,500",style: Stylings.titles.copyWith(fontSize: 10),),
                                const Expanded(flex:1,child: SizedBox()),
                                Text("This is how it looks like with light mode on.",style: Stylings.subTitles.copyWith(fontSize: 8),),
                                const Expanded(flex:2,child: SizedBox()),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text("Light",style: Stylings.titles.copyWith(fontSize: 10),),
                          IconButton(onPressed: (){
                            Get.find<Jollofx>().isDarkMode.value?Get.find<Jollofx>().isDarkMode.value=false:Get.find<Jollofx>().isDarkMode.value=true;
                          }, icon:  Get.find<Jollofx>().isDarkMode.value?Icon(Icons.circle_outlined,size: 20,color: Stylings.black,):Icon(Icons.radio_button_checked,size: 20,color: Stylings.yellow,))
                        ],
                      ),
                      const SizedBox(width: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                            width: Get.width*0.22,
                            height: Get.height*0.15,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Expanded(flex:2,child: SizedBox()),
                                Text("\$3,500",style: Stylings.titles.copyWith(fontSize: 10,color: Colors.white),),
                                const Expanded(flex:1,child: SizedBox()),
                                Text("This is how it looks like with light mode on.",style: Stylings.subTitles.copyWith(fontSize: 8,color: Colors.white),),
                                const Expanded(flex:2,child: SizedBox()),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Text("Dark",style: Stylings.titles.copyWith(fontSize: 10),),
                          IconButton(onPressed: (){
                            Get.find<Jollofx>().isDarkMode.value?Get.find<Jollofx>().isDarkMode.value=false:Get.find<Jollofx>().isDarkMode.value=true;
                          }, icon:  Get.find<Jollofx>().isDarkMode.value?Icon(Icons.radio_button_checked,size: 20,color: Stylings.yellow):Icon(Icons.circle_outlined,size: 20,color: Stylings.black,))
                        ],
                      ),

                    ],
                  )),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: Get.height*0.07,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                        color: Colors.grey.shade300
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.settings,size: 15,color: Stylings.black,),
                        const SizedBox(width: 10,),
                        Text("System settings",style: Stylings.titles.copyWith(fontSize: 12),),
                        const Expanded(child: SizedBox()),
                        Switch(value: false, onChanged: (v){
                          v=!v;
                        },
                          activeTrackColor: Colors.green,
                          trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                            return Colors.transparent; // Use the default color.
                          }),
                          inactiveTrackColor: Colors.grey.shade400,
                          inactiveThumbColor: Colors.white,
                          thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                            return Colors.white; // Use the default color.
                          }),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30,),

            Text("Information",style: Stylings.titles.copyWith(fontSize: 12),),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.face,size: 18,color: Stylings.black,),
                      const SizedBox(width: 10,),
                      Text("Enable face ID",style: Stylings.titles.copyWith(fontSize: 12),),
                      const Expanded(child: SizedBox()),
                      Switch(value: Get.find<Jollofx>().faceId.value, onChanged: (v){
                        Get.find<Jollofx>().faceId.value=v;
                      },
                        activeTrackColor: Colors.green,
                        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                          return Colors.transparent; // Use the default color.
                        }),
                        inactiveTrackColor: Colors.grey.shade400,
                        inactiveThumbColor: Colors.white,
                        thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                          return Colors.white; // Use the default color.
                        }),
                      ),
                    ],
                  ),
                  Divider(thickness: 0.0,color: Colors.grey.shade300,),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.translate,size: 18,color: Stylings.black,),
                      const SizedBox(width: 10,),
                      Text("Language",style: Stylings.titles.copyWith(fontSize: 12),),
                      const Expanded(child: SizedBox()),
                      SizedBox(
                        width: 70,
                        child: DropdownButton(
                            dropdownColor: Stylings.bgColor,
                            isExpanded: true,
                            menuMaxHeight: Get.height * 0.2,
                           // menuWidth: Get.width*0.3,
                            borderRadius: BorderRadius.circular(10),
                            value: Get.find<Jollofx>().currentLanguage.value,
                            iconEnabledColor: Colors.black,
                            icon: const Icon(Icons.arrow_forward_ios,size: 17,color: Colors.black,),
                            underline: const SizedBox(),
                            items: [
                              ...Get.find<Jollofx>().languages.map((aState) {
                                return DropdownMenuItem(
                                    value: aState,
                                    child: Text(
                                      aState,
                                      style: Stylings.titles.copyWith(fontSize: 12),
                                    ));
                              })
                            ],
                            onChanged: (value) {
                              Get.find<Jollofx>().currentLanguage.value=value!;
                            }),
                      ),
                    ],
                  ),
                  Divider(thickness: 0.0,color: Colors.grey.shade300,),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_none_outlined,size: 18,color: Stylings.black,),
                      const SizedBox(width: 10,),
                      Text("Notification",style: Stylings.titles.copyWith(fontSize: 12),),
                      const Expanded(child: SizedBox()),
                      Switch(value: Get.find<Jollofx>().allowNotify.value, onChanged: (v){
                        Get.find<Jollofx>().allowNotify.value=v;
                      },
                        activeTrackColor: Colors.green,
                        trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                          return Colors.transparent; // Use the default color.
                        }),
                        inactiveTrackColor: Colors.grey.shade400,
                        inactiveThumbColor: Colors.white,
                        thumbColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
                          return Colors.white; // Use the default color.
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),)
    );
  }
}
