import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/values/constants.dart';

class PreferencesProvider {
  Future<void> updatePreferences(Map packed) async {
    String sid = GetStorage().read('UserId');
    final response = await http.post(
      Uri.parse('${URL}preference/addPreference$sid'),
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
