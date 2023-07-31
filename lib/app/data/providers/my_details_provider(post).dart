import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/values/constants.dart';

class MyDetailsProvider {
  Future<void> postDetails(Map packed) async {
    String uid = '${FirebaseAuth.instance.currentUser?.uid}';

    final response = await http.post(
      Uri.parse(
        '${URL}user/completeProfile$uid',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(packed),
    );

    if (response.statusCode == 200) {
      Get.snackbar('Success', 'Details has been updated in server',
          backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);
    } else {
      Get.snackbar(
          'OOPS', '${response.statusCode} ${response.reasonPhrase}\nTry again',
          backgroundColor: Colors.orange, snackPosition: SnackPosition.BOTTOM);
    }
  }
}
