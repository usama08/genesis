import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:genesis/app/modules/signIn/bindings/sign_in_binding.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/modules/signIn/views/sign_in_view.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';
import 'package:sizer/sizer.dart';

var uuid = const Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  //Stripe.publishableKey = 'pk_live_51MoP5pFBFOv36mzznSm7pRp0A1Mm12gs9bNgaHgqSKrwap7HyGLLSVMPCvYiaDZ8mcsQppAtDDpgst22wlCgwl2f00qSeVbJPc';
  //Stripe.publishableKey = 'pk_test_51MoP5pFBFOv36mzz2mZr84zuexwLU5z6taJYmdWFKgxK3CkvIb8plBEdFdS6gfs9blhmqxldqyWcJWeuk0k5wGvx00rZeFfzXL';
  Stripe.publishableKey =
      'pk_live_51MoP5pFBFOv36mzznSm7pRp0A1Mm12gs9bNgaHgqSKrwap7HyGLLSVMPCvYiaDZ8mcsQppAtDDpgst22wlCgwl2f00qSeVbJPc';
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Genesis",
          //initialRoute: Routes.SIGN_UP,//AppPages.INITIAL,
          //initialRoute: handleAuthState(),
          initialBinding: SignInBinding(),
          getPages: AppPages.routes,
          opaqueRoute: true,
          popGesture: false,
          home: AnimatedSplashScreen(
            splash: Image.asset('assets/new-logo.png'),
            //nextScreen: SignInView(),//SignInController().handleAuthState(),//SignInView(),
            nextRoute: handleAuthState(),
            nextScreen: const SignInView(),
            duration: 1500,
            animationDuration: const Duration(milliseconds: 2500),
            splashIconSize: Get.width * 0.50,
            splashTransition: SplashTransition.fadeTransition,
            //pageTransitionType: PageTransitionType.scale,
          ));
    }),
  );
}

handleAuthState() {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    return Routes.HOME;
  } else {
    return null;
  }
}
