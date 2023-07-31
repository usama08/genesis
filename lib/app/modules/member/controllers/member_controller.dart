import 'package:firebase_auth/firebase_auth.dart';
import 'package:genesis/app/data/providers/get_profiles_provider.dart';
import 'package:get/get.dart';
import 'package:genesis/app/data/models/all_connects_model.dart';

class MemberController extends GetxController {
  List filterCommunity = <Filtercommunity>[].obs;
  List filterPref = <FilteredPref>[].obs;
  var isLoading = false.obs;
  int page = 1;
  var isCompleted = false;

  //this method is for first time call
  //also for refresh indicator onRefresh()
  Future<void> getNewMembers() async {
    String uid = '${FirebaseAuth.instance.currentUser?.uid}';
    Doc? data = await GetProfilesProvider().getConnects(uid, page.toString());

    if (data != null) {
      clearConnects();
      List<Filtercommunity>? com = data.filtercommunity;
      List<FilteredPref>? pref = data.filteredPref;

      if (pref != null && com != null) {
        appendConnects(com, pref);
        print(filterCommunity.length);
        print(filterPref.length);
      }
    }
  }

  void getMoreMembers() async {
    if (isCompleted == false) {
      print('---------- is completed is = $isCompleted ---------------');
      String uid = '${FirebaseAuth.instance.currentUser?.uid}';
      Doc? data = await GetProfilesProvider().getConnects(uid, page.toString());
      if (data != null) {
        if (data.filteredPref?.length == 0 &&
            data.filtercommunity?.length == 0) {
          //if doc is empty means nothing more is present there
          isCompleted = true;
        } else {
          List<Filtercommunity>? com = data.filtercommunity;
          List<FilteredPref>? pref = data.filteredPref;
          if (pref != null && com != null) {
            appendConnects(com, pref);
          }
          page += 1;
        }
      }
    }
  }

  void appendConnects(List<Filtercommunity> com, List<FilteredPref> pref) {
    filterCommunity.addAll(com);
    filterPref.addAll(pref);
  }

  void clearConnects() {
    filterPref.clear();
    filterCommunity.clear();
  }

  @override
  void onInit() {
    super.onInit();
    getNewMembers();
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
