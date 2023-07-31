import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:genesis/app/data/providers/my_details_provider(post).dart';

class MyDetails extends StatefulWidget {
  const MyDetails({Key? key}) : super(key: key);

  @override
  State<MyDetails> createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  List age = List.generate(75 - 18 + 1, (index) => index + 18);
  List height = [
    '4\'1\"',
    '4\'2\"',
    '4\'3\"',
    '4\'4\"',
    '4\'5\"',
    '4\'6\"',
    '4\'7\"',
    '4\'8\"',
    '4\'9\"',
    '4\'10\"',
    '4\'11\"',
    '5\'0\"',
    '5\'1\"',
    '5\'2\"',
    '5\'3\"',
    '5\'4\"',
    '5\'5\"',
    '5\'6\"',
    '5\'7\"',
    '5\'8\"',
    '5\'9\"',
    '5\'10\"',
    '5\'11\"',
    '6\'0\"',
    '6\'1\"',
    '6\'2\"',
    '6\'3\"',
    '6\'4\"',
    '6\'5\"',
    '6\'6\"',
    '6\'7\"',
    '6\'8\"',
    '6\'9\"',
    '6\'10\"',
    '6\'11\"',
    '7\'0\"'
  ];
  List maritialStatus = [
    'Single',
    'Taken',
    'Its Complicated',
    'Open',
    'I\'d rather not say'
  ];
  String? selectedHeight;
  int? selectedAge;
  String? selectedMaritialStatus;
  TextEditingController nameController = TextEditingController();
  Map packedData = {};

  @override
  void initState() {
    super.initState();
    print(selectedAge);
    print(selectedHeight);
  }

  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff800000),
        title: const Text('My Details'),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Table(
                children: [
                  TableRow(children: [
                    SizedBox(
                      height: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://img.icons8.com/color/48/null/height.png',
                            height: 80,
                            width: 80,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          value: selectedHeight,
                          hint: Text('Select height'),
                          style: TextStyle(color: Colors.black),
                          menuMaxHeight: Get.height * 0.20,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          items: height
                              .map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(
                                    e.toString(),
                                    style: TextStyle(color: Colors.black),
                                  )))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedHeight = value;
                            });
                            print(selectedHeight);
                          }),
                    ),
                  ]),
                  TableRow(children: [
                    SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/null/external-age-range-dating-app-flaticons-lineal-color-flat-icons-2.png',
                              height: 60,
                              width: 80,
                            ),
                            // Text('Age',style: TextStyle(
                            //     color: Colors.black,
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 30
                            // ),),
                          ],
                        )),
                    Container(
                      width: 200,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: DropdownButtonFormField<int>(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          value: selectedAge,
                          hint: Text('Select age'),
                          style: TextStyle(color: Colors.black),
                          menuMaxHeight: Get.height * 0.20,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          items: age
                              .map((e) => DropdownMenuItem<int>(
                                  value: e,
                                  child: Text(
                                    e.toString(),
                                    style: TextStyle(color: Colors.black),
                                  )))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedAge = value;
                            });
                            print(selectedAge);
                          }),
                    ),
                  ]),
                  TableRow(children: [
                    SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              'https://img.icons8.com/emoji/48/null/ring.png',
                              height: 60,
                              width: 80,
                            ),
                          ],
                        )),
                    Container(
                      width: 200,
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          value: selectedMaritialStatus,
                          hint: Text('Maritial status',
                              softWrap: false,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1),
                          style: TextStyle(color: Colors.black),
                          menuMaxHeight: Get.height * 0.20,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          items: maritialStatus
                              .map((e) => DropdownMenuItem<String>(
                                    value: e,
                                    child: Text(e.toString(),
                                        style: TextStyle(color: Colors.black),
                                        softWrap: false,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedMaritialStatus = value;
                            });
                            print(selectedMaritialStatus);
                          }),
                    ),
                  ]),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: nameController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                    label: Text('Name'),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder(),
                    labelStyle: TextStyle(color: Colors.black)),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 40,
                width: 140,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff800000),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onPressed: () async {
                      pd.show(
                          message: 'Saving',
                          type: SimpleFontelicoProgressDialogType.threelines,
                          indicatorColor: Color(0xff800000));

                      if (selectedHeight != null) {
                        packedData['height'] = selectedHeight.toString();
                      }
                      if (selectedAge != null) {
                        packedData['age'] = selectedAge.toString();
                      }
                      if (selectedMaritialStatus != null) {
                        packedData['marialStatus'] = selectedMaritialStatus;
                      }
                      if (nameController.text.isNotEmpty) {
                        packedData['username'] = nameController.text.trim();
                      }

                      await MyDetailsProvider().postDetails(packedData);
                      pd.hide();
                      Navigator.pop(context);

                      //await Future.delayed(Duration(seconds: 2));
                    },
                    child: Text('Done')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
