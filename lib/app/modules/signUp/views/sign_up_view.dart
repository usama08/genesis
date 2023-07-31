import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genesis/app/modules/signUp/views/step1_view.dart';
import 'package:genesis/core/values/constants.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  final UserCredential? user;
  final AuthorizationCredentialAppleID? appleCredentials;

  final bool? appledata;
  const SignUpView({Key? key, this.user, this.appledata, this.appleCredentials}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 120,
            ),
            //profile image
            ClipOval(
                child:
                    // appledata == false
                    //?
                    Image.network(
              user?.user?.photoURL != null ? '${user?.user?.photoURL}' : '${PERSONIMG}',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
              errorBuilder: (context, url, error) => Icon(Icons.error),
            )
                //: SizedBox()
                ),

            const SizedBox(
              height: 30,
            ),

            //text(this profile is for)
            const Text(
              'This Profile is for',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: 20,
            ),

            Obx(() => Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: controller.radiosValue.map((e) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(30),
                      child: FittedBox(
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Colors.grey,
                              )),
                          child: Row(
                            children: [
                              Radio(
                                value: e,
                                groupValue: controller.selectedRadio.value,
                                onChanged: (value) async {
                                  controller.selectedRadio.value = value!;
                                  await Future.delayed(const Duration(milliseconds: 150));
                                  Get.to(() => Step1View());
                                  controller.userCredential = user;
                                },
                                activeColor: const Color(0xff800000),
                              ),
                              Text(
                                e,
                                style: const TextStyle(fontSize: 17),
                              ),
                              const SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList())),
            SizedBox(
              height: Get.height * 0.10,
            ),
          ],
        ),
      ),
    );
  }
}
