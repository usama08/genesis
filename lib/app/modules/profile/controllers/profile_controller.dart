import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart'as http;
import 'package:genesis/app/data/models/my_details_model.dart';
import '../../../../core/values/constants.dart';

class ProfileController extends GetxController {

  String? gender;
  var selectedGender = ''.obs;
  Rx<Profile>? myDetails = Profile().obs;
  Doc? doc;
  Profile? profile;
  var isLoading = false.obs;


  Future<void>postImage(XFile img,String uid)async{
    var request = http.MultipartRequest(
        'POST',
        Uri.parse('${URL}user/profileImage')
    );
    request.fields['uid']= uid;
    request.files.add(await http.MultipartFile.fromPath('files', img.path));
    var streamResponse = await request.send();
    if(streamResponse.statusCode==200){
      Get.snackbar('Success', 'Multimedia is added',backgroundColor: Colors.green,snackPosition: SnackPosition.BOTTOM);
    }
    else{
      Get.snackbar('Failure', 'try again',backgroundColor: Colors.orange,snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void>getMyDetails()async{
    isLoading.value=true;
    String uid = FirebaseAuth.instance.currentUser!.uid;
    print(uid);
    String url = '${URL}user/profile$uid';
    final response = await http.get(
        Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }
    );
    //print(jsonDecode(response.body));
    if(response.statusCode==200){
      Doc? res = MyDetailsModel.fromJson(jsonDecode(response.body)).doc;
      //res!=null?myDetails?.value=res:print('response is null');

      if(res!=null){
        doc = res;
        profile = res.profile?.first;
        GetStorage().write('UserId', res.profile?.first.sId);
      }else print('response is null');
    }
    else{
      Get.snackbar('Failure', 'try again',backgroundColor: Colors.orange,snackPosition: SnackPosition.BOTTOM);
    }
    isLoading.value=false;
  }

  // Future<bool> checkAndRequestCameraPermissions() async {
  //   PermissionStatus permission =
  //   await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
  //   if (permission != PermissionStatus.granted) {
  //     Map<PermissionGroup, PermissionStatus> permissions =
  //     await PermissionHandler().requestPermissions([PermissionGroup.camera]);
  //     return permissions[PermissionGroup.camera] == PermissionStatus.granted;
  //   } else {
  //     return true;
  //   }
  // }

  @override
  void onInit() {
    super.onInit();
    getMyDetails();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
