import 'dart:convert';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:jollof/main.dart';
import 'package:jollof/server/getxserver.dart';

class Apiclientserver {
  Future<Map<String, dynamic>> getCrypto() async {
    try {
      var response = await http.get(
        Uri.parse(
            "https://api.cryptorank.io/v1/currencies?api_key=b5890738f863a9e20cf7b3da3f139174c4436468305e0ed08ef39db64007&symbols=BTC,ETH,ADA"),
      );
      final data = jsonDecode(response.body);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

//tatspace
  Future<Map<String, dynamic>> pingTatspace() async {
    try {
      var response = await http.get(
        Uri.parse("https://jollof.tatspace.com/api/ping"),
      );
      final data = jsonDecode(response.body);
     // print(data);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>> makePostRequest(
      {required String url,
      required Map<String, dynamic> body,
      String contentType = 'application/json'}) async {
    try {
      // Convert the body into JSON
      String jsonBody = json.encode(body);

      // Set headers
      Map<String, String> headers = {
        'Content-Type': contentType,
        'Accept': 'application/json',
        // Add any other headers you need, e.g., authentication tokens
        'Authorization':
            'Bearer ${Get.find<Jollofx>().userTokens["accessToken"]}',
      };

      // Make the POST request
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonBody,
      );
      // Check the status code
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map<String, dynamic> successReturnbody = jsonDecode(response.body);
        // Request successful
        //print('Request successful');
        //print('Response body: ${response.body}');
        Get.find<Jollofx>().statusCode.value = 0;
        return successReturnbody;
      } else {
        Map<String, dynamic> errorMessage = jsonDecode(response.body);
        // Request failed
       // print('Request failed with status code: ${response.statusCode}');
       // print('Response body: ${response.body}');
        // print(errorMessage['message']);
        Get.find<Jollofx>().statusCode.value = response.statusCode;
        Get.find<Jollofx>().errorText.value = errorMessage['message'];
        return errorMessage;
      }
    } catch (e) {
      Get.find<Jollofx>().statusCode.value = 2; //addedd these to the two
      //print('Error occurred: $e');
      Get.find<Jollofx>().errorText.value = 'An error occurred';
      return {};
    }
  }

  Future<Map<String, dynamic>> makeGetRequest(String url) async {
    try {
      // Make the GET request
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization':
            'Bearer ${Get.find<Jollofx>().userTokens["accessToken"]}',
      });

      // Check the status code
      if (response.statusCode == 200) {
        // Request successful
       // print('Request successful');
        // Parse the JSON response
        Map<String, dynamic> data = json.decode(response.body);
        Get.find<Jollofx>().statusCode.value = 0;
        return data;
      } else {
        // Request failed
        //print('Request failed with status code: ${response.statusCode}');
       // print('Response body: ${response.body}');
        Get.find<Jollofx>().statusCode.value = 1;
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle any errors
      Get.find<Jollofx>().statusCode.value = 2;
      Get.find<Jollofx>().errorText.value = 'An error occurred';
     // print('Error occurred: $e');
      throw Exception('Failed to make request');
    }
  }

  Future<Map<String, dynamic>> makePatchRequest(String url, Map<String, dynamic> body,) async {
    try {
      Map<String, String> headers = {
        'Accept': 'application/json',
        "Content-Type": "application/json",
        // Add any other headers you need, e.g., authentication tokens
        'Authorization': 'Bearer ${Get.find<Jollofx>().userTokens["accessToken"]}',
      };

      final response = await http.patch(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: headers,
      );
     //print(response.statusCode);

      if (response.statusCode == 200) {
        Get.find<Jollofx>().statusCode.value = 0;
        Map<String,dynamic>  reply=jsonDecode(response.body);
       // print(reply);
        return reply;
      } else {
        //print('Error making PATCH request: ${response.statusCode}');
        Get.find<Jollofx>().statusCode.value = 1;
        return {"1":"@"};
      }
    } catch (e) {
      Get.find<Jollofx>().statusCode.value = 2;
      //print('Exception during PATCH request: $e');
      return {"2":"@"};
    }
  }

  Future<Map<String, dynamic>> makePutRequest(String url,String id) async {
    final formedUrl = '$url/$id';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${Get.find<Jollofx>().userTokens["accessToken"]}',
    };

    try {
      final response = await http.put(Uri.parse(formedUrl), headers: headers);

      if (response.statusCode == 200) {
        Map<String, dynamic> returned = jsonDecode(response.body);
        Get.find<Jollofx>().statusCode.value = 0;
        //print('Resource updated successfully');
        //print('Response: ${response.body}');
        return returned;
      } else {
        Get.find<Jollofx>().statusCode.value = 1;
       // print('Failed to update resource. Status code: ${response.statusCode}');
        //print('Response: ${response.body}');
        return {};
      }
    } catch (e) {
      Get.find<Jollofx>().statusCode.value = 2;
     // print('Error occurred: $e');
      return {};
    }
  }

}
