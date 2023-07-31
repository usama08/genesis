import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../../../../core/functions/approval_status.dart';
import '../controllers/premium_controller.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class PremiumView extends StatefulWidget {
  const PremiumView({Key? key}) : super(key: key);

  @override
  State<PremiumView> createState() => _PremiumViewState();
}

class _PremiumViewState extends State<PremiumView> {
  PremiumController controller = Get.put(PremiumController());
  Map<String, dynamic>? paymentIntent;
  //final SECRET_KEY = 'sk_test_51MoP5pFBFOv36mzzlaTgpHlAo4gsrMsjWHPqsN16j8dLwqvTUfeu6AT8wcNJDERfNwzy2UmL30RicuQ5aL262PyJ00ZRKUHWpS';
  final SECRET_KEY =
      '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';

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
    });
  }

  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Plan'),
            centerTitle: true,
            backgroundColor: const Color(0xff800000),
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                    icon: ImageIcon(
                      NetworkImage(
                          'https://img.icons8.com/external-line-icons-royyan-wijaya/64/null/external-basic-geometricalist-line-icons-royyan-wijaya-22.png'),
                      size: 30,
                    ),
                    child: Text('Basic')),
                // Tab(icon: ImageIcon(NetworkImage('https://img.icons8.com/fluency-systems-regular/48/null/guarantee.png'),size: 30,),child: Text('Premium')),
                // Tab(icon: ImageIcon(NetworkImage('https://img.icons8.com/external-bearicons-glyph-bearicons/64/null/external-Platinum-miscellany-texts-and-badges-bearicons-glyph-bearicons.png'),size: 30,),child: Text('Platinum')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              //basic package
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.15,
                      vertical: Get.height * 0.10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Color(0xff800000).withOpacity(0.8),
                    // const Color(0xff42adff),
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Basic',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      const Text(
                        '\$0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                    text: '  Profile setup',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                    text: '  Search your matches',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                    text: '  Chat with connects',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                  text: '  Let matches contact directly',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // SizedBox(
                      //   width: Get.width,
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       RichText(
                      //         text: const TextSpan(children: [
                      //           WidgetSpan(
                      //               child: Icon(
                      //             Icons.close,
                      //             color: Colors.red,
                      //             size: 20,
                      //           )),
                      //           // TextSpan(
                      //           //     text: '  Game Play',
                      //           //     style: TextStyle(
                      //           //         color: Colors.white, fontSize: 15))
                      //         ]),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      SizedBox(
                        height: 40,
                        width: 140,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.white, //Color(0xff800000),
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            onPressed: () {},
                            child: const Text(
                              'Active',
                              style: TextStyle(color: Colors.green),
                            )),
                      )
                    ],
                  ),
                ),
              ),

              //platinum
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.15,
                      vertical: Get.height * 0.10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Premium',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        '\$30',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Color(0xff800000)),
                        child: const Center(
                            child: Text(
                          '3 months subscription',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.cloud_done_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                      TextSpan(
                                          text: '  Profile setup',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15))
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.cloud_done_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                      TextSpan(
                                          text: '  Search your matches',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15))
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.cloud_done_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                      TextSpan(
                                          text: '  Chat with connects',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15))
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.cloud_done_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                      TextSpan(
                                        text: '  Let matches contact directly',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ]),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: const TextSpan(children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.cloud_done_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                      TextSpan(
                                          text: '  Game Play',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15))
                                    ]),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      SizedBox(
                        height: 40,
                        width: 140,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            onPressed: () async {
                              pd.show(
                                  message: 'Working',
                                  type: SimpleFontelicoProgressDialogType
                                      .threelines,
                                  indicatorColor: Color(0xff800000));
                              //Get.snackbar('Congratulations','Free mode is activated for your profile',backgroundColor: Colors.green,snackPosition: SnackPosition.BOTTOM);

                              makePayment('30');
                              await Future.delayed(Duration(seconds: 4));

                              pd.hide();
                            },
                            child: Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.black),
                            )),
                      )
                    ],
                  ),
                ),
              ),

              //gold
              SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Get.width * 0.15,
                      vertical: Get.height * 0.10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0xff800000),
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Platinum',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: Get.height * 0.023,
                      ),
                      const Text(
                        '\$50',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Text('6 months long subscription'),
                      Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                            color: Colors.white),
                        child: const Center(
                            child: Text(
                          '6 months long subscription',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        )),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                    text: '  Profile setup',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ]),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                    text: '  Search your matches',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ]),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                    text: '  Chat with connects',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ]),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                  text: '  Let matches contact directly',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )
                              ]),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(children: [
                                WidgetSpan(
                                    child: Icon(
                                  Icons.cloud_done_rounded,
                                  color: Colors.white,
                                  size: 20,
                                )),
                                TextSpan(
                                    text: '  Game Play',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15))
                              ]),
                            )
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        height: 40,
                        width: 140,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            onPressed: () async {
                              pd.show(
                                  message: 'Working',
                                  type: SimpleFontelicoProgressDialogType
                                      .threelines,
                                  indicatorColor: Color(0xff800000));
                              //await Future.delayed( Duration(seconds: 2));
                              //Get.snackbar('Congratulations','Free mode is activated for your profile',backgroundColor: Colors.green,snackPosition: SnackPosition.BOTTOM);
                              makePayment('50');
                              await Future.delayed(Duration(seconds: 4));
                              pd.hide();
                            },
                            child: const Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.black),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Future<void> makePayment(String amount) async {
    try {
      paymentIntent = await createPaymentIntent(amount, 'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.system,
                  customFlow: false,
                  customerEphemeralKeySecret: paymentIntent!['ephemeralKey'],
                  merchantDisplayName: 'Genesis Matrimony'))
          .then((value) {});

      ///now finally display payment sheet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          ),
                          Text("Payment Successful"),
                        ],
                      ),
                    ],
                  ),
                ));
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("paid successfully")));
        //here i will made api call and tell the server about the successful payment

        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $SECRET_KEY',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      print('Payment Intent Body->>> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
