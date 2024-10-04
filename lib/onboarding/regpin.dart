import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/utils/stylings.dart';

class Regpin extends StatelessWidget {
  const Regpin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //padlock
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.lightBlueAccent,width: 1),
                ),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Stylings.yellow,width: 4),
                  ),
                    child: Icon(Icons.lock_outline,color: Stylings.yellow,size: Get.width*0.15,)),
              ),
        Text("Welcome To Jollof",style: Stylings.titles.copyWith(fontSize: 20),),
        const SizedBox(height: 10),
        Text("Please create your pin",style: Stylings.titles.copyWith(color: Colors.grey),),
            ],
          ),
        ),
      ),
    );
  }
}
