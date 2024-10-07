import 'package:get/get.dart';

import '../questionaire/explainer.dart';
import '../questionaire/welcome.dart';

class Jollofx extends GetxController{
  static List<String> avatars = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
    "assets/images/9.png",
    "assets/images/10.png",
    "assets/images/11.png",
    "assets/images/12.png",
    "assets/images/13.png",
    "assets/images/14.png",
    "assets/images/15.png",
    "assets/images/16.png",
  ];
  var avatarIndex = 0.obs;


  var portfolio  = "".obs;


  var questionNum = 1.obs;
  nextPage(){
    if(questionNum<6){
      questionNum++;
    }
    else if(questionNum>=6){
      Get.to(()=>const Explainer());
      questionNum = questionNum-5;
    }
  }

  var percentage = 10.obs;
  var circular = 0.10.obs;
  calcPercent(var val){
    if(val==1){percentage=10.obs;circular=0.10.obs;}
    else if(val==2){percentage=percentage+20;circular=0.30.obs;}
    else if(val==3){percentage=percentage+20;circular=0.50.obs;}
    else if(val==4){percentage=percentage+20;circular=0.70.obs;}
    else if(val==5){percentage=percentage+15;circular=0.85.obs;}
    else if(val==6){percentage=percentage+15;circular=1.0.obs;}
  }

  var answer1 = "".obs;
  var question1 = [
    "I'm seeking higher returns and am willing to accept higher risks.",
    "I value a balance between returns and stability.",
    "I prioritize capital preservation and am risk-averse."];
  var answer2 = "".obs;
  var question2 = [
    "I'm comfortable with some ups and downs.",
    "I prefer stability and am willing to accept minimal fluctuations.",
    "I'm open to moderate changes but cautious about significant swings."];
  var answer3 = "".obs;
  var question3 = [
    "I would stay invested and wait for the market to recover.",
    "I might consider adjusting my portfolio slightly to minimise losses.",
    " I would be concerned and might consider a more conservative approach."];
  var answer4 = "".obs;
  var question4 = [
    "I have a longer-term perspective and can weather market fluctuations.",
    "I have a balanced outlook with both short and medium-term goals.",
    "I prefer shorter-term goals with quicker returns."];
  var answer5 = "".obs;
  var question5 = [
    "I'm well-versed and actively follow market trends.",
    "I have a moderate understanding and keep an eye on key developments.",
    "I'm relatively new and prefer straightforward, low-risk options."];
  var answer6 = "".obs;
  var question6 = [
    "I am open to making adjustments based on market conditions.",
    "I prefer a steady course and may make minimal changes.",
    "I tend to avoid making hasty decisions and would stay the course."];


  var explainer = 1.obs;
  nextExplainer(){
    if(explainer<4){
      explainer++;
    }
    else if(explainer>=4){
      Get.to(()=>const Welcome());
      explainer = explainer-3;
    }
  }


  var addMoneyCurrency  = "USDT".obs;
  var addMoneyAmount  = 0.00.obs;


  var savePaymentMethod = true.obs;


  var plans = [
    {"title":"Standard plan",
    "amount":"299",
    "desc": "Earn 10% profit for 3 months, 25% for 6 months or 55% profit for 12 months. Trades only Bitcoin and Etherum"},
    {"title":"Premium plan",
      "amount":"499",
      "desc": "Earn 15% profit for 3 months, 35% for 6 months or 65% profit for 12 months. Trades only Bitcoin and Etherum"},
    {"title":"VIP plan",
      "amount":"700",
      "desc": "Earn 20% profit for 3 months, 40% for 6 months or 70% profit for 12 months. Trades only Bitcoin and Etherum"},
  ];
  var currentPlanPage = 0.obs;

}