import 'package:flutter/material.dart';
import 'package:genesis/app/data/models/my_details_model.dart' as member;
import 'package:genesis/app/modules/member/views/single_profile_community.dart';
import 'package:genesis/app/modules/member/views/single_profile_prefrennces.dart';
import 'package:genesis/app/modules/member/widgets/search_screen.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../../../../core/functions/approval_status.dart';
import '../controllers/member_controller.dart';

class MemberView extends StatefulWidget {
  const MemberView({Key? key}) : super(key: key);

  @override
  State<MemberView> createState() => _MemberViewState();
}

class _MemberViewState extends State<MemberView> {
  MemberController controller = Get.put(MemberController());
  TextEditingController searchController = TextEditingController();
  member.Doc? myDetails;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      print('isLoggedIn: ${isApproved()}');
      // if(await isApproved()){
      //   Get.snackbar(
      //       'Oops',
      //       'Your profile is not approved by admin yet!',
      //       backgroundColor: Colors.orange,
      //       snackPosition: SnackPosition.TOP,
      //       duration: const Duration(seconds: 5)
      //   );
      //   //BottomLoginSheet();
      // }

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
    });
  }

  @override
  void deactivate() {
    print('deactive executed');
    searchController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
        centerTitle: true,
        backgroundColor: const Color(0xff800000),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.white,
        color: const Color(0xff800000),
        onRefresh: () async {
          await Future.delayed(const Duration(seconds: 1));
          controller.getNewMembers();
        },
        child: SizedBox(
          width: Get.width,
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
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
                      Get.to(() => const SearchScreen());
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
                              Get.to(() => const SearchScreen());
                            },
                            child: const SizedBox(
                              width: 40,
                              child: Row(
                                children: [
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

                //similar connects
                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.filterCommunity.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              width: Get.width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.filterCommunity.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Container(
                                        width: Get.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: SingleProfile(
                                          doc:
                                              controller.filterCommunity[index],
                                        ));
                                  }),
                            ),
                ),

                Obx(
                  () => controller.isLoading.isTrue
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.filterPref.isEmpty
                          ? const SizedBox()
                          : SizedBox(
                              width: Get.width,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.filterPref.length,
                                  itemBuilder: (BuildContext context, index) {
                                    print(controller.filterPref.length);
                                    return Container(
                                        width: Get.width,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(10)),
                                            border: Border.all(
                                                color: Colors.grey.shade400)),
                                        child: SingleProfilePreferences(
                                          doc: controller.filterPref[index],
                                        ));
                                  }),
                            ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     print(FirebaseAuth.instance.currentUser!.uid);
      //     print(GetStorage().read('UserId'));
      //   },
      // ),
    );
  }
}
