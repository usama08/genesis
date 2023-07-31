import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class SignInController extends GetxController {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  var isLogin = false.obs;
  var index = 1.obs;

  var images = [
    'assets/mobileslide1.jpg',
    'assets/mobileslide2.jpg',
    'assets/mobileslide3.jpg'
  ];

  Future<UserCredential?> googlyLogin(BuildContext context) async {
    //ProgressDialog pd = ProgressDialog(context: context);
    //pd.show(msg: 'Please Wait',);

    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    pd.show(
        message: 'Processing...',
        type: SimpleFontelicoProgressDialogType.threelines,
        indicatorColor: Color(0xff800000));

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      //error handeling must be done here
      try {
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } catch (e) {
        print(e);
      }

      pd.hide();
    } else {
      pd.hide();
      Get.snackbar('Oops', 'Login Failed',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
    return null;
  }

  Future<UserCredential?> signInWithFacebook(BuildContext context) async {
    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    pd.show(
        message: 'Processing...',
        type: SimpleFontelicoProgressDialogType.threelines,
        indicatorColor: Color(0xff800000));
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();
    try {
      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential('${loginResult.accessToken?.token}');

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on Exception catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> firstFacebook() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (kDebugMode) {
      print("check access token----------------$accessToken");
    }

    if (accessToken != null) {
      if (kDebugMode) {
        print("access token  ${accessToken.toJson()}");
      }
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
    } else {
      _facebookLogin();
      if (kDebugMode) {}
    }
  }

  _facebookLogin() async {
    if (kDebugMode) {
      print("login step 1-------------");
    }
    final LoginResult result = await FacebookAuth.instance.login();
    if (kDebugMode) {
      print("login step 2-------------");
    }

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;
      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
      if (kDebugMode) {
        print(
            "login result ---------------------------${_accessToken!.token.toString()}");
        print(
            "login result Token ---------------------------${_accessToken!.token}");
      }
    } else {
      if (kDebugMode) {
        print("-------------${result.status}");
        print(result.message);
      }
    }
  }

  @override
  void onInit() async {
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
