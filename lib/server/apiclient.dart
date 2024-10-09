import 'dart:convert';
import 'package:http/http.dart' as http;
class Apiclientserver {

  Future<Map<String,dynamic>> getCrypto() async{
    try {
      var response = await http.get(
        Uri.parse("https://api.cryptorank.io/v1/currencies?api_key=b5890738f863a9e20cf7b3da3f139174c4436468305e0ed08ef39db64007&symbols=BTC,ETH,ADA"),
      );
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}