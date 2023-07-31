import 'package:flutter/material.dart';
import 'package:genesis/app/modules/signUp/views/step2_view.dart';
import 'package:get/get.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:genesis/app/modules/signUp/controllers/sign_up_controller.dart';

class Step1View extends GetView<SignUpController> {
  //Step1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              'Thanks for Registering. Now lets build Profile',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 25,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: Get.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  //state u live in
                  CSCPicker(
                    onCountryChanged: (country) {
                      controller.selectedCountry.value = country;
                    },
                    onStateChanged: (state) {
                      controller.state = state;
                    },
                    onCityChanged: (city) {
                      controller.city = city;
                    },
                    layout: Layout.vertical,
                    cityDropdownLabel: 'City*',
                    stateDropdownLabel: 'State*',
                    countryDropdownLabel: 'Country*',
                    dropdownDecoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //your martial status
                  DropdownButtonFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        label: Text('Martial Status*'),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      validator: (value) {
                        if (GetUtils.isNull(value)) {
                          return 'Required field';
                        } else
                          return null;
                      },
                      items: controller.martialStatus
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            //style: TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedMartialStatus.value = value!;
                        print(controller.selectedMartialStatus.value);
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  //your diet
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text('Your Diet'),
                          labelStyle: TextStyle(color: Colors.black)),
                      items: controller.diet
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            //style: TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedDiet.value = value!;
                        print(controller.selectedDiet.value);
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  //your height
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text('Your Height*'),
                          labelStyle: TextStyle(color: Colors.black)),
                      menuMaxHeight: Get.height * 0.40,
                      validator: (value) {
                        if (GetUtils.isNull(value)) {
                          return 'Required Field';
                        } else
                          return null;
                      },
                      items: controller.height
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            //style: TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedHeight.value = value!;
                        print(controller.selectedHeight.value);
                      }),

                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text('Your Gender*'),
                          labelStyle: TextStyle(color: Colors.black)),
                      menuMaxHeight: Get.height * 0.40,
                      validator: (value) {
                        if (GetUtils.isNull(value)) {
                          return 'Required Field';
                        } else
                          return null;
                      },
                      items: controller.gender
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            //style: TextStyle(fontSize: 20),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedGender.value = value!;
                        print(controller.selectedGender.value);
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<int>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        label: Text('Select age'),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      value: controller.selectedAge,
                      menuMaxHeight: Get.height * 0.40,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      items: controller.age
                          .map((e) => DropdownMenuItem<int>(
                              value: e,
                              child: Text(
                                e.toString(),
                                style: const TextStyle(color: Colors.black),
                              )))
                          .toList(),
                      onChanged: (value) {
                        // setState(() {
                        //   selectedAge=value;
                        // });
                        // print(selectedAge);
                        controller.selectedAge = value;
                        print(controller.selectedAge);
                      }),

                  //SizedBox(height: Get.height*0.10,),
                  const SizedBox(
                    height: 20,
                  ),

                  //continue button
                  Obx(
                    () => controller.selectedHeight.value != '' &&
                            controller.selectedMartialStatus.value != '' &&
                            controller.city != '' &&
                            controller.selectedGender.value != ''
                        ? SizedBox(
                            height: 45,
                            width: Get.width * 0.60,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  backgroundColor: const Color(0xff800000),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(23)),
                                ),
                                onPressed: () {
                                  Get.to(() => Step2View());
                                },
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                )),
                          )
                        : SizedBox(
                            height: 45,
                            width: Get.width * 0.60,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 10,
                                  backgroundColor:
                                      Colors.grey, //Color(0xff800000),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(23)),
                                ),
                                onPressed: null,
                                child: const Text(
                                  'Continue',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2),
                                )),
                          ),
                  ),

                  // SizedBox(
                  //   height: 45,
                  //   width: Get.width*0.60,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         elevation: 10,
                  //         backgroundColor: Color(0xff800000),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(23)
                  //         ),
                  //       ),
                  //       onPressed: (){
                  //         Get.to(()=>Step2View());
                  //       },
                  //       child: Text('Continue',
                  //         style: const TextStyle(
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.bold,
                  //           letterSpacing: 2
                  //         ),
                  //       )
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
