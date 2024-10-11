import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:jollof/main.dart';
import 'package:jollof/server/getxserver.dart';
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





//tatspace
  Future<Map<String,dynamic>> pingTatspace() async{
    try {
      var response = await http.get(
        Uri.parse("https://jollof.tatspace.com/api/ping"),
      );
      final data = jsonDecode(response.body);
      print(data);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> makePostRequest(String url, Map<String, dynamic> body) async {
    try {
      // Convert the body into JSON
      String jsonBody = json.encode(body);

      // Set headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // Add any other headers you need, e.g., authentication tokens
        // 'Authorization': 'Bearer YOUR_TOKEN_HERE',
      };

      // Make the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,
      );

      // Check the status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        // Request successful
        print('Request successful');
        print('Response body: ${response.body}');
        Get.find<Jollofx>().isLoading.value = false;
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        Get.find<Jollofx>().isLoading.value = false;
      }
    } catch (e) {
      // Handle any errors
      print('Error occurred: $e');
      Get.find<Jollofx>().isLoading.value = false;
    }
  }

  Future<Map<String, dynamic>> makeGetRequest(String url) async {
    try {

      // Make the GET request
      final response = await http.get(
        Uri.parse(url),
      );

      // Check the status code
      if (response.statusCode == 200) {
        // Request successful
        print('Request successful');
        // Parse the JSON response
        Map<String, dynamic> data = json.decode(response.body);
        return data;
      } else {
        // Request failed
        print('Request failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle any errors
      print('Error occurred: $e');
      throw Exception('Failed to make request');
    }
  }


}