import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jollof/server/getxserver.dart';
import 'package:jollof/utils/stylings.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'homes/home/notifications/allnotifications.dart';

class Paymentwebview extends StatefulWidget {
  final String? checkoutUrl;
  final String? callbackUrl;

  const Paymentwebview(
      {super.key, required this.checkoutUrl, required this.callbackUrl});

  @override
  PaymentwebviewState createState() => PaymentwebviewState();
}

class PaymentwebviewState extends State<Paymentwebview> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('${widget.callbackUrl}')) {
              Navigator.pop(context, "success");
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl!));
    // ..loadRequest(Uri.parse('https://google.com'));
    // Enable virtual display.
    // if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          scrolledUnderElevation: 0,
          leading:  IconButton(alignment: Alignment.centerRight,onPressed: (){
            Get.back();
          }, icon: const Icon(
            Icons.arrow_back_ios,
            size: 19,
            color: Colors.black,
          )),
          title: Text(
            "Payment",
            style: Stylings.titles,
          ),
          actions: [
            Container(
                padding: const EdgeInsets.all(13),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.network(
                  Get.find<Jollofx>().validatedUserAvatar.value,
                  fit: BoxFit.contain,
                )),
          ],
          centerTitle: true,
          shape: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: controller),
            // Positioned(
            //     top: 50,
            //     left: 15,
            //     child:
            //     GestureDetector(
            //       onTap: ()=>Navigator.pop(context),
            //       child: Container(
            //         decoration: BoxDecoration(
            //             color: Colors.white,
            //             borderRadius: BorderRadius.circular(40)
            //         ),
            //         child: const Icon(Icons.chevron_left,size: 35,),),
            //     )),
          ],
        ));
  }
}