import 'package:flutter/material.dart';
import 'package:genesis/app/data/models/signup_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../core/values/constants.dart';

class SignUpProvider extends GetConnect {
  Future<bool> postCredentials(SignupModel signUpModel) async {
    final response = await post('${URL}user/signUp', signUpModel.toJson());

    signUpModel;

    if (response.statusCode == 200) {
      try {
        var doc = response.body['doc'];
        String id = doc['_id'];
        GetStorage().write('UserId', id);
      } catch (e) {
        print(e);
      }

      return true;
    } else {
      Get.snackbar(
          'ServerResponse', '${response.statusCode} ${response.statusText}',
          backgroundColor: Colors.orange, snackPosition: SnackPosition.BOTTOM);
      return false;
    }
  }
}
