import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genesis/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../../../data/providers/add_gender_provider.dart';

void genderSheet(ProfileController controller){
  Get.defaultDialog(
      title: 'Set your Gender',
      content: StatefulBuilder(
          builder: (context,setState){
            return Column(
              children: [
                Row(
                  children: [
                    Obx(() => Radio(
                      value: 'Male',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value)async{
                        setState(() {});
                        controller.selectedGender.value=value!;
                        //await Future.delayed(const Duration(milliseconds: 150));
                      },
                      activeColor: const Color(0xff800000),
                    ),),
                    const Text('Male',
                      style:  TextStyle(
                          fontSize: 17
                      ),
                    ),
                    const SizedBox(width: 15,)
                  ],
                ),
                Row(
                  children: [
                    Obx(() => Radio(
                      value: 'Female',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value)async{
                        setState(() {});
                        controller.selectedGender.value=value!;
                        //await Future.delayed(const Duration(milliseconds: 150));
                      },
                      activeColor: const Color(0xff800000),
                    ),),
                    const Text('Female',
                      style:  TextStyle(
                          fontSize: 17
                      ),
                    ),
                    const SizedBox(width: 15,)
                  ],
                ),
                Row(
                  children: [
                    Obx(() => Radio(
                      value: 'Not Specified',
                      groupValue: controller.selectedGender.value,
                      onChanged: (value)async{
                        setState(() {});
                        controller.selectedGender.value=value!;
                        //await Future.delayed(const Duration(milliseconds: 150));
                      },
                      activeColor: const Color(0xff800000),
                    ),),
                    const Text('Not Specified',
                      style:  TextStyle(
                          fontSize: 17
                      ),
                    ),
                    const SizedBox(width: 15,)
                  ],
                ),

              ],
            );
          }
      ),
      actions: [
        ElevatedButton(
            onPressed: ()async{
              print(controller.selectedGender.value);

              if(controller.selectedGender.isEmpty){
                Get.back();
              }
              else{
                AddGenderProvider().postGender(controller.selectedGender.value, FirebaseAuth.instance.currentUser!.uid);
                Get.back();
              }

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xff800000),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            child: Text('Done')
        )
      ]
  );
}