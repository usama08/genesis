import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../core/values/constants.dart';

class AddDescriptionProvider extends GetConnect{

  Future<void>postDescription(String bio,String uid)async{
    final response  = await post(
        '${URL}user/completeProfile$uid',
        {
          'bio':bio
        }
    );
    if(response.statusCode==200){
      Get.snackbar(
          'Success',
          'Description has been updated in server',
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