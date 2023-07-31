import 'package:get/get.dart';

import '../modules/games/bindings/games_binding.dart';
import '../modules/games/views/games_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/inbox/bindings/inbox_binding.dart';
import '../modules/inbox/views/trash/inbox_view.dart';
import '../modules/member/bindings/member_binding.dart';
import '../modules/member/views/member_view.dart';
import '../modules/premium/bindings/premium_binding.dart';
import '../modules/premium/views/premium_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/signIn/bindings/sign_in_binding.dart';
import '../modules/signIn/views/sign_in_view.dart';
import '../modules/signUp/bindings/sign_up_binding.dart';
import '../modules/signUp/views/sign_up_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () {
        SignUpView user = Get.arguments;
        return user;
      },
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.MEMBER,
      page: () => const MemberView(),
      binding: MemberBinding(),
    ),
    GetPage(
      name: _Paths.INBOX,
      page: () => const InboxView(),
      binding: InboxBinding(),
    ),
    GetPage(
      name: _Paths.PREMIUM,
      page: () => const PremiumView(),
      binding: PremiumBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    // GetPage(
    //   name: _Paths.GAMES,
    //   page: () => const GamesView(),
    //   binding: GamesBinding(),
    // ),
  ];
}
