import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genesis/app/modules/email_signup/emiallogin.dart';
import 'package:genesis/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../home/views/home_view.dart';
import '../../signUp/bindings/sign_up_binding.dart';
import '../../signUp/views/sign_up_view.dart';
import '../controllers/sign_in_controller.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:card_swiper/card_swiper.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueSetter<String> onSignIn;

    return Scaffold(
      body: SafeArea(
          child: Obx(() => Container(
                color: Colors.red,
                height: Get.height,
                width: Get.width,
                child: Stack(
                  children: [
                    Positioned(
                        child: ClipPath(
                      clipper: OvalBottomBorderClipper(),
                      child: Container(
                        height: Get.height * 0.80,
                        width: Get.width,
                        color: Colors.grey,
                        child: Swiper(
                          itemCount: 3,
                          autoplay: true,
                          duration: 1500,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.asset(
                              "assets/mobileslide${index + 1}.jpg",
                              fit: BoxFit.fill,
                            );
                          },
                          onIndexChanged: (value) {
                            controller.index.value = value;
                          },
                        ),
                      ),
                    )),

                    Positioned(
                      top: Get.height * 0.86,
                      left: Get.width * 0.45,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: controller.images.map(
                          (e) {
                            int index = controller.images.indexOf(e);
                            return Container(
                              width: 10.0,
                              height: 10.0,
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              decoration: BoxDecoration(
                                color: index == controller.index.value ? Colors.white : Colors.grey,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),

                    Positioned(
                        top: Get.height * 0.30,
                        child: SizedBox(
                            width: Get.width,
                            child: Column(
                              children: const [
                                Text(
                                  'Touched Over',
                                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '4 Million Lives',
                                  style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ))),

                    Positioned(
                      top: Get.height * 0.45,
                      child: SizedBox(
                        //height: 200,
                        width: Get.width,
                        //color: Colors.orangeAccent,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                var user = await controller.googlyLogin(context);
                                if (user != null) {
                                  if (user.additionalUserInfo!.isNewUser) {
                                    Get.offAll(
                                        () => SignUpView(
                                              user: user,
                                              appledata: false,
                                            ),
                                        binding: SignUpBinding());
                                  } else {
                                    Get.offAll(() => const HomeView(), binding: HomeBinding());
                                  }
                                }
                              },
                              child: Container(
                                height: 55,
                                width: Get.width * 0.60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  //border: Border.all(color: Colors.black)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset('assets/google.png', height: 40, width: 40),
                                    controller.isLogin.value == true
                                        ? const Text(
                                            'Sign Up with google',
                                            style: TextStyle(color: Colors.black, fontSize: 16),
                                          )
                                        : const Text(
                                            'Sign In with google',
                                            style: TextStyle(color: Colors.black, fontSize: 16),
                                          )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            //
                            InkWell(
                              onTap: () async {
                                //Get.snackbar('Facebook Login', 'This login is under construction');

                                // var user = await controller.googlyLogin(context);
                                // if(user!=null){
                                //
                                //   if(user.additionalUserInfo!.isNewUser){
                                //     Get.offAll(()=>SignUpView(user: user,),binding: SignUpBinding());
                                //   }
                                //   else Get.offAll(()=>HomeView(),binding: HomeBinding());
                                //
                                // }

                                //controller.firstFacebook();
                                var user = await controller.signInWithFacebook(context);
                                if (user != null) {
                                  if (user.additionalUserInfo!.isNewUser) {
                                    Get.offAll(
                                        () => SignUpView(
                                              user: user,
                                              appledata: false,
                                            ),
                                        binding: SignUpBinding());
                                  } else {
                                    Get.offAll(() => const HomeView(), binding: HomeBinding());
                                  }
                                }
                              },
                              child: Container(
                                height: 55,
                                width: Get.width * 0.60,
                                decoration: BoxDecoration(color: const Color(0xff3b5998), borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.facebook,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    controller.isLogin.value == true
                                        ? const Text('Sign Up with facebook', style: TextStyle(color: Colors.white, fontSize: 16))
                                        : const Text('Sign In with facebook', style: TextStyle(color: Colors.white, fontSize: 16))
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                            InkWell(
                              onTap: () => Get.to(() => const LoginEmail()),
                              child: Container(
                                height: 55,
                                width: Get.width * 0.60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/person.jpg",
                                      width: 30,
                                      height: 30,
                                    ),
                                    const Text("Sign In with Email",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                        )),
                                  ],
                                ),
                              ),
                            ),
                            // apple signup
                            const SizedBox(
                              height: 10,
                            ),

                            InkWell(
                              onTap: () async {
                                final appleIdCredential = await SignInWithApple.getAppleIDCredential(
                                  scopes: [
                                    AppleIDAuthorizationScopes.email,
                                    AppleIDAuthorizationScopes.fullName,
                                  ],
                                  webAuthenticationOptions: WebAuthenticationOptions(
                                    redirectUri: Uri.parse('https://api.dreamwod.app/auth/callbacks/apple-sign-in'),
                                    clientId: 'com.dreamwod.app.login',
                                  ),
                                );

                                // Get.snackbar('Apple Login',
                                //     'This Login is under construction');
                                debugPrint("credentails app::::::::::::$appleIdCredential");
                                debugPrint("credentails Token::::::::::::${appleIdCredential.identityToken}");
                                final credential = OAuthProvider('apple.com').credential(
                                  idToken: appleIdCredential.identityToken,
                                  accessToken: appleIdCredential.authorizationCode,
                                );

                                // use the credential to sign in to firebase
                                var user = await FirebaseAuth.instance.signInWithCredential(credential);
                                // if (credential.state != null) {
                                if (appleIdCredential.identityToken != null) {
                                  Get.offAll(
                                      () => SignUpView(
                                            user: user,
                                            appleCredentials: appleIdCredential,
                                            appledata: true,
                                          ),
                                      binding: SignUpBinding());
                                } else {
                                  Get.offAll(() => const HomeView(), binding: HomeBinding());
                                  //  }
                                }

                                // get an OAuthCredential
                              },
                              child: Container(
                                height: 55,
                                width: Get.width * 0.60,
                                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.apple,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                    controller.isLogin.value == true
                                        ? const Text('SignUp with Apple', style: TextStyle(color: Colors.white, fontSize: 16))
                                        : const Text('SignIn with Apple', style: TextStyle(color: Colors.white, fontSize: 16))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //already have an account

                    Positioned(
                        top: Get.height * 0.92,
                        child: SizedBox(
                          width: Get.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(color: Colors.white, fontSize: 13),
                              ),
                              controller.isLogin.value == true
                                  ?
                                  //true case
                                  InkWell(
                                      onTap: () {
                                        print('signup text is pressed');
                                        controller.isLogin.value = false;
                                      },
                                      child: const Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.black, fontSize: 12),
                                      ),
                                    )
                                  :
                                  //false case
                                  InkWell(
                                      onTap: () {
                                        print('signup text is pressed');
                                        controller.isLogin.value = true;
                                      },
                                      child: const Text(
                                        'Sign Up',
                                        style: TextStyle(color: Colors.black, fontSize: 12),
                                      ),
                                    )
                            ],
                          ),
                        )),

                    // SizedBox(
                    //   height: 30,
                    //   child: Row(
                    //     children: [
                    //       const Text(
                    //         'Already have an account?',
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 12
                    //         ),
                    //       ),
                    //
                    //       controller.isLogin.value?
                    //       const Text(
                    //         'SignIn',
                    //         style: TextStyle(
                    //             color: Colors.white,
                    //             fontSize: 12
                    //         ),
                    //       ):Text(
                    //         'SignUp',
                    //         style: const TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 12
                    //         ),
                    //       )
                    //
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ))),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()async{
      //     //bool perm = await controller.handleLocationPermission(context);
      //
      //     //Get.to(()=> HomeView(),binding: HomeBinding());
      //   },
      // ),
    );
  }
}
