import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jollof/homes/home/more/convert/convertwallet.dart';
import 'package:jollof/homes/home/notifications/allnotifications.dart';
import 'package:jollof/homes/home/settings/allsettings.dart';
import 'package:jollof/homes/home/tipsandtricks/alltipsandtricks.dart';
import 'package:jollof/homes/home/userdetails/userdetails.dart';
import 'package:jollof/paymentwebview.dart';
import 'package:jollof/questionaire/addmoney.dart';
import 'package:jollof/server/apiclient.dart';
import 'package:jollof/utils/reusables/cryptorank.dart';
import 'package:jollof/utils/reusables/investmenttile.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../server/getxserver.dart';
import '../../utils/reusables/balancecards.dart';
import '../../utils/reusables/layoutcalc.dart';
import '../../utils/stylings.dart';
import 'more/statement/choosestatemmentperiod.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    Get.find<Jollofx>().feedHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
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
          "Hello ${Get.find<Jollofx>().validatedlastName}",
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
        padding: const EdgeInsets.only(top: 20),
        width: Get.width,
        height: Get.height,
        child: ListView(
          children: [
            //userdetailssurvey
            Get.find<Jollofx>().validatedlastName.value!=""?const SizedBox():GestureDetector(
              onTap: (){
                Get.to(()=>const Userdetails());
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10,right: 10,bottom: 15),
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade50
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(child: CircularPercentIndicator(
                      radius: Get.height*0.025,percent: 0.1,
                      circularStrokeCap: CircularStrokeCap.round,
                      backgroundColor: Colors.grey.shade200,
                      center: Text("5%",style: Stylings.titles.copyWith(fontSize: 8),),progressColor: Stylings.yellow,),),
                    const Expanded(child: SizedBox()),
                    SizedBox(
                      width: Get.width*0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Welcome to Jollof",style: Stylings.titles.copyWith(fontSize: 12),),
                          const SizedBox(height: 5),
                          Text("The first step is to set up your account. It only takes 2 minutes.",style: Stylings.subTitles.copyWith(color: Colors.grey.shade400,fontSize: 10),)
                        ],
                      ),
                    ),
                    const Expanded(flex:2,child: SizedBox()),
                    const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,)

                  ],
                ),

              ),
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Balancecards(
                    thecolor: Stylings.yellow,
                    type: 'USD', balance: Get.find<Jollofx>().usdBalance, currency: '\$',
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                   Balancecards(
                    thecolor: Colors.green,
                    type: 'NGN', balance: Get.find<Jollofx>().ngnBalance, currency: '₦',
                  )
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //add money
                  GestureDetector(
                    onTap: (){
                     Get.to(()=>const Addmoney());
                      },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.wallet_credit_card_48_regular,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Add money",
                          style: Stylings.subTitles.copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  //withdraw
                  GestureDetector(
                    onTap: (){
                      print(Get.find<Jollofx>().userTokens);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.money_hand_24_regular,
                          size: 20,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "Withdraw",
                          style: Stylings.subTitles.copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                  //discover
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        FluentIcons.compass_northwest_28_regular,
                        size: 20,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        height: 1,
                      ),
                      Text(
                        "Discover",
                        style: Stylings.subTitles.copyWith(fontSize: 10),
                      )
                    ],
                  ),
                  //more
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.grey.shade100,
                          enableDrag: true,
                          builder: (_){
                            return Container(
                              width: Get.width,
                              height: Get.height*0.4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children:[
                                    Container(
                                      width: Get.width,
                                      height: Get.height*0.07,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                                          color: Colors.white
                                      ),
                                      alignment: Alignment.center,
                                      child: Text("Choose Option",style: Stylings.titles.copyWith(fontSize: 11),),
                                    ),
                                    const Expanded(child: SizedBox()),

                                    Container(
                                      margin: const EdgeInsets.symmetric(horizontal: 15),
                                      width: Get.width,
                                      height: Get.height*0.2,
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          //convert
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                Get.back();
                                                Get.find<Jollofx>().isLoading.value=true;
                                                Get.to(()=>const Convertwallet());
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                 const Icon(FluentIcons.convert_range_24_regular,size: 17,color: Colors.black,),
                                                  const SizedBox(width: 10),
                                                  Text("Convert",style: Stylings.titles.copyWith(fontSize: 12),),
                                                  const Expanded(child: SizedBox()),
                                                  const Icon(FluentIcons.ios_chevron_right_20_regular,size: 17,color: Colors.black,),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Divider(color: Colors.grey.shade100,thickness: 1,)),
                                          //statment
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                Get.back();
                                                Get.to(()=>const Choosestatemmentperiod());
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(FluentIcons.list_28_regular,size: 17,color: Colors.black,),
                                                  const SizedBox(width: 10),
                                                  Text("Statement",style: Stylings.titles.copyWith(fontSize: 12),),
                                                  const Expanded(child: SizedBox()),
                                                  const Icon(FluentIcons.ios_chevron_right_20_regular,size: 17,color: Colors.black,),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(child: Divider(color: Colors.grey.shade100,thickness: 1,)),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                Get.find<Jollofx>().addMoneyCurrency.value = "Dollar";
                                                Get.back();
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  const Icon(FluentIcons.person_support_32_regular,size: 17,color: Colors.black,),
                                                  const SizedBox(width: 10),
                                                  Text("Feedback",style: Stylings.titles.copyWith(fontSize: 12),),
                                                  const Expanded(child: SizedBox()),
                                                  const Icon(FluentIcons.ios_chevron_right_20_regular,size: 17,color: Colors.black,),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Expanded(child: SizedBox()),
                                    GestureDetector(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 15),
                                        height: Get.height*0.055,
                                        width: Get.width,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                            color: Colors.white
                                        ),
                                        child: Text("Cancel",style: Stylings.titles.copyWith(fontSize: 12),),
                                      ),
                                    ),
                                    const SizedBox(height: 10,),
                                  ]
                              ),
                            );
                          });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.more_horizontal_48_filled,
                          size: 19,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 1,
                        ),
                        Text(
                          "More",
                          style: Stylings.subTitles.copyWith(fontSize: 10),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.035),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "My Portfolio",
                    style: Stylings.titles.copyWith(fontSize: 12),
                  ),
                  const Expanded(child: SizedBox()),
                  const Icon(
                    Icons.add_circle_outline,
                    size: 13,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Portfolio builder",
                    style: Stylings.titles.copyWith(fontSize: 10),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            //investments
            Get.find<Jollofx>().userInvestments.isEmpty?const SizedBox():Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              width: Get.width,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(10),
                  color: Stylings.bgColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...Get.find<Jollofx>().userInvestments.map((inv){
                    final invRate = inv['interest_rate'];
                    final duration = inv['duration'];
                    final amount = inv['amount_invested'];
                    return Investmenttile(invRate: invRate, duration: duration, amount: amount);
                  })
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            //crypto
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: Get.width,
            //  height: Get.height * 0.32,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(10),
                  color: Stylings.bgColor),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //btc
                  Cryptorank(imgUrl: "assets/images/btc.png", percent: Get.find<Jollofx>().btcPercentChange.toDouble(), price: NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().btcPrice.value), name: "Bitcoin", slug: "BTC"),
                  //eth
                  Cryptorank(imgUrl: "assets/images/eth.png", percent: Get.find<Jollofx>().ethPercentChange.toDouble(), price: NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().ethPrice.value), name: "Etherum", slug: "ETH"),
                  //ada
                  Cryptorank(isLast: true,imgUrl: "assets/images/ada.png", percent: Get.find<Jollofx>().adaPercentChange.toDouble(), price: NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().adaPrice.value), name: "Cardano", slug: "ADA"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //tips and tricks
            GestureDetector(
              onTap: (){
                Get.find<Jollofx>().isLoading.value=true;
                Get.find<Jollofx>().getTipsandTricks();
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                width: Get.width,
                height: Get.height * 0.3,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(10),
                    color: Stylings.bgColor),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      width: Get.width,
                      height: Get.height*0.1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tips and Tricks",style: Stylings.titles.copyWith(fontSize: 12),),
                          Text("Boost your crypto knowledge and unlock exclusive rewards",style: Stylings.subTitles.copyWith(fontSize: 10)),
                        ],
                      ),
                    ),
                    Layoutcalc(randomDiv: 5, theCol: Colors.grey.shade400,),
                    const Expanded(child: SizedBox()),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //circular
                          Stack(
                            children: [
                              CircularPercentIndicator(radius: Get.height*0.04,lineWidth: 11,
                                circularStrokeCap: CircularStrokeCap.round,percent: 0.23,
                                progressColor: Stylings.yellow,
                                backgroundColor: Colors.transparent,),
                              CircularPercentIndicator(radius: Get.height*0.04,lineWidth: 11,
                                circularStrokeCap: CircularStrokeCap.round,percent: 0.16,
                                progressColor: Colors.green,
                                startAngle: 110,
                                backgroundColor: Colors.transparent,),
                              CircularPercentIndicator(radius: Get.height*0.04,lineWidth: 11,
                                circularStrokeCap: CircularStrokeCap.round,percent: 0.38,
                                startAngle: 195,
                                progressColor: Colors.purple,
                                backgroundColor: Colors.transparent,)
                            ],
                          ),
                          const SizedBox(width: 15,),
                          //details
                          SizedBox(
                            height: Get.height*0.08,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.circle,color: Colors.purple,size: 10,),
                                    const SizedBox(width: 10,),
                                    RichText(text: TextSpan(
                                        children: [
                                          TextSpan(text: "50% ",style: Stylings.titles.copyWith(fontSize: 10)),
                                          TextSpan(text: "Growth on your investment",style: Stylings.subTitles.copyWith(fontSize: 10)),
                                        ]
                                    ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.circle,color: Stylings.yellow,size: 10,),
                                    const SizedBox(width: 10,),
                                    RichText(text: TextSpan(
                                        children: [
                                          TextSpan(text: "30% ",style: Stylings.titles.copyWith(fontSize: 10)),
                                          TextSpan(text: "Value on your portfolio",style: Stylings.subTitles.copyWith(fontSize: 10)),
                                        ]
                                    ))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.circle,color: Colors.green,size: 10,),
                                    const SizedBox(width: 10,),
                                    RichText(text: TextSpan(
                                        children: [
                                          TextSpan(text: "20% ",style: Stylings.titles.copyWith(fontSize: 10)),
                                          TextSpan(text: "Fixed ROI",style: Stylings.subTitles.copyWith(fontSize: 10)),
                                        ]
                                    ))
                                  ],
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
                        color: Colors.grey.shade300,
                      ),
                      child: Text("View all tips",style: Stylings.titles.copyWith(fontSize: 12),),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
