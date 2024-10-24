import 'package:country_picker/country_picker.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/home/userdetails/idimagepreview.dart';
import 'package:jollof/homes/home/userdetails/termsandcondition.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../server/getxserver.dart';
import '../../../utils/reusables/radiolist.dart';
import '../../../utils/stylings.dart';

class Userdetails extends StatefulWidget {
  const Userdetails({super.key});

  @override
  State<Userdetails> createState() => _UserdetailsState();
}

class _UserdetailsState extends State<Userdetails> {
  Future<void> userdob() async{
    DateTime? dob = await showDatePicker(context: context,
      firstDate: DateTime(1940),
      initialDate: DateTime(2006),
      lastDate: DateTime(2007),
    );
    Get.find<Jollofx>().userInfo["dob"] = dob.toString().split(" ")[0];
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   resizeToAvoidBottomInset: false,
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
        "Account Details",
        style: Stylings.titles,
      ),
      centerTitle: true,
      shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
    ),
      body: Obx(() => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //count
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularPercentIndicator(
                      radius: Get.height * 0.024,
                      circularStrokeCap: CircularStrokeCap.round,
                      lineWidth: 4,
                      progressColor: Stylings.yellow,
                      percent: Get.find<Jollofx>().userDetailscircular.value,
                      center: Text(
                        "${Get.find<Jollofx>().userDetailsPercentage.value}%",
                        style: Stylings.titles.copyWith(fontSize: 10),
                      ),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Text(
                        "${Get.find<Jollofx>().userDetails}/6",
                        style: Stylings.titles.copyWith(fontSize: 12),
                      ),
                    )
                  ],
                ),
                const Expanded(child: SizedBox()),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //q1 - country
                      Get.find<Jollofx>().userDetails.value == 1
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Where do you live",
                              style: Stylings.titles.copyWith(fontSize: 20)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "The country where you currently live and pay taxes on your income. More countries will be available over time.",
                              style: Stylings.subTitles),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Country",
                            style: Stylings.titles.copyWith(fontSize: 12),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              showCountryPicker(
                                context: context,
                                showPhoneCode: false,
                                countryListTheme: CountryListThemeData(
                                    flagSize: 20,
                                    bottomSheetHeight: Get.height * 0.8,
                                    searchTextStyle:
                                    Stylings.titles.copyWith(fontSize: 10),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 20),
                                    inputDecoration: InputDecoration(
                                      suffixIcon: Icon(
                                          FluentIcons.search_12_regular,
                                          size: 15,
                                          color: Colors.grey.shade300),
                                      hintText: "Enter country name",
                                      hintStyle: Stylings.titles.copyWith(
                                          fontSize: 12,
                                          color: Colors.grey.shade300),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.transparent)),
                                      isDense: true,
                                      filled: true,
                                      fillColor: Colors.grey.shade100,
                                    ),
                                    textStyle: Stylings.subTitles),
                                // optional. Shows phone code before the country name.
                                onSelect: (Country country) {
                                  Get.find<Jollofx>().userInfo["country"] =
                                  "$country";
                                  Get.find<Jollofx>().userDetailsNextPage();
                                  Get.find<Jollofx>().calcUserDetailsPercent(
                                      Get.find<Jollofx>().userDetails.value);
                                  //print(Get.find<Jollofx>().userInfo);
                                },
                              );
                            },
                            child: Container(
                              width: Get.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  border:
                                  Border.all(color: Colors.grey.shade200)),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Select country",
                                    style:
                                    Stylings.titles.copyWith(fontSize: 12),
                                  ),
                                  const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.black,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                          : Get.find<Jollofx>().userDetails.value == 2
                          ?
                      //q2 - name
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("What's your legal name",
                              style:
                              Stylings.titles.copyWith(fontSize: 20)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "please enter your full legal name. Your legal name should match any form of government ID.",
                              style: Stylings.subTitles),
                          const SizedBox(
                            height: 30,
                          ),
                          //fname
                          TextFormField(
                            key: const Key("firstname"),
                            style: Stylings.subTitles,
                            cursorColor: Colors.grey.shade300,
                            onChanged: (v) {
                              Get.find<Jollofx>().userInfo["firstname"] = v;
                            },
                            decoration: InputDecoration(
                              hintText: "First name",
                              hintStyle: Stylings.subTitles
                                  .copyWith(color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                          //mname
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            key: const Key("middlename"),
                            style: Stylings.subTitles,
                            cursorColor: Colors.grey.shade300,
                            onChanged: (v) {
                              Get.find<Jollofx>().userInfo["othername"] = v;
                            },
                            decoration: InputDecoration(
                              hintText: "Middle name",
                              hintStyle: Stylings.subTitles
                                  .copyWith(color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                          //lname
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            key: const Key("lastname"),
                            style: Stylings.subTitles,
                            cursorColor: Colors.grey.shade300,
                            onChanged: (v) {
                              Get.find<Jollofx>().userInfo["lastname"] = v;
                            },
                            decoration: InputDecoration(
                              hintText: "Last name",
                              hintStyle: Stylings.subTitles
                                  .copyWith(color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
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
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                        ],
                      )
                          : Get.find<Jollofx>().userDetails.value == 3
                          ?
                      //q3 -street address
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Enter your current address",
                              style: Stylings.titles
                                  .copyWith(fontSize: 20)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "please enter your full legal name. Your legal name should match any form of government ID.",
                              style: Stylings.subTitles),
                          const SizedBox(
                            height: 30,
                          ),
                          //street
                          TextFormField(
                            key: const Key("street"),
                            style: Stylings.subTitles,
                            cursorColor: Colors.grey.shade300,
                            onChanged: (v) {
                              Get.find<Jollofx>()
                                  .userInfo["street"] = v;
                            },
                            decoration: InputDecoration(
                              hintText: "Street",
                              hintStyle: Stylings.subTitles.copyWith(
                                  color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                          //city
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            key: const Key("city"),
                            style: Stylings.subTitles,
                            cursorColor: Colors.grey.shade300,
                            onChanged: (v) {
                              Get.find<Jollofx>()
                                  .userInfo["city"] = v;
                            },
                            decoration: InputDecoration(
                              hintText: "City",
                              hintStyle: Stylings.subTitles.copyWith(
                                  color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                          //state
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            key: const Key("state"),
                            style: Stylings.subTitles,
                            cursorColor: Colors.grey.shade300,
                            onChanged: (v) {
                              Get.find<Jollofx>().userInfo["state"] =
                                  v;
                            },
                            decoration: InputDecoration(
                              hintText: "State/Province",
                              hintStyle: Stylings.subTitles.copyWith(
                                  color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                          //postalcode
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            key: const Key("postalcode"),
                            style: Stylings.subTitles,
                            cursorColor: Colors.grey.shade300,
                            onChanged: (v) {
                              Get.find<Jollofx>().userInfo["postalCode"] =
                                  v;
                            },
                            decoration: InputDecoration(
                              hintText: "Postcode/Zipcode",
                              hintStyle: Stylings.subTitles.copyWith(
                                  color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                        ],
                      )
                          : Get.find<Jollofx>().userDetails.value == 4
                          ?
                      //q4 - dob
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date of Birth",
                              style: Stylings.titles
                                  .copyWith(fontSize: 20)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "You must be at least 18 years old, and date must match your government issued ID or passport",
                              style: Stylings.subTitles),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                           key: const Key("dob"),
                            readOnly: true,
                            onTap: userdob,
                            style: Stylings.subTitles,
                            cursorColor: Colors.grey.shade300,
                            onChanged: (v) {
                              Get.find<Jollofx>().userInfo["dob"] =
                                  v;
                            },
                            decoration: InputDecoration(
                              hintText: "DOB : ${Get.find<Jollofx>().userInfo["dob"]}",
                              hintStyle: Stylings.subTitles.copyWith(
                                  color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent)),
                              isDense: true,
                              filled: true,
                              fillColor: Colors.grey.shade100,
                            ),
                          ),
                        ],
                      )
                          : Get.find<Jollofx>().userDetails.value == 5
                          ?
                      //q5 - id
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Verify your identity",
                              style: Stylings.titles
                                  .copyWith(fontSize: 20)),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "As an authorised investment advisor, Jollof must gather your information in accordance with federal law.",
                              style: Stylings.subTitles),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.lock_outline,color: Colors.black,size: 20),
                              const SizedBox(width: 15,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("We protect your data",style: Stylings.titles),
                                    const SizedBox(height: 5),
                                    Text("Your information will not be shared without your permission.",style: Stylings.subTitles,),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RichText(text: TextSpan(
                            children: [
                              TextSpan(text: "Please provide any of the required documents for verification.",style: Stylings.subTitles),
                              TextSpan(text: " Make sure you have good lighting. Follow the command.",style: Stylings.titles.copyWith(fontSize: 12)),
                            ]
                          )),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: (){
                              showModalBottomSheet(context: context,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)
                                    )
                                  ),
                                  showDragHandle: false,
                                  builder: (_){
                                return Container(
                                  width: Get.width,
                                  height: Get.height*0.3,
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)
                                      ),
                                    color: Colors.grey.shade100,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 10),
                                        width: Get.width,
                                        height: Get.height*0.21,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular((20)
                                            ),
                                            color: Colors.white
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                              Get.find<Jollofx>().useCamForId();
                                              },
                                                child: Text("Take Photo",style: Stylings.titles,)),
                                            Divider(thickness: 0.0,color: Colors.grey.shade100,),
                                            GestureDetector(
                                              onTap: (){
                                                Get.find<Jollofx>().useGalleryForId();
                                              },
                                                child: Text("Choose from Camera Roll",style: Stylings.titles,)),
                                            Divider(thickness: 0.0,color: Colors.grey.shade100,),
                                            GestureDetector(
                                                onTap: (){
                                                  Get.find<Jollofx>().useGalleryForId();
                                                },
                                                child: Text("Choose a PDF",style: Stylings.titles,)),
                                          ],
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      GestureDetector(
                                        onTap: (){
                                          Get.back();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: Get.width,
                                          height: Get.height*0.08,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)
                                            ),
                                          ),
                                          child: Text("Cancel",style: Stylings.titles,),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                              width: Get.width,
                              height: Get.height*0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey.shade100,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Drivers License",style: Stylings.subTitles.copyWith(fontSize: 14),),
                                      const Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black,)
                                    ],
                                  ),
                                  Divider(thickness: 0.0,color: Colors.grey.shade300,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Passport",style: Stylings.subTitles.copyWith(fontSize: 14),),
                                      const Icon(Icons.arrow_forward_ios,size: 15,color: Colors.black,)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                          : Get.find<Jollofx>().userDetails.value == 6
                          ?
                      //q6
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Anual income",
                              style: Stylings.titles
                                  .copyWith(fontSize: 20)),
                          Get.find<Jollofx>().isLoading.value==true? LinearProgressIndicator(color: Stylings.yellow,borderRadius: BorderRadius.circular(20),):const SizedBox(),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                              "Can include salary, alimony, social security, investment income e.t.c",
                              style: Stylings.subTitles),
                          const SizedBox(
                            height: 30,
                          ),
                        Container(
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.grey.shade100
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Get.find<Jollofx>().userInfo["annualIncome"] = "zero_to_ten_thousand_dollars";
                                    Get.find<Jollofx>().anualIncome.value = "\$0 - \$10,000";
                                  },child: Radiolist(title: "\$0 - \$10,000", state: Get.find<Jollofx>().anualIncome.value)),
                              GestureDetector(
                                  onTap: (){
                                    Get.find<Jollofx>().userInfo["annualIncome"] = "ten_to_fifly_thousand_dollars";
                                    Get.find<Jollofx>().anualIncome.value = "\$10,000 - \$50,000";
                                  },child: Radiolist(title: "\$10,000 - \$50,000", state: Get.find<Jollofx>().anualIncome.value)),
                              GestureDetector(
                                  onTap: (){
                                    Get.find<Jollofx>().userInfo["annualIncome"] = "fifty_thousand_to_one_hundred_thousand_dollars";
                                    Get.find<Jollofx>().anualIncome.value = "\$50,000 - \$100,000";
                                  },child: Radiolist(title: "\$50,000 - \$100,000", state: Get.find<Jollofx>().anualIncome.value)),
                              GestureDetector(
                                  onTap: (){
                                    Get.find<Jollofx>().userInfo["annualIncome"] = "one_hundred_thousand_to_five_hundred_thousand_dollars";
                                    Get.find<Jollofx>().anualIncome.value = "\$100,000 - \$500,000";
                                  },child: Radiolist(title: "\$100,000 - \$500,000", state: Get.find<Jollofx>().anualIncome.value)),
                              GestureDetector(
                                  onTap: (){
                                    Get.find<Jollofx>().userInfo["annualIncome"] = "five_hundred_thousand_dollars_and_above";
                                    Get.find<Jollofx>().anualIncome.value = "\$500,000 and above";
                                  },child: Radiolist(isLast: true,title: "\$500,000 and above", state: Get.find<Jollofx>().anualIncome.value)),

                            ],
                          ),
                        )
                        ],
                      )
                          :
                      //q7
                      const SizedBox(),
                    ],
                  ),
                ),
                const Expanded(child: SizedBox()),
              ],
            ),
          )),
      bottomNavigationBar: Obx(()=>BottomAppBar(
        height: Get.height*0.08,
        color: Colors.transparent,
        child:  Get.find<Jollofx>().userDetails.value == 1
            ? Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Stylings.yellow),
              child: const Icon(
                FluentIcons.chat_48_regular,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
        )
            : Get.find<Jollofx>().userDetails.value == 5
            ? const SizedBox(): Get.find<Jollofx>().userDetails.value == 6
          ?GestureDetector(
          onTap: () {
            Get.find<Jollofx>().isLoading.value=true;
            //print(Get.find<Jollofx>().userInfo);
           Future.delayed(const Duration(seconds: 2),(){
             Get.find<Jollofx>().updateUserProfile(Get.to(()=>const Termsandcondition()));
           }).then((v){
             Get.find<Jollofx>().userDetailsNextPage();
             Get.find<Jollofx>().calcUserDetailsPercent(
                 Get.find<Jollofx>().userDetails.value);
           });
          },
          child: Container(
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Stylings.yellow),
            child: Text(
              "Finish",
              style: Stylings.titles.copyWith(fontSize: 12),
            ),
          ),
        )
            : GestureDetector(
          onTap: () {
           // print(Get.find<Jollofx>().userInfo);
            Get.find<Jollofx>().userDetailsNextPage();
            Get.find<Jollofx>().calcUserDetailsPercent(
                Get.find<Jollofx>().userDetails.value);
          },
          child: Container(
            width: Get.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Stylings.yellow),
            child: Text(
              "Next",
              style: Stylings.titles.copyWith(fontSize: 12),
            ),
          ),
        ),
      ),)
    );
  }
}
