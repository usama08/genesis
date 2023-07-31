import 'package:flutter/material.dart';
import 'package:genesis/app/modules/signUp/views/step3_view.dart';
import 'package:get/get.dart';
import 'package:genesis/app/modules/signUp/controllers/sign_up_controller.dart';

class Step2View extends GetView<SignUpController> {
  Step2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff800000),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              'Just a few steps more!\nPlease add education & career details',
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
                  //your highest qualification
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text('Your Highest Qualification*'),
                          labelStyle: TextStyle(color: Colors.black)),
                      items: controller.qualification
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
                        controller.selectedQualification.value = value!;
                        print(controller.selectedQualification.value);
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  //college u attend
                  TextFormField(
                    controller: controller.college,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'College you attend',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //another college name
                  TextFormField(
                    controller: controller.anotherCollege,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Another College Name',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  //you work with
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text('You work with'),
                          labelStyle: TextStyle(color: Colors.black)),
                      items: controller.workWith
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
                        controller.selectedWorkWith.value = value!;
                        print(controller.selectedWorkWith.value);
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  //you work as
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text('You work as'),
                          labelStyle: TextStyle(color: Colors.black)),
                      items: controller.workAs
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
                        controller.selectedWorkAs.value = value!;
                        print(controller.selectedWorkAs.value);
                      }),
                  const SizedBox(
                    height: 20,
                  ),

                  //your business
                  TextFormField(
                    controller: controller.business,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      labelText: 'Your Business',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //annual income
                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          label: Text('Your Income*'),
                          labelStyle: TextStyle(color: Colors.black)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Required Field';
                        } else
                          return null;
                      },
                      items: controller.salaryRange
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
                        controller.selectedSalary.value = value!;
                        print(controller.selectedSalary.value);
                      }),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),

                  //continue button
                  Obx(
                    () => controller.selectedQualification.isNotEmpty &&
                            controller.selectedSalary.isNotEmpty
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
                                  Get.to(() => Step3View());
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
                  const SizedBox(
                    height: 20,
                  ),

                  // SizedBox(
                  //   height: 45,
                  //   width: Get.width*0.60,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         elevation: 10,
                  //         backgroundColor: Color(0xff800000),
                  //         shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(23)
                  //         ),
                  //       ),
                  //       onPressed: (){
                  //         Get.to(()=>Step3View());
                  //       },
                  //       child: const Text('Continue',
                  //         style: TextStyle(
                  //             fontSize: 18,
                  //             fontWeight: FontWeight.bold,
                  //             letterSpacing: 2
                  //         ),
                  //       )
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: Obx(() => controller.selectedLat.value.isEmpty?
      //     FloatingActionButton(
      //       backgroundColor: const Color(0xff800000),
      //       onPressed: ()async{
      //         SimpleFontelicoProgressDialog pd = SimpleFontelicoProgressDialog(context: context);
      //         pd.show(message: 'Processing...',type: SimpleFontelicoProgressDialogType.threelines,indicatorColor: Color(0xff800000));
      //
      //         //Position pos = await controller.determinePosition();
      //         bool perm = await controller.handleLocationPermission(context);
      //         if(perm){
      //           Position pos = await controller.currentPosition();
      //           print(pos.latitude);
      //           controller.selectedLat.value = '${pos.latitude}';
      //           controller.selectedLong.value = '${pos.longitude}';
      //         }
      //         pd.hide();
      //       },
      //       child: const Icon(Icons.location_on),
      //     ):
      //     const FloatingActionButton(
      //         onPressed: null,
      //       backgroundColor: Colors.grey,
      //       child: Icon(Icons.location_on),
      //     )
      // )
    );
  }
}
