

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;


class NotificationApiCall {

  saveNotificationToken(String token) async
  {



    try {
      final response = await http.post(
        Uri.parse("https://fcm.googleapis.com/fcm/send"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "key= AAAAZGGwsYg:APA91bHd3l2KiqZXtOLW4NMZg3nsvmsnN7HbukMHcPBRFKC9Gwfp_Ylb_Q4q-PSzMrxooHRqN_1Pa5VGIk7Zcx-_E_PwjcogrwbulHF3mwQg6sEeDw7l-e5AIiV4oFlxYu6pFG_5aWpE"
        },

        body: jsonEncode(
            {
          "to": token,
          "notification": {
            "title": "First massage",
            "body": "Notification Body",
            "mutable_content": true,
            "sound": "Tri-tone"
          },
        }
        ));


      print(response.statusCode);
      // //print('response.statusCode');

      if (response.statusCode == 200) {
        print("Response");
        print(response.body);
        // //print("success");
      }
      else {

        print("failure");
        throw Exception('Failed to create get product.');
      }
    }
    catch (e) {
      print("Catch Error $e");
    }
  }

}