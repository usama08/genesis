import 'package:firebase_auth/firebase_auth.dart';
import 'package:genesis/app/modules/inbox/widgets/HomePage_chat.dart';
import 'package:genesis/app/modules/inbox/widgets/UserModel.dart';
import 'package:genesis/app/modules/member/views/temp/temp_members.dart';
import 'package:genesis/app/modules/premium/views/premium_view.dart';
import 'package:get/get.dart';
import '../../profile/views/profile_view.dart';

UserModel user = UserModel(
    uid: FirebaseAuth.instance.currentUser?.uid,
    email: FirebaseAuth.instance.currentUser?.email,
    fullname: FirebaseAuth.instance.currentUser?.displayName,
    profilepic: FirebaseAuth.instance.currentUser?.photoURL);

class HomeController extends GetxController {
  var index = 2.obs; //RecentChats()
  final List pages = [
    const ProfileView(),
    HomePage(
      userModel: user,
      firebaseUser: FirebaseAuth.instance.currentUser,
    ),
    const TempMembers(),
    // GamesView(),
    const PremiumView()
  ].obs;

  // final List pages = [ProfileView(),HomePage(userModel: user, firebaseUser: FirebaseAuth.instance.currentUser,),TempMembers(),GamesView(),PremiumView()].obs;

  @override
  void onInit() {
    super.onInit();
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
