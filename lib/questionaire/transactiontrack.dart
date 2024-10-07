import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../server/getxserver.dart';
import '../utils/stylings.dart';

class Transactiontrack extends StatelessWidget {
  const Transactiontrack({super.key});

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
        title: Text(
          "Processing Transaction",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade100),
                color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Acct
                  Container(
                    width: Get.width,
                    height: Get.height*0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("To Naira Wallet",style: Stylings.titles),
                            Text("29th Oct, 18:33 PM",style: Stylings.subTitles.copyWith(fontSize: 10,color: Colors.grey.shade400),
                            )],
                        ),
                        Text("NGN ${Get.find<Jollofx>().addMoneyAmount.value.toInt()}",style: Stylings.titles),
                      ],
                    ),
                  ),
                  //timeline
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child:
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.radio_button_checked,size: 20,color: Colors.green,),
                                   const SizedBox(height: 5,),
                                    Container(height: 25,color: Colors.green,width: 1,)
                                  ],
                                ),
                                const SizedBox(width: 15,),
                                Text("Processing",style: Stylings.titles,),
                                const Expanded(child: SizedBox()),
                                Text("29th Oct",style: Stylings.subTitles,),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.circle_outlined,size: 20,color: Colors.black,),
                                    const SizedBox(height: 5,),
                                    Container(height: 25,color: Colors.black,width: 1,)
                                  ],
                                ),
                                const SizedBox(width: 15,),
                                Text("Waiting to receive funds",style: Stylings.titles,),
                                const Expanded(child: SizedBox()),
                                Text("29th Oct",style: Stylings.subTitles,),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(Icons.circle_outlined,size: 20,color: Colors.black,),
                                const SizedBox(width: 15,),
                                Text("Funds Deposited",style: Stylings.titles,),
                                const Expanded(child: SizedBox()),
                                Text("29th Oct",style: Stylings.subTitles,),
                              ],
                            ),

                          ],
                    ),
                  ),
                
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text("Details",style: Stylings.titles,),
            ),
            const SizedBox(height: 20,),
            Container(
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade100),
                  color: Colors.white
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Acct
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Reference no",style: Stylings.titles),
                        const Expanded(child: SizedBox()),
                        Text("JF-112827289Q7",style: Stylings.titles),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: (){
                          Get.snackbar("Copied", "Copied to clipboard",duration: const Duration(milliseconds: 800));
                          Clipboard.setData(const ClipboardData(text: "Reference no - JF-112827289Q7"));
                        },
                          child: const Icon(Icons.copy,size: 17,color: Colors.blueAccent,))
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("You will get",style: Stylings.titles),
                        const Expanded(child: SizedBox()),
                        Text("₦${Get.find<Jollofx>().addMoneyAmount.value.toInt()}",style: Stylings.titles),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade200,width: 0.0)
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Fee",style: Stylings.titles),
                        const Expanded(child: SizedBox()),
                        Text("₦0.00",style: Stylings.titles),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Total paid",style: Stylings.titles),
                        const Expanded(child: SizedBox()),
                        Text("₦${Get.find<Jollofx>().addMoneyAmount.value.toInt()}",style: Stylings.titles),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
