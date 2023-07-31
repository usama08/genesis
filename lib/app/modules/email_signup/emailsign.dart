import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'emiallogin.dart';
import 'utils.dart';

class SignupEmail extends StatefulWidget {
  const SignupEmail({super.key});

  @override
  State<SignupEmail> createState() => _SignupEmailState();
}

class _SignupEmailState extends State<SignupEmail> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();

    _email.dispose();
    _password.dispose();
  }

  void login() async {
    setState(() {
      loading = true;
    });
    await _auth
        .createUserWithEmailAndPassword(
            email: _email.text.toString(), password: _password.text.toString())
        .then((value) {
      //this will route to signup
      if (value.user != null) {
        // Get.offAll(()=>
        //     SignUpView(user: value),
        //   binding: SignUpBinding(),
        // );
      }
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Center(child: Text("Sign up")),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FadeInUp(
                          delay: const Duration(milliseconds: 800),
                          duration: const Duration(milliseconds: 1500),
                          child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (!GetUtils.isEmail(value!)) {
                                  return "Enter Your Email!";
                                }
                                return null;
                              },
                              controller: _email,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  labelText: "Email",
                                  hintText: "Email",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.alternate_email,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  floatingLabelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1.5),
                                      borderRadius:
                                          BorderRadius.circular(10))))),
                      const SizedBox(height: 15),
                      FadeInUp(
                          delay: const Duration(milliseconds: 800),
                          duration: const Duration(milliseconds: 1500),
                          child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter Your Password!";
                                }
                                return null;
                              },
                              controller: _password,
                              cursorColor: Colors.black,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  hintText: "Password",
                                  hintStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                  floatingLabelStyle: const TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 1.5),
                                      borderRadius:
                                          BorderRadius.circular(10))))),
                    ],
                  ),
                ),
                Container(
                  height: 15,
                ),
                Row(
                  children: [
                    FadeInUp(
                        child: MaterialButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                            height: 50,
                            minWidth: 300,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.black,
                            child: loading
                                ? const CircularProgressIndicator(
                                    strokeWidth: 3, color: Colors.white)
                                : const Text(
                                    "Sign-up",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ))),
                  ],
                ),
                const SizedBox(height: 15),
                FadeInUp(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 1500),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an Account?",
                              style: TextStyle(
                                  color: Colors.grey.shade600, fontSize: 14)),
                          TextButton(
                              onPressed: () => Get.to(() => const LoginEmail()),
                              child: const Text('Login?',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w200)))
                        ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
