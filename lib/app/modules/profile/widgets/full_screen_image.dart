import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genesis/core/values/constants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class FullScreenImage extends StatefulWidget {
  final List images;
  const FullScreenImage({Key? key, required this.images}) : super(key: key);

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      body: SizedBox(
          height: Get.height,
          width: Get.width,
          child: ListView.builder(
            itemCount: widget.images.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Stack(
                children: [
                  Image.network(
                    '$IMGURL${widget.images[index]}',
                    height: Get.height,
                    width: Get.width,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                  Positioned(
                      top: 50,
                      left: Get.width - 50,
                      child: InkWell(
                          onTap: () async {
                            pd.show(
                                message: 'Processing...',
                                type: SimpleFontelicoProgressDialogType
                                    .threelines,
                                indicatorColor: Color(0xff800000));

                            var response = await http.post(
                              Uri.parse(
                                  'https://789b-158-220-104-228.ngrok-free.app/user/deleteImage'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                "uid":
                                    "${FirebaseAuth.instance.currentUser?.uid}",
                                "imagename": "${widget.images[index]}"
                              }),
                            );

                            if (response.statusCode == 200) {
                              Get.snackbar(
                                  'Success', 'Image is deleted successfully',
                                  backgroundColor: Colors.green,
                                  snackPosition: SnackPosition.BOTTOM);
                              pd.hide();
                            } else {
                              pd.hide();
                            }

                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.delete,
                            size: 25,
                            color: Colors.grey,
                          ))),
                ],
              );
            },
          )),
    );
  }
}
