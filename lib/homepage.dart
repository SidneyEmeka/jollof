import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homes/Invest/buyplan.dart';
import 'package:jollof/utils/reusables/bnavmorph.dart';
import 'package:jollof/utils/stylings.dart';

import 'homes/home/homescreen.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _UserTimelineState();
}

class _UserTimelineState extends State<Homepage> {
  int selectedIndex = 0;
  Widget buildBody(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return const Homescreen();
      case 1:
        return const Buyplan();
      case 2:
        return const Center();
      case 3:
        return const Center();
      default:
        const Center(
          child: Text("Home"),
        );
        return const Center(
          child: Text("Invalid Page"),
        );
    }
  }

  void onTapNavItem(int index) {
    setState(() {
      selectedIndex = index;
      // print(selectedIndex);
    });
  }

  List<BottomNavigationBarItem> navItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.home_48_regular,size: 20,),
            SizedBox(height: 5,),
            Text("Home",style: Stylings.subTitles.copyWith(fontSize: 8,color: Colors.black),),
          ],
        ),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 40,
        decoration:  BoxDecoration(
          color: Colors.transparent,
         borderRadius: BorderRadius.circular(5),
         border: Border(
           top: BorderSide(color: Stylings.yellow,width: 2)
         )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.home_48_filled,size: 20,),
            SizedBox(height: 5,),
            Text("Home",style: Stylings.subTitles.copyWith(fontSize: 8,color: Stylings.yellow),),

          ],
        ),
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.chart_multiple_24_regular,size: 20,),
            SizedBox(height: 5,),
            Text("Invest",style: Stylings.subTitles.copyWith(fontSize: 8,color: Colors.black),),
          ],
        ),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 40,
        decoration:  BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border(
                top: BorderSide(color: Stylings.yellow,width: 2)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.chart_multiple_24_filled,size: 20,),
            SizedBox(height: 5,),
            Text("Invest",style: Stylings.subTitles.copyWith(fontSize: 8,color: Stylings.yellow),),
          ],
        ),
      ),
      label: "Invest",
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 45,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.arrow_trending_24_regular,size: 20,),
            SizedBox(height: 5,),
            Text("AI Advisor",style: Stylings.subTitles.copyWith(fontSize: 8,color: Colors.black),),
          ],
        ),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 45,
        decoration:  BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border(
                top: BorderSide(color: Stylings.yellow,width: 2)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.arrow_trending_24_filled,size: 20,),
            SizedBox(height: 5,),
            Text("AI Advisor",style: Stylings.subTitles.copyWith(fontSize: 8,color: Stylings.yellow),),
          ],
        ),
      ),
      label: "AI Advisor",
    ),
    BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 40,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.chat_48_regular,size: 20,),
            SizedBox(height: 5,),
            Text("Help",style: Stylings.subTitles.copyWith(fontSize: 8,color: Colors.black),),
          ],
        ),
      ),
      activeIcon: Container(
        padding: const EdgeInsets.only(top: 10),
        width: 40,
        decoration:  BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border(
                top: BorderSide(color: Stylings.yellow,width: 2)
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(FluentIcons.chat_48_filled,size: 20,),
            SizedBox(height: 5,),
            Text("Help",style: Stylings.subTitles.copyWith(fontSize: 8,color: Stylings.yellow),),
          ],
        ),
      ),
      label: "Help",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: selectedIndex,
        onTap: onTapNavItem,
        unselectedItemColor: Colors.black,
        selectedItemColor: Stylings.yellow,
        items: navItems,

      ),
    );
  }
}
