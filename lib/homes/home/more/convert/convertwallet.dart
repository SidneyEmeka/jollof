import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:jollof/server/getxserver.dart';

import '../../../../utils/stylings.dart';

class Convertwallet extends StatefulWidget {
  const Convertwallet({super.key});

  @override
  State<Convertwallet> createState() => _ConvertwalletState();
}

class _ConvertwalletState extends State<Convertwallet> {
  final _amountController = TextEditingController();
  @override
  void initState() {
    Get.find<Jollofx>().getExchangeRate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          "Convert",
          style: Stylings.titles,
        ),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        width: Get.width,
        height: Get.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Get.find<Jollofx>().isLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
            Align(
                alignment: Alignment.center,child: Text("Exchange rate \$1 - ₦${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().dollarToNaira!)}",style: Stylings.titles.copyWith(fontSize: 12),)),
            const Expanded(child: SizedBox()),
            //from
            Text("You are converting",style: Stylings.titles.copyWith(fontSize: 12),),
            const SizedBox(height: 10,),
            Container(
              width: Get.width,
              height: Get.height*0.2,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300,width: 0.0),
                borderRadius: BorderRadius.circular(7)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: Get.width*0.08,
                          height: Get.width*0.08,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: Get.find<Jollofx>().fromCurrency.value=='ngn'?const AssetImage("assets/images/ngflag.png"):const AssetImage("assets/images/usflag.jpeg"),fit: BoxFit.fill)
                          ),
                        ),
                        const SizedBox(width: 12),
                       Get.find<Jollofx>().fromCurrency.value=='ngn'? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NGN",style: Stylings.subTitles.copyWith(fontSize: 15),),
                            Text("Balance - ₦${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().ngnBalance)}",style: Stylings.subTitles.copyWith(fontSize: 10),),
                          ],
                        ):Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text("USD",style: Stylings.subTitles.copyWith(fontSize: 15),),
                           Text("Balance - \$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().usdBalance)}",style: Stylings.subTitles.copyWith(fontSize: 10),),
                         ],
                       ),
                        const Expanded(child: SizedBox()),
                       IconButton(onPressed: (){
                         Get.find<Jollofx>().fromCurrency.value=='usd'?Get.find<Jollofx>().fromCurrency.value='ngn':Get.find<Jollofx>().fromCurrency.value='usd';
                         //print(Get.find<Jollofx>().fromCurrency.value);
                         Get.find<Jollofx>().doConversion(_amountController.text);
                       }, icon:  const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,))
                      ],
                    ),
                  ),
                  Divider(thickness: 0.0,color: Colors.grey.shade300,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        Text("Amount",style: Stylings.titles.copyWith(fontSize: 12,color: Colors.grey.shade400),),
                        Expanded(child: TextField(
                        controller: _amountController,
                          onChanged: (value){
                          Get.find<Jollofx>().doConversion(value);
                          Get.find<Jollofx>().errorText.value='';
                          },
                          textAlign: TextAlign.end,
                          style: Stylings.titles.copyWith(fontSize: 15),
                          cursorColor: Colors.black45,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            suffixText:Get.find<Jollofx>().fromCurrency.value=='usd'? "USD":"NGN",
                              suffixStyle: Stylings.titles.copyWith(fontSize: 12,color: Colors.grey.shade400),
                              hintText: "0.0",
                              hintStyle: Stylings.titles.copyWith(fontSize: 13,color: Colors.grey.shade500),
                              border: InputBorder.none
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Align(alignment: Alignment.center,child:Container(
              height: 28,
              width: 28,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: Icon(FluentIcons.convert_range_24_regular,size: 20,color: Stylings.yellow,),
            ),),
            //to
            Text("To",style: Stylings.titles.copyWith(fontSize: 12),),
            const SizedBox(height: 10,),
            Container(
              width: Get.width,
              height: Get.height*0.2,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300,width: 0.0),
                  borderRadius: BorderRadius.circular(7)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          width: Get.width*0.08,
                          height: Get.width*0.08,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: Get.find<Jollofx>().fromCurrency.value=='ngn'?const AssetImage("assets/images/usflag.jpeg"):const AssetImage("assets/images/ngflag.png"),fit: BoxFit.fill)
                          ),
                        ),
                        const SizedBox(width: 12),
                        Get.find<Jollofx>().fromCurrency.value=='ngn'? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("USD",style: Stylings.subTitles.copyWith(fontSize: 15),),
                            Text("Balance - \$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().usdBalance)}",style: Stylings.subTitles.copyWith(fontSize: 10),),
                          ],
                        ):Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NGN",style: Stylings.subTitles.copyWith(fontSize: 15),),
                            Text("Balance - \$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().ngnBalance)}",style: Stylings.subTitles.copyWith(fontSize: 10),),
                          ],
                        ),
                        const Expanded(child: SizedBox()),
                        IconButton(onPressed: (){
                          Get.find<Jollofx>().fromCurrency.value=='usd'?Get.find<Jollofx>().fromCurrency.value='ngn':Get.find<Jollofx>().fromCurrency.value='usd';
                          //print(Get.find<Jollofx>().fromCurrency.value);

                          Get.find<Jollofx>().doConversion(_amountController.text);
                        }, icon:  const Icon(Icons.arrow_forward_ios,color: Colors.black,size: 15,))
                      ],
                    ),
                  ),
                  Divider(thickness: 0.0,color: Colors.grey.shade300,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        Text("Receive",style: Stylings.titles.copyWith(fontSize: 12,color: Colors.grey.shade400),),
                        const Expanded(child: SizedBox()),
                        Get.find<Jollofx>().fromCurrency.value=='ngn'?Text("\$${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().convertedResult.value)}",style: Stylings.titles.copyWith(fontSize: 20),):Text("₦${NumberFormat.decimalPattern('en').format(Get.find<Jollofx>().convertedResult.value)}",style: Stylings.titles.copyWith(fontSize: 20),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Get.find<Jollofx>().errorText.value==""?const SizedBox(): Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline,size: 11,color: Colors.red,),
                const SizedBox(width: 5),
                Text(Get.find<Jollofx>().errorText.value,style: Stylings.subTitles.copyWith(color: Colors.red),),
              ],
            ),
            const Expanded(flex:3,child: SizedBox()),
            GestureDetector(
              onTap: () {
               if(_amountController.text.isNotEmpty){
                 num theAmount = num.parse(_amountController.text);
                 Get.find<Jollofx>().chcekIfBalanceCovers(theAmount);
               }
               else{
                 Get.snackbar("Invalid Amount", "Please enter an amount");
               }
              },
              child: Container(
                height: Get.height*0.055,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Stylings.yellow
                ),
                child: Text("Continue",style: Stylings.titles.copyWith(fontSize: 12),),
              ),
            ),
          ],
        ),
      ),)
    );
  }
}
