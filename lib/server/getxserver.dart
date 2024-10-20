import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jollof/homepage.dart';
import 'package:jollof/homes/Invest/investmentprevgraph.dart';
import 'package:jollof/homes/home/more/convert/convertsuccesspage.dart';
import 'package:jollof/homes/home/more/convert/reviewconversiondetails.dart';
import 'package:jollof/homes/home/more/statement/allstatements.dart';
import 'package:jollof/homes/home/tipsandtricks/atipfullread.dart';
import 'package:jollof/homes/home/userdetails/idimagepreview.dart';
import 'package:jollof/questionaire/paymentpreview.dart';
import 'package:jollof/questionaire/questions.dart';

import '../homes/Invest/chooseduration.dart';
import '../homes/home/tipsandtricks/alltipsandtricks.dart';
import '../homes/home/userdetails/termsandcondition.dart';
import '../model/tipmodel.dart';
import '../onboarding/awaitverification.dart';
import '../onboarding/emailverified.dart';
import '../onboarding/setavatar.dart';
import '../onboarding/setnotification.dart';
import '../paymentwebview.dart';
import '../questionaire/explainer.dart';
import '../questionaire/paymentmethod.dart';
import '../questionaire/pyamentonway.dart';
import '../questionaire/welcome.dart';
import 'apiclient.dart';

class Jollofx extends GetxController{
  var obscure = true.obs;
  //date formatter to how mamny days or hours ago
  getRelativeTime(String isoString) {
    // Parse the ISO 8601 string to DateTime
    DateTime dateTime = DateTime.parse(isoString);

    // Get the current time
    DateTime now = DateTime.now().toUtc();

    // Calculate the difference
    Duration difference = now.difference(dateTime);

    if (difference.inDays > 365) {
      return "${difference.inDays ~/ 365} ${difference.inDays ~/ 365 == 1 ? 'year' : 'years'} ago";
    } else if (difference.inDays > 30) {
      return "${difference.inDays ~/ 30} ${difference.inDays ~/ 30 == 1 ? 'month' : 'months'} ago";
    } else if (difference.inDays > 0) {
      return "${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'} ago";
    } else {
      return "just now";
    }
  }

  //date formaterr to dd/mm/yy
  dateFormat(String theDate){
    String dateTimeString = theDate;
    DateTime dateTime = DateTime.parse(dateTimeString);

    // Create a DateFormat object with the desired format
    DateFormat formatter = DateFormat('d, MMMM yyyy');

    // Format the date and time
    String formattedDateTime = formatter.format(dateTime);
    return formattedDateTime;
   // print(formattedDateTime);
  }

  var avatarIndex = 50.obs;


  var portfolio  = "".obs;

//questionanire
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

  var questionIndicator = "".obs;
  var answer1 = "".obs;
  var question1 = {
    "I'm seeking higher returns and am willing to accept higher risks.":"higher_returns_and_higher_risk",
    "I value a balance between returns and stability.":"balance_between_returns_and_stability",
    "I prioritize capital preservation and am risk-averse.":"capital_preservation_and_risk_averse"};
  var answer2 = "".obs;
  var question2 = {
    "I'm comfortable with some ups and downs.":"comfortable_with_some_ups_and_downs",
    "I prefer stability and am willing to accept minimal fluctuations.":"stability_and_willing_to_accept_minimal_fluction",
    "I'm open to moderate changes but cautious about significant swings.":"moderate_changes_but_caution_about_significant_changes"};
  var answer3 = "".obs;
  var question3 = {
    "I would stay invested and wait for the market to recover.":"stay_invented_and_wait_for_market_recovery",
    "I might consider adjusting my portfolio slightly to minimise losses.":"consider_adjusting_portfilio_slightly_to_minimal_losses",
    " I would be concerned and might consider a more conservative approach.":"consider_a_more_conservative_approach"};
  var answer4 = "".obs;
  var question4 = {
    "I have a longer-term perspective and can weather market fluctuations.":"long_term_and_can-weather_market_fluction",
    "I have a cbalanced outlook with both short and medium-term goals.":"have_balance_outlook_with_both_short_term_and_medium_term_goals",
    "I prefer shorter-term goals with quicker returns.":"short_term_goals_with_quicker_returns"};
  var answer5 = "".obs;
  var question5 = {
    "I'm well-versed and actively follow market trends.":"well_versed_and_actively_follow_market_trends",
    "I have a moderate understanding and keep an eye on key developments.":"moderate_understanding_and_keeps_an_eye_on_key_developments",
    "I'm relatively new and prefer straightforward, low-risk options.":"relatively_new_and_prefer_straightforward_low_risk_options"};
  var answer6 = "".obs;
  var question6 = {
    "I am open to making adjustments based on market conditions.":"open_to_market_adjustments_based_on_market_conditions",
    "I prefer a steady course and may make minimal changes.":"steady_course_and_makes_minimal_changes",
    "I tend to avoid making hasty decisions and would stay the course.":"avoid_making_hasty_decisions_and_would_stay_the_course"};


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


//user details
  var userDetailsCollected = false.obs;
  var userDetails = 1.obs;
  userDetailsNextPage(){
    if(userDetails<6){
      userDetails++;
    }
    else if(userDetails>=6){
      Get.to(()=>const Termsandcondition());
      userDetails = userDetails-5;
    }
  }

  var userDetailsPercentage = 10.obs;
  var userDetailscircular = 0.10.obs;
  calcUserDetailsPercent(var val){
    if(val==1){userDetailsPercentage=10.obs;userDetailscircular=0.10.obs;}
    else if(val==2){userDetailsPercentage=userDetailsPercentage+20;userDetailscircular=0.30.obs;}
    else if(val==3){userDetailsPercentage=userDetailsPercentage+20;userDetailscircular=0.50.obs;}
    else if(val==4){userDetailsPercentage=userDetailsPercentage+20;userDetailscircular=0.70.obs;}
    else if(val==5){userDetailsPercentage=userDetailsPercentage+10;userDetailscircular=0.80.obs;}
    else if(val==6){userDetailsPercentage=userDetailsPercentage+20;userDetailscircular.value=1;}
  }

  var userInfo = {
    "firstname": "",
    "lastname": "",
    "othername": "",
    "country": "",
    "city": "",
    "street": "",
    "state": "",
    "postalCode": "",
    "dob": "",
    "annualIncome": "zero_to_ten_thousand_dollars",
    "investmentType": "fix_investment",
    "pin": "",
    "allowNotifications": true,
    "avatar": "fineboy"
  };


  File? file;
  ImagePicker image = ImagePicker();
  useCamForId() async{
    var theImg = await image.pickImage(source: ImageSource.camera);
    file = File(theImg!.path);
    Get.to(()=>const Idimagepreview());
  }

  useGalleryForId() async{
    var theImg = await image.pickImage(source: ImageSource.gallery);
    file = File(theImg!.path);
    Get.to(()=>const Idimagepreview());
  }

  var processingIdCheck = 0.obs;
  processImageIndicators(){
    processingIdCheck = 0.obs;
    if(processingIdCheck<4){
    //  print(processingIdCheck);
      Future.delayed(const Duration(seconds: 5),(){
        processingIdCheck++;
       // print(processingIdCheck);
      });
      Future.delayed(const Duration(seconds: 3),(){
        processingIdCheck++;
        //print(processingIdCheck);
      });
      Future.delayed(const Duration(seconds: 2),(){
        processingIdCheck++;
       // print(processingIdCheck);
      });
    }
    else{processingIdCheck = 0.obs;
    print(processingIdCheck);}
  }

  var anualIncome = "".obs;

  var termsRead =  false.obs;


  ///API MAINS////////////

  ///TO-DO Refresh token
  //how many refreshes
  //Timer? _timer;
  // void startTimer() {
  // _timer = Timer.periodic(Duration(seconds: 3500), (timer) {
  //     call refreshtoken api and
  //https://jollof.tatspace.com/api/v1/auth/token/refresh POST and then use returned value
  //{
  //     "message": "[Success]: Access token refreshed successfully.",
  //     "statusCode": 200,
  //     "data": {
  //         "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MGFiMTUzNjU4YjFjZWE5MTZjMTZlMiIsImVtYWlsIjoibUB5b3BtYWlsLmNvbSIsInJvbGVzIjpbInVzZXIiXSwicHJvbW9Db2RlIjoiSk9MTE9GLVJMUi05MjgiLCJpYXQiOjE3Mjg3NTQwOTMsImV4cCI6MTcyODc1NzY5MywiaXNzIjoiam9sbG9mLmNvbSJ9.c9bWBaid2VpLRltygteT16KCOuaQp2qQv8JqZwqP5BA",
  //         "expiresIn": 3600
  //     }

  //     to set the new access token
  //userToken["accessToken"] = thenvalue@accessTokens
  //   });
  // }
  @override
  void onInit() {
    ///Implement worker that refreshes token every 3500 seconds cos tokens expires in 3600 seconds
    //every time the token map stops being null or has data
    // ever(userTokens, (_) {
    // startTimer();
    //   print('yes');
    // });
    // // Start the timer
    super.onInit();
  }

  ///dispose timer to avoid mem leaks
  // @override
  // void onClose() {
  //   _timer?.cancel();
  //   super.onClose();
  // }


  ///Auths///
  var isLoading = false.obs;
  var secondIsLoading = false.obs;
  var errorText = ''.obs;
  var postSuccessReturn = {}.obs;
  var validatedUserEmail = ''.obs;
  var validatedUserAvatar = ''.obs;
  var validatedlastName = ''.obs;
  var validatedfirstName = ''.obs;
  var userTokens = {}.obs;
  var statusCode = 0.obs;

//device info
  var devId = '';
  Future<String> getDeviceIdentifier() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String identifier = '';

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      devId = androidInfo.id; // This is not a persistent ID on newer Android versions
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      devId = iosInfo.identifierForVendor!; // This will change if all the app's from the vendor are uninstalled
    }
    print(devId);
    return devId;
  }

  //register
  signUP(String userEmail) {
    if(!userEmail.contains("@")){
      errorText.value = "Invalid Email Address";
      Future.delayed(const Duration(seconds: 1),(){
        isLoading.value=false;
      });
    }
      else{
        //register
      Apiclientserver().makePostRequest(url:"https://jollof.tatspace.com/api/v1/auth/sign-up", body:{
        "email": userEmail,
        "deviceToken": devId
      });
      Future.delayed(const Duration(seconds: 2),(){
        if(statusCode.value==0){
          isLoading.value = false;
          errorText.value = "";
          validatedUserEmail.value =userEmail;
          Get.to(()=>const Awaitverification());
          //send otp
        }
        else {
         // print(errorText);
          isLoading.value = false;
        }
      });
    }
  }

  //request opt resend
  requestOTPresend(){
    Future.delayed(const Duration(seconds: 1),(){
      Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/auth/sign-up/otp/request?email=$validatedUserEmail").then((g){
        isLoading.value=false;
        Get.snackbar("OTP Request", "OTP sent succesfully");
        errorText.value = "";
      });
    });
     }

  //verifyOTP
  verifyOTP(String otp) {
Apiclientserver().makePostRequest(url:"https://jollof.tatspace.com/api/v1/auth/sign-up/otp/verify", body:{
  "email": validatedUserEmail.value,
  "code": otp
}).then((p){
  Future.delayed(const Duration(seconds: 1),(){
    if(statusCode.value==0){
      //to get tokens and id
      final mainKey = p['data'];
      userTokens.value = {
        'id':mainKey['user']["id"],
        'promoCode':mainKey['user']["promoCode"],
        'accessToken':mainKey['credentials']["accessToken"],
        'refreshToken':mainKey['credentials']["refreshToken"],
        'expiresIn':mainKey['credentials']["expiresIn"],
      };
      isLoading.value = false;
      errorText.value = "";
      Get.off(()=>const Emailverified());
    }
    else{
      isLoading.value = false;
    }
  });
});
}

//pintoPassword
 var userPin = '';
  passwordPinSet(String fPin){
    if(fPin!=userPin){
      errorText.value = "Pin does not match";
      Future.delayed(const Duration(seconds: 1),(){
        isLoading.value = false;
      });

    }
    else{
      errorText.value = "";
      Get.find<Jollofx>().userInfo["pin"] = fPin;
      Future.delayed(const Duration(seconds: 2),(){
        //updatepassword api
        Apiclientserver().makePostRequest(url:"https://jollof.tatspace.com/api/v1/auth/password/update", body: {
          "email": validatedUserEmail.value,
          "password": userPin,
          "repeatPassword": userPin
        }).then((p){
          //print(p);
          print(userInfo);
          isLoading.value = false;
        });
       Get.to(()=>const Setavatar());
      });

    }
  }

 var apiAvatars = [];
  //getAvatars
 getAllAvatars(){
    Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/avatar/filter").then((a){
      print(statusCode);
      if(statusCode.value==0){
        final avatarMapsList = a["data"];
        apiAvatars = avatarMapsList;
       // print(apiAvatars);
        Future.delayed(const Duration(seconds: 1),(){
          isLoading.value = false;
        });
      }
      //print(a["data"]);
    });
 }
 
 //login
 signIn(String theEmail, String thePin){
   if(theEmail.isEmpty||thePin.isEmpty){
     errorText.value = "Please fill the required form";
     isLoading.value=false;
   }
   else{
     Apiclientserver().makePostRequest(url:"https://jollof.tatspace.com/api/v1/auth/sign-in", body: {
       "email": theEmail,
       "pin": thePin,
       "deviceToken": devId
     }).then((l){
       //print(l);
       if(statusCode.value==0){
         final mainKey = l['data'];
         //print(mainKey);
         final imgUrl = mainKey['user']["avatarImage"];
         final firstName = mainKey['user']["firstname"];
         final lastName = mainKey['user']["lastname"];
         final email = mainKey['user']["email"];
         final promoCode = mainKey['user']["promoCode"];
         //print(a?["data"]["avatarImageUrl"]);
         validatedUserAvatar.value = imgUrl;
         validatedfirstName.value = firstName;
         validatedlastName.value = lastName;
         validatedUserEmail.value = email;
         userTokens.value = {
           'id':mainKey['user']["id"],
           'promoCode':mainKey['user']["promoCode"],
           'accessToken':mainKey['credentials']["accessToken"],
           'refreshToken':mainKey['credentials']["refreshToken"],
           'expiresIn':mainKey['credentials']["expiresIn"],
         };
         isLoading.value=false;
         errorText.value = "";
         //to avoid repeating questionaire.
        validatedlastName.value==''? Get.to(()=>const Questions()):Get.to(()=>const Homepage());
       }
       else{
         isLoading.value=false;
       }});
   }
 }

 //submitQuestions
 submitQuestionaire(){
   // print(answer1,);
   // print(answer2,);
   // print(answer3,);
   // print(answer4,);
   // print(answer5,);
   // print(answer6,);
  

   Apiclientserver().makePostRequest(url: "https://jollof.tatspace.com/api/v1/user/questionare/submit", body: {
     'investmentRiskPreference': answer1.value,
     'shortTermInvestmentFluctionReaction': answer2.value,
     'investmentTemporaryDeclineReaction': answer3.value,
     'investmentAchievementPreferedTimeline': answer4.value,
     'investmentMarketExperience': answer5.value,
     'inclinationRegardingMarketDecisions': answer6.value,
   },).then((q){
     isLoading.value=false;
     nextPage();
     calcPercent(questionNum.value);
   });
 }
 
 //updateProfile
updateUserProfile(Future<dynamic>? toWhere){
   Apiclientserver().makePatchRequest("https://jollof.tatspace.com/api/v1/user/update", userInfo).then((a){
    if(statusCode.value==0){
      print(a);
     // print(userTokens);
     // print(userInfo);
     final imgUrl = a["data"]["avatarImageUrl"];
     final lastName = a["data"]["lastname"];
      //print(a?["data"]["avatarImageUrl"]);
     validatedUserAvatar.value = imgUrl;
     validatedlastName.value = lastName;
      //print('Set to '+a?["data"]["avatarImageUrl"]);
      secondIsLoading.value=false;
     toWhere!;
    }
    else{
      secondIsLoading.value=false;
    }
   });
}


///TipsandTricks///
//TipsAndTricks
var apiTips = [].obs;
 var isLiked = false.obs;
//getTipsandTricks
getTipsandTricks(){
  Get.to(()=>const Alltipsandtricks());
   Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/tips/filter?sortBy=createdAt&orderBy=asc&page=1&limit=5").then((t){
     //print(t);
     if(statusCode.value==0){
       final tip = tipFromJson(jsonEncode(t));
       apiTips.value = tip.data;
       // print(1);
       isLoading.value=false;
       // print(2);
     }
     else{
       isLoading.value=false;
     }
   });
}

//togetaparticulartip
  readATipFully(String tipId){
    Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/tips/$tipId").then((t){
     // print(t['data']);
      if(statusCode.value==0){
        isLoading.value=false;
        Get.to(()=>Atipfullread(whichTip: t['data']));
      }
      else{
        isLoading.value=false;
      }
      // print(2);
    });
  }

///immplemment permanency
var likedorUnlikedId = [""].obs;
  //tolikeorUnlikeAtip
likeATip(String id){
  Apiclientserver().makePutRequest("https://jollof.tatspace.com/api/v1/tips/like", id).then((l){
   // print(l['data']["post"]);
    if(statusCode.value==0){
      print("liked");
      likedorUnlikedId.add(l['data']["post"]);
    }
  });
}

//toUnlikeAtip
  unlikeATip(String id){
    Apiclientserver().makePutRequest("https://jollof.tatspace.com/api/v1/tips/unlike", id).then((u){
      if(statusCode.value==0){
        print("unliked");
        likedorUnlikedId.remove(u['data']["post"]);
      }
    });
  }


  
  ///FeedingHomepage///
  //Feed home page
  feedHome(){
  getWalletDetails();
  getUserInvestments();
  Future.delayed(const Duration(seconds: 1),(){
    feedCrypto();
  });
  }

  //WalletApi
   dynamic usdBalance = 20;
  dynamic ngnBalance = 50000;
getWalletDetails(){
  Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/wallet").then((w){
    if(statusCode.value==0){
      final data = w['data'];
      usdBalance = data['usdBalance'];
      ngnBalance = data['ngnBalance'];
      print("wallet retrieved");
    }
  });
}

  //crypyoapi
  var apiData = [].obs;
  var btcPrice = 61866.72346429836.obs;
  var btcPercentChange = 0.6628.obs;
  var ethPrice = 2435.344120492847.obs;
  var ethPercentChange = 0.0148.obs;
  var adaPrice = 0.342159264285.obs;
  var adaPercentChange = 2.5879.obs;
  feedCrypto(){
    Apiclientserver().getCrypto().then((v){
      apiData.value = v['data'];
      btcPrice.value = v['data'][0]["values"]["USD"]["price"];
      btcPercentChange.value = v['data'][0]["values"]["USD"]["percentChange24h"];
      adaPrice.value = v['data'][2]["values"]["USD"]["price"];
      adaPercentChange.value = v['data'][2]["values"]["USD"]["percentChange24h"];
      ethPrice.value = v['data'][1]["values"]["USD"]["price"];
      ethPercentChange.value = v['data'][1]["values"]["USD"]["percentChange24h"];
      print("Crypto fed");
    });
    // Apiclientserver().pingTatspace();
  }


  ///notifications///
  var userNotifications = [].obs;
//getUserActivites
getAllNotifications(){
    Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/notification/activities?page=1&limit=10").then((n){
      if(statusCode.value==0){
        print(n['data']);
        userNotifications.value=n['data'];
        isLoading.value=false;
      }
      else{
        isLoading.value=false;
      }
    });
}


///PAYMENTSS///
   var addMoneyCurrency  = "Dollar".obs;
   dynamic addMoneyAmount  = 0;
  var savePaymentMethod = true.obs;

   var theCurrency = "usd";
  formatCurrency(){
    if(addMoneyCurrency.value=="Dollar"){
      theCurrency = "usd";
    }
    else if(addMoneyCurrency.value=="Naira"){
      theCurrency = "ngn";
    }
  }
//to ensure amounts and currencies are valid before choosing payment method
   paymentPayloadCheck(){
     formatCurrency();
     if(theCurrency=="ngn"&&addMoneyAmount<100){
      errorText.value = "Minimum Naira deposit is 100 NGN";
     }
     else if(theCurrency=="usd"&&addMoneyAmount<10){
       errorText.value = "Minimum Dollar deposit is 10 USD";
     }
     else{
       errorText.value = "";
       Get.to(()=>const Paymentpreview());
        }
   }

   var timeOfTopUP = '';
   var idOfTopUp = '';
   //manual wallet topup without going through squad
  manualTopUP(){
    Apiclientserver().makePostRequest(url: "https://jollof.tatspace.com/api/v1/wallet/manual/topup", body: {
      "email": validatedUserEmail.value,
      "amount": addMoneyAmount,
      "currency": theCurrency
    }).then((m){
      //print(m);
      if(statusCode.value==0){
        final time = m['data']['createdAt'];
        final id = m['data']['_id'];
        timeOfTopUP = time;
        idOfTopUp = id;
        isLoading.value=false;
        //print(timeOfTopUP);
       Get.to(()=>const Paymentonway());
      }
      else{
        isLoading.value=false;
      }
    });
  }

//initializepayment i.e for paying in local currencies  dollar/naira
  initiatePaymentMethod() {
    Apiclientserver().makePostRequest(url: "https://jollof.tatspace.com/api/v1/payment/initialize", body:
    {
      "amount": addMoneyAmount,
      "type": "checkout",
      "currency": theCurrency,
      "provider": "squadco"
    }).then((p){
      if(statusCode.value==0){
       // print(p["data"]['paymentLink']);
        final url = p["data"]['paymentLink'];
        isLoading.value=false;
      Get.to(()=>Paymentwebview(checkoutUrl: "$url", callbackUrl: "$url"));
      }
      else{
        isLoading.value=false;
      }
    });
  }



  ///Conversion///
  dynamic dollarToNaira = 1050.98;
  var fromCurrency = 'ngn'.obs;
  dynamic convertedResult = 0.0.obs;
//get exchangeRate
getExchangeRate(){
    Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/exchange/rate").then((e){
      if(statusCode.value==0){
        print(e['data']['targetCurrency']);
        final rate = num.parse(e['data']['targetCurrency']);
        dollarToNaira = rate;
        isLoading.value=false;
      }
      else{
        isLoading.value=false;
      }
    });
}

//checkIfBalanceCovers
chcekIfBalanceCovers(num toConvert){
  dynamic amount;
  fromCurrency.value=='ngn'?amount=ngnBalance:amount=usdBalance;
  if(toConvert>amount){
    errorText.value = "Amount exceeds your wallet balance";
  }
  else{
    errorText.value = '';
    Get.off(()=>Reviewconversiondetails(from: toConvert,));
  }
}

//conversion function
doConversion(String amount){
  num toConvert = num.parse(amount);
  fromCurrency.value=='ngn'?convertedResult.value=(toConvert/dollarToNaira):convertedResult.value=(dollarToNaira*toConvert);
}

var convertWalletPayload = {
  "amount": 0,
  "sourceAccount": "usd",
  "destinationAccount": "usd"
};

//converthewallet Api
convertIntoWallet(){
  Apiclientserver().makePostRequest(url: "https://jollof.tatspace.com/api/v1/wallet/conversion", body: convertWalletPayload).then((c){
    if(statusCode.value==0){
      isLoading.value=false;
      dynamic requestedAmount = c['data']['requestedAmount'];
      final transferredAmount = c['data']['transferredAmount'];
      final destinationAccount = c['data']['destinationAccount'];
      getWalletDetails();
      Get.off(()=>Convertsuccesspage(from: requestedAmount, transferredAmount: transferredAmount, destinationAccount: destinationAccount,));
    }
    else{
      isLoading.value=false;
    }
  });
}


///Wallet Statement
var fromDate = 'Select a date'.obs;
var toDate = 'Select a date'.obs;
//to make sure the dates range are valid
checkRange(DateTime from, DateTime to){
  if(from.isAfter(to)){
    errorText.value = "The start date must be earlier than the end date";
    isLoading.value=false;
  }
  else if(from.isAtSameMomentAs(to)){
    errorText.value = "The start date should not be the same as the end date";
    isLoading.value=false;
  }
  else{
    errorText.value="";
    //make the call
    getWalletStatements();
  }
}

var allStatements = [];
//wallet statement call
  getWalletStatements(){
    Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/wallet/statements?fromDate=${fromDate.value}&toDate=${toDate.value}").then((s){
      if(statusCode.value==0){
        allStatements = s['data'];
        isLoading.value=false;
        Get.to(()=>const Allstatements());
      }
      else {
        isLoading.value=false;
      }
    });
  }




///Investments and Plan Buying
  ///Buy Investment
  var plans = [
    {"title":"Standard plan",
      "amount":"299",
      "desc": "Earn 10% profit for 3 months, 20% for 6 months or 30% profit for 12 months. Trades only Bitcoin and Etherum"},
    {"title":"Premium plan",
      "amount":"499",
      "desc": "Earn 25% profit for 3 months, 50% for 6 months or 75% profit for 12 months. Trades only Bitcoin and Etherum"},
    {"title":"VIP plan",
      "amount":"700",
      "desc": "Earn 50% profit for 3 months, 85% for 6 months or 98% profit for 12 months. Trades only Bitcoin and Etherum"},
  ];
  var currentPlanPage = 0.obs;

  var investmentDurationAt = 0.obs;//to control chheckamrks
  var investmentDuration = 0;//actual investment duration Enum[3,6,12]
  num investmentAmount = 0;

  checkIfInvestmentAmountCovers(String planPrice){
    num amount = num.parse(planPrice);
    if(investmentAmount<amount){
      errorText.value="Amount below start price";
    }
    else if(investmentAmount > usdBalance){
      errorText.value="Amount exceeded balance";
    }
    else{
      errorText.value='';
      Get.to(()=>const Chooseduration());
    }
  }

  var investmentDetailsReturned ={};
//make invest api call
  buyInvestment(){
    Apiclientserver().makePostRequest(url: "https://jollof.tatspace.com/api/v1/investment/initialize", body: {
      "amount": investmentAmount,
      "duration": investmentDuration,
      "paymentSource": "wallet"
    }).then((b){
      if(statusCode.value==0){
        investmentDetailsReturned = b['data'];
        Get.to(()=>const Investmentprevgraph());
        isLoading.value=false;
        feedHome();
      }
      else{
        isLoading.value=false;
      }
    });
  }
  


  ///for homepage display of plans
  var userInvestments = [];
  //To check the package used
  checkPackage(num amount){
    if(amount>=700){
    return "VIP";
    }
    else if(amount>=499 && amount < 700){
    return 'Premium';
    }
    else if(amount<499){
      return "Standard";
    }
  }
//getInvestments
getUserInvestments(){
    Apiclientserver().makeGetRequest("https://jollof.tatspace.com/api/v1/investment/filter?sortBy=createdAt&orderBy=desc&page=1&limit=20&isOptedOut=false").then((i){
     if(statusCode.value==0){
     //  print(i['data']);
       userInvestments = i['data'];
     }
     else{
       print(i);
     }
    });
}
}






