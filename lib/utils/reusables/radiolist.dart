import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';

import '../stylings.dart';

class Radiolist extends StatefulWidget {
  final String title;
  final String state;
  const Radiolist({super.key, required this.title, required this.state});

  @override
  State<Radiolist> createState() => _RadiolistState();
}

class _RadiolistState extends State<Radiolist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: Colors.grey.shade200)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(widget.title,
            style: Stylings.titles.copyWith(fontSize: 12),),
          ),
          widget.title==widget.state?Icon(FluentIcons.record_12_regular,color: Stylings.yellow,size: 15,):const Icon(Icons.circle_outlined,color: Colors.black,size: 15,)
        ],
      ),
    );
  }
}
