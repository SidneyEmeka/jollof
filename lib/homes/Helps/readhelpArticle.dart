import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../server/getxserver.dart';
import '../../utils/stylings.dart';
import '../home/notifications/allnotifications.dart';
import '../home/settings/allsettings.dart';

class Readhelparticle extends StatelessWidget {
  const Readhelparticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: Get.width*0.09,
              height: Get.width*0.1,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/emeka.jpeg"),fit: BoxFit.cover)
                ),
             ),
            Text(
              "By Nnaemeka Eze",
              style: Stylings.titles.copyWith(fontSize: 12),
            ),
          ],
        ),
        leadingWidth: Get.width*0.5,
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
              IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Get.find<Jollofx>().isLoading.value = true;
                    Get.to(() => const Allnotifications());
                  },
                  icon: const Icon(
                    Icons.notifications_none_outlined,
                    size: 19,
                    color: Colors.black,
                  ))
            ],
          ),
        ],
        shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Introduction: An article explaining the solution to the user's problem. In the latest development, a set of new trading pairs has been introduced, allowing users to trade CDCETH with PYUSD, USDT, and USD. This addition not only expands the trading options but also introduces more flexibility and opportunities for crypto enthusiasts.Diversifying Trading Pairs: One of the key aspects of a thriving cryptocurrency exchange is the variety of trading pairs it offers. The introduction of CDCETH paired with PYUSD, USDT, and USD brings diversity to the trading ecosystem. Traders can now explore different strategies, take advantage of market trends, and diversify their portfolios with these new pairings. Understanding the Trading Pairs: CDCETH and PYUSD: This pairing enables traders to exchange Crypto.com Coin (CDC) with Ethereum (ETH) while introducing the stability of PYUSD, a crypto-backed stablecoin pegged to the US Dollar. This combination offers a unique blend of major cryptocurrencies and a stable value. CDCETH and USDT: The pairing of CDCETH with Tether (USDT), a popular stablecoin pegged to the US Dollar, provides traders with a stable alternative for their cryptocurrency transactions. This pairing helps mitigate the volatility often associated with crypto-to-crypto trading. CDCETH and USD: The direct pairing of CDCETH with US Dollars adds a traditional fiat currency component to the crypto market. This pairing allows traders to engage in cryptocurrency transactions with a familiar and stable currency, potentially appealing to a broader user base. Benefits for Traders: Risk Mitigation: Stablecoin pairings contribute to risk mitigation by providing a more stable value reference compared to some volatile cryptocurrencies. Enhanced Trading Strategies: Traders can implement various trading strategies, including arbitrage and hedging, by leveraging the different characteristics of each trading pair. Increased Liquidity: The introduction of these new trading pairs can contribute to increased liquidity in the market, providing a more seamless trading experience for users. Conclusion: The introduction of new trading pairs, specifically CDCETH with PYUSD, USDT, and USD, marks a significant step in enhancing the trading experience for crypto enthusiasts. These pairings not only diversify trading strategies but also provide more options for risk management and increased liquidity. As the cryptocurrency market continues to evolve, such developments contribute to the overall maturation of the industry, offering traders a more comprehensive and versatile ecosystem.",
                style: Stylings.subTitles.copyWith(fontSize: 13),),
            ],
          ),
        ),
      ),
    );
  }
}
