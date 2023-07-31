import 'package:genesis/app/modules/member/views/temp/temp_single_members.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './temp_member_model.dart';
import '../../widgets/search_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

class TempMembers extends StatefulWidget {
  const TempMembers({Key? key}) : super(key: key);

  @override
  State<TempMembers> createState() => _TempMembersState();
}

class _TempMembersState extends State<TempMembers> {
  TempMembersController controller = Get.put(TempMembersController());
  ScrollController scrollController = ScrollController();
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //this will listen when user hit the end of screen and getmore users
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        if (!controller.isLoading.value) {
          print('hitted the end of screen from scroll from scroll listener');
          controller.getMoreMembers();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
        centerTitle: true,
        backgroundColor: const Color(0xff800000),
      ),
      body: RefreshIndicator(
        color: const Color(0xff800000),
        backgroundColor: Colors.transparent,
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          controller.getNewMembers();
        },
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            child: Column(
              children: [
                //search field
                Container(
                  height: 60,
                  width: Get.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.sentences,
                    autocorrect: true,
                    enableSuggestions: true,
                    cursorColor: const Color(0xff800000),
                    onTap: () {
                      Get.to(() => SearchScreen());
                    },
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color(0xff800000))),
                        enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color(0xff800000))),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            borderSide: BorderSide(color: Color(0xff800000))),
                        hintText: 'Search your connect',
                        suffixIcon: InkWell(
                            onTap: () async {
                              //pd.show(message: 'Finding Match', type: SimpleFontelicoProgressDialogType.threelines, indicatorColor: const Color(0xff800000));
                              //await Future.delayed(const Duration(seconds: 1));
                              //await SearchProvider().getSearchedMembers(searchController.text.trim());
                              //pd.hide();
                              Get.to(() => SearchScreen());
                            },
                            child: SizedBox(
                              width: 40,
                              child: Row(
                                children: const [
                                  VerticalDivider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                  Icon(
                                    Icons.search,
                                    color: Color(0xff800000),
                                    size: 28,
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.grey,
                ),

                Obx(
                  () => controller.isLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: controller.membersList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                                width: Get.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10)),
                                    border: Border.all(
                                        color: Colors.grey.shade400)),
                                child: TempSingleMembers(
                                  doc: controller.membersList[index],
                                ));
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TempMembersController extends GetxController {
  var isLoading = false.obs;
  int page = 2;
  var isCompleted = false;
  List membersList = <Profiles>[].obs;

  @override
  void onInit() {
    getNewMembers();
    super.onInit();
  }

  void getNewMembers() async {
    List<Profiles>? temp = await getConnects(1);
    if (temp != null) {
      membersList.clear();
      membersList.addAll(temp);
    }
    print('---- get new members count = ${membersList.length} ------');
  }

  void getMoreMembers() async {
    if (isCompleted == false) {
      print('---------- is completed is = $isCompleted ---------------');
      List<Profiles>? data = await getConnects(page);
      if (data != null) {
        print('----------------data.length--------------------');
        print(data.length);
        if (data.isEmpty) {
          //if doc is empty means nothing more is present there
          isCompleted = true;
        }
        if (data.isNotEmpty) {
          membersList.addAll(data);
          print(
              'from get more members data is added now the sixe of list is ${membersList.length}');
          page += 1;
        }
      }
    }
  }

  Future<List<Profiles>?> getConnects(int num) async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    final response = await http.post(
      Uri.parse(
          'https://789b-158-220-104-228.ngrok-free.app/user/getProfiles$num'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"uid": "$uid"}),
    );
    if (response.statusCode == 200) {
      return TempMembersModel.fromJson(jsonDecode(response.body)).doc?.profiles;
    }
    return null;
  }
}
