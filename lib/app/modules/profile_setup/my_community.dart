import 'package:flutter/material.dart';
import 'package:genesis/app/data/providers/community_provider.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class MyCommunity extends StatefulWidget {
  const MyCommunity({Key? key}) : super(key: key);

  @override
  State<MyCommunity> createState() => _MyCommunityState();
}

class _MyCommunityState extends State<MyCommunity> {
  List religion = ['Catholicism', 'Christianity'];
  List community = ['Punjabi', 'Sindhi', 'Balochi', 'Pashtoon'];
  List motherTongue = ['Punjabi', 'Sindhi', 'Balochi', 'Pashto', 'English'];
  String? selectedReligion;
  String? selectedCommunity;
  String? selectedMotherTongue;
  Map packedData = {};

  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Community '),
        centerTitle: true,
        backgroundColor: Color(0xff800000),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          'https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/null/external-religions-religion-flaticons-lineal-color-flat-icons.png',
                          height: 80,
                          width: 60,
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
                        value: selectedReligion,
                        hint: const Text('Select religion'),
                        style: const TextStyle(color: Colors.black),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        items: religion
                            .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e.toString(),
                                  style: const TextStyle(color: Colors.black),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedReligion = value;
                          });
                          print(selectedReligion);
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
                            'https://img.icons8.com/ios-filled/50/null/multicultural-people.png',
                            height: 80,
                            width: 60,
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
                        value: selectedCommunity,
                        hint: const Text('Select community'),
                        style: const TextStyle(color: Colors.black),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        items: community
                            .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e.toString(),
                                  style: const TextStyle(color: Colors.black),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCommunity = value;
                          });
                          print(selectedCommunity);
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
                            'https://img.icons8.com/color/48/null/language-skill.png',
                            height: 80,
                            width: 60,
                          ),
                        ],
                      )),
                  Container(
                    width: 200,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black))),
                        value: selectedMotherTongue,
                        hint: const Text('Mother tongue'),
                        style: const TextStyle(color: Colors.black),
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black,
                        ),
                        items: motherTongue
                            .map((e) => DropdownMenuItem<String>(
                                value: e,
                                child: Text(
                                  e.toString(),
                                  style: const TextStyle(color: Colors.black),
                                )))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMotherTongue = value;
                          });
                          print(selectedMotherTongue);
                        }),
                  ),
                ]),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 40,
              width: 140,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff800000),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                  onPressed: () async {
                    pd.show(
                        message: 'Saving',
                        type: SimpleFontelicoProgressDialogType.threelines,
                        indicatorColor: const Color(0xff800000));
                    //await Future.delayed(const Duration(seconds: 2));

                    if (selectedReligion != null) {
                      packedData.addAll({'religion': '$selectedReligion'});
                    }
                    if (selectedCommunity != null) {
                      packedData
                          .addAll({'communityType': '$selectedCommunity'});
                    }
                    if (selectedMotherTongue != null) {
                      packedData
                          .addAll({"motherTounge": "$selectedMotherTongue"});
                    }
                    CommunityProvider().updateCommunity(packedData);

                    pd.hide();
                    Get.back();
                  },
                  child: const Text('Done')),
            )
          ],
        ),
      ),
    );
  }
}
