import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/questionaire/pyamentonway.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/stylings.dart';

class Jollofbankdetails extends StatelessWidget {
  const Jollofbankdetails({super.key});

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
          "Payment Details",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fund your Naira wallet",style: Stylings.titles,),
            Text("Tap the 'I have paid' button after completing the transfer",style: Stylings.subTitles,),
            const SizedBox(height: 20,),
            Container(
              width: Get.width,
              height: Get.height*0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade200),
                color: Colors.grey.shade100
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //Amount
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
                        Text("Amount to send",style: Stylings.subTitles,),
                        const SizedBox(height: 5),
                        Text("NGN ${Get.find<Jollofx>().addMoneyAmount.value.toInt()}",style: Stylings.titles),
                      ],
                    ),
                  ),
                  //Acct name
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
                            Text("Account name",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400),),
                            Text("Jollof Limited",style: Stylings.titles.copyWith(fontSize: 12),),
                          ],
                        ),
                        GestureDetector( onTap: (){
                          Get.snackbar("Copied", "Copied to clipboard",duration: const Duration(milliseconds: 800));
                          Clipboard.setData(const ClipboardData(text: "Reference no - JF-112827289Q7"));
                        },child: const Icon(Icons.copy,color: Colors.black,size: 15,))
                      ],
                    ),
                  ),
                  //Bank name
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
                            Text("Bank name",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400),),
                            Text("GTBank",style: Stylings.titles.copyWith(fontSize: 12),),
                          ],
                        ),
                        GestureDetector( onTap: (){
                          Get.snackbar("Copied", "Copied to clipboard",duration: const Duration(milliseconds: 800));
                          Clipboard.setData(const ClipboardData(text: "Reference no - JF-112827289Q7"));
                        },child: const Icon(Icons.copy,color: Colors.black,size: 15,))
                      ],
                    ),
                  ),
                  //Acct number
                  Container(
                    width: Get.width,
                    height: Get.height*0.1,
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Account number",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400),),
                            Text("00181789",style: Stylings.titles.copyWith(fontSize: 12),),
                          ],
                        ),
                        GestureDetector( onTap: (){
                          Get.snackbar("Copied", "Copied to clipboard",duration: const Duration(milliseconds: 800));
                          Clipboard.setData(const ClipboardData(text: "Reference no - JF-112827289Q7"));
                        },child: const Icon(Icons.copy,color: Colors.black,size: 15,))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.access_time,color: Colors.black,size: 20,),
                const SizedBox(width: 10,),
                Expanded(
                  child: RichText(text: TextSpan(children: [
                    TextSpan(text: 'The account details is valid for only this transaction and it expires in ',style: Stylings.subTitles),
                    TextSpan(text: '30 mins',style: Stylings.titles.copyWith(fontSize: 11)),
                  ])),
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
              onTap: (){
                Get.to(()=>const Paymentonway());
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(color: Colors.black54,width: 0.0)
                ),
                child: Text("I have paid",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
            const SizedBox(height: 15,),
            GestureDetector(
              onTap: () async {
                await Share.share(
                    "00181789\nGTBank\nJollof Limited");
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Share address",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
