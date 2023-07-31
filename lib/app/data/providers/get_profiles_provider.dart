import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:genesis/app/data/models/all_connects_model.dart';
import '../../../core/values/constants.dart';


class GetProfilesProvider extends GetConnect{

  Future<Doc?>getConnects(String uid,String page)async{
    final response = await http.post(
        Uri.parse('${URL}user/getPreferedProfiles$page'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String,String>{
          'uid': uid
        }),
    );
    var temp = jsonDecode(response.body);
    //response.body['message']=='Success'
    if(response.statusCode==200 && temp['message']=='Success'){
      print(jsonDecode(response.body));

      return AllConnectsModel.fromJson(jsonDecode(response.body)).doc;
    }
    else{
      Get.snackbar(
          'OOPS',
          '${response.statusCode} ${response.reasonPhrase}\nTry again',
          backgroundColor: Colors.orange,
          snackPosition: SnackPosition.BOTTOM
      );
      return null;
    }
  }

}