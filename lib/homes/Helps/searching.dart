
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/Helps/readhelpArticle.dart';

import '../../utils/stylings.dart';

class Searching extends StatefulWidget {
  const Searching({super.key});

  @override
  State<Searching> createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  static List<String> allHelpArticles = [
   "I have a problem with a transaction",
   "How to keep my money safe",
   "I have a problem with a transaction",
   "Why is my credit score low",
   "How to improve my savings",
   "Which investment plan is better for me",
   "How to print statement",
   "How to convert between wallets",
   "How to place withdrawals",
   "How to choose an investment plan",
   "How to deposit money",
   "What is subscriptions?",
  ];

  List<String> _foundArticles = [];
  List<String> _previous = [];

  void _runSearch(String keyword) {
    List<String> results = [];

    if (keyword.isEmpty) {
      results = allHelpArticles;
    } else {
      results = allHelpArticles
          .where((article) =>
          article.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundArticles = results;
      _previous = results;
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    _foundArticles = allHelpArticles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            width: Get.size.width,
            height: Get.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                TextFormField(
                  key: const Key("searching"),
                  onChanged: (value) => _runSearch(value),
                  style: Stylings.subTitles,
                  cursorColor: Colors.grey.shade300,
                  decoration: InputDecoration(
                    hintText: "Search",
                    suffixIcon: const Icon(Icons.search,color: Colors.black45,size: 20,),
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
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20,),
                _foundArticles.isNotEmpty
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //suggestion
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Top searches",
                        style: Stylings.titles.copyWith(fontSize: 11,color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    SizedBox(
                      height: Get.size.height * 0.3,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ..._foundArticles.take(5).map((anArticle) {
                              return GestureDetector(
                                onLongPress: (){
                                  Get.bottomSheet(
                                      Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15),
                                          ),
                                          color: Colors.white,
                                        ),
                                        height: Get.size.height*0.15,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: (){
                                               //   Get.to(const Report());
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(left: 16,bottom: 10),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      const Icon(FluentIcons.flag_off_48_regular,color: Colors.black,size: 15,),
                                                      const SizedBox(width: 15,),
                                                      Text("Report",style: Stylings.titles.copyWith(fontSize: 11),)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: GestureDetector(
                                                onTap: (){
                                                  setState(() {
                                                    _foundArticles.remove(anArticle);
                                                    Get.back();
                                                  });
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(left: 16,),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      const Icon(FluentIcons.eye_off_32_regular,color: Colors.black,size: 15,),
                                                      const SizedBox(width: 15,),
                                                      Text("Mark as irrelevant",style: Stylings.titles.copyWith(fontSize: 11),)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  );
                                },
                                child: ListTile(
                                  onTap: (){
                                    Get.to(()=>const Readhelparticle());
                                  },
                                  trailing: IconButton(icon: Icon(FluentIcons.arrow_trending_24_filled,color: Stylings.yellow, size: 15,), onPressed: () {
                                    setState(() {
                                      searchController.text = anArticle;
                                    });
                                  },),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  leading: const Icon(
                                    FluentIcons.search_20_regular,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  isThreeLine: false,
                                  horizontalTitleGap: 0.0,
                                  title: Text(
                                    anArticle,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                    Stylings.titles.copyWith(fontSize: 11),
                                  ),
                                ),
                              );
                            })
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          "Press and hold a suggestion to report it",
                          style: Stylings.titles.copyWith(fontSize: 11, color: Colors.black45),
                        ),
                      ),
                    ),
                    //previous
                    const SizedBox(
                      height: 15,
                    ),
                    _previous.isNotEmpty?Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Previously searched",
                        style: Stylings.titles.copyWith(fontSize: 11,color: Colors.black.withOpacity(0.8)),
                      ),
                    ):Container(),
                    SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          ..._previous.take(3).map((anArticle) {
                            return ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15),
                              leading: const Icon(
                                FluentIcons.history_48_regular,
                                color: Colors.black,
                                size: 15,
                              ),
                              isThreeLine: false,
                              horizontalTitleGap: 0.0,
                              trailing: IconButton(onPressed: (){
                                setState(() {
                                  _previous.remove(anArticle);
                                });
                              }, icon: const Icon(FluentIcons.dismiss_circle_48_regular, color: Colors.black, size: 15,)),
                              title: Text(
                                anArticle,
                                overflow: TextOverflow.ellipsis,
                                style:
                                Stylings.titles.copyWith(fontSize: 11),
                              ),
                            );
                          })
                        ],
                      ),
                    ),
                  ],
                )
                    : Container(
                    alignment: Alignment.bottomCenter,
                    height: Get.size.height*0.4,
                    child: Text("No results...",style: Stylings.subTitles.copyWith(fontSize: 11),)),
              ]
            ),
          )),
    );
  }
}
