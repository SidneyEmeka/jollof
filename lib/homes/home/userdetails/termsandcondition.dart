import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/homepage.dart';
import 'package:jollof/server/getxserver.dart';

import '../../../utils/stylings.dart';

class Termsandcondition extends StatelessWidget {
  const Termsandcondition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
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
          "Terms and Conditions",
          style: Stylings.titles,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.card_giftcard_outlined,
                  size: 17,
                  color: Colors.black,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.notifications_none_outlined,
                  size: 17,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ],
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Obx(()=>Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Introduction: Cryptocurrency markets are dynamic, constantly evolving to meet the demands and preferences of traders. In the latest development, a set of new trading pairs has been introduced, allowing users to trade CDCETH with PYUSD, USDT, and USD. This addition not only expands the trading options but also introduces more flexibility and opportunities for crypto enthusiasts.Diversifying Trading Pairs: One of the key aspects of a thriving cryptocurrency exchange is the variety of trading pairs it offers. The introduction of CDCETH paired with PYUSD, USDT, and USD brings diversity to the trading ecosystem. Traders can now explore different strategies, take advantage of market trends, and diversify their portfolios with these new pairings. Understanding the Trading Pairs: CDCETH and PYUSD: This pairing enables traders to exchange Crypto.com Coin (CDC) with Ethereum (ETH) while introducing the stability of PYUSD, a crypto-backed stablecoin pegged to the US Dollar. This combination offers a unique blend of major cryptocurrencies and a stable value. CDCETH and USDT: The pairing of CDCETH with Tether (USDT), a popular stablecoin pegged to the US Dollar, provides traders with a stable alternative for their cryptocurrency transactions. This pairing helps mitigate the volatility often associated with crypto-to-crypto trading. CDCETH and USD: The direct pairing of CDCETH with US Dollars adds a traditional fiat currency component to the crypto market. This pairing allows traders to engage in cryptocurrency transactions with a familiar and stable currency, potentially appealing to a broader user base. Benefits for Traders: Risk Mitigation: Stablecoin pairings contribute to risk mitigation by providing a more stable value reference compared to some volatile cryptocurrencies. Enhanced Trading Strategies: Traders can implement various trading strategies, including arbitrage and hedging, by leveraging the different characteristics of each trading pair. Increased Liquidity: The introduction of these new trading pairs can contribute to increased liquidity in the market, providing a more seamless trading experience for users. Conclusion: The introduction of new trading pairs, specifically CDCETH with PYUSD, USDT, and USD, marks a significant step in enhancing the trading experience for crypto enthusiasts. These pairings not only diversify trading strategies but also provide more options for risk management and increased liquidity. As the cryptocurrency market continues to evolve, such developments contribute to the overall maturation of the industry, offering traders a more comprehensive and versatile ecosystem.",
                style: Stylings.subTitles.copyWith(fontSize: 13),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(value: Get.find<Jollofx>().termsRead.value, onChanged: (v){
                    Get.find<Jollofx>().termsRead.value = v!;
                  },activeColor: Stylings.yellow,),
                  Expanded(child: Text("I have read, understood and agree to be bound by Jollof account terms and conditions",style: Stylings.subTitles,))
                ],
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: () {
                  Get.find<Jollofx>().termsRead.value==true?{
                    Get.find<Jollofx>().userDetailsCollected.value = true,
                    Get.to(()=>const Homepage())
                  }:Get.snackbar("Terms and Conditions", "Kindly check the checkbox after reading.");
                },
                child: Container(
                  width: Get.width,
                  height: Get.height*0.06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Stylings.yellow),
                  child: Text(
                    "Confirm & Continue",
                    style: Stylings.titles.copyWith(fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      ),),

    );
  }
}
