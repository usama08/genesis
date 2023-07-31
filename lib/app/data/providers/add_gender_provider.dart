import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../core/values/constants.dart';

class AddGenderProvider extends GetConnect{

  Future<void>postGender(String gender,String uid)async{
    final response = await post(
        '${URL}user/completeProfile$uid',
        {
          'gender':gender
        }
    );

    if(response.statusCode==200){
      Get.snackbar(
          'Success',
          'Gender has been updated in server',
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM
      );
    }
    else{
      Get.snackbar(
          'OOPS',
          '${response.statusCode} ${response.statusText}\nTry again',
          backgroundColor: Colors.orange,
          snackPosition: SnackPosition.BOTTOM
      );
    }
  }

}