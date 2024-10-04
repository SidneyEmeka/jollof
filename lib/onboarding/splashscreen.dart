import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/onboarding/enter.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> with TickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,
    duration: const Duration(milliseconds: 800),);
    _animation = Tween<double>(begin: 1.0,end: 2.5).animate(_animationController);
    _animationController.forward();
    Future.delayed(const Duration(seconds: 3),(){
      Get.off(()=>const Enterapp());
    });
    super.initState();
  }

  @override
  void dispose() {
    _animation;
    _animationController;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEC706),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         ScaleTransition(scale: _animation,
           child:  SizedBox(
               height: Get.height*0.08,
               width: Get.height*0.08,
               child: Image.asset("assets/images/flog.png",fit: BoxFit.contain,)),),
           const SizedBox(height: 10,),
            ScaleTransition(scale: _animation,
              child: SizedBox(
                height: Get.height*0.08,
                  width: Get.height*0.08,
                  child: Image.asset("assets/images/title.png",fit: BoxFit.contain,)),
            )
          ],
        ),
      ),
    );
  }
}
