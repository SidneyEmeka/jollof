import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../server/getxserver.dart';
import '../utils/stylings.dart';

class Aiadvisor extends StatefulWidget {
  const Aiadvisor({super.key});

  @override
  State<Aiadvisor> createState() => _AiadvisorState();
}

class _AiadvisorState extends State<Aiadvisor> {
  TextEditingController _userInput = TextEditingController();
  final apiKey = 'AIzaSyC-ySXlpynP8hqESVJMsYpBRzMmCnXyOMk';

  Future<Void>() async{}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
            padding: const EdgeInsets.all(13),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              Jollofx.avatars[Get.find<Jollofx>().avatarIndex.value],
              fit: BoxFit.contain,
            )),
        title: Text(
          "AI Advisor",
          style: Stylings.titles,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(
              Icons.menu,
              size: 17,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    key: const Key("AI"),
                    style: Stylings.subTitles,
                    cursorColor: Colors.grey.shade300,
                    decoration: InputDecoration(
                      hintText: "Message...",
                      hintStyle: Stylings.subTitles
                          .copyWith(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                              color: Colors.transparent)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.transparent)),
                      isDense: false,
                      filled: true,
                      fillColor: Colors.grey.shade100,
                    ),
                  ),
                ),
              IconButton(onPressed: (){
                sendInput();
              }, icon:   Icon(Icons.send_outlined,color: Colors.black,size: 20,),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

