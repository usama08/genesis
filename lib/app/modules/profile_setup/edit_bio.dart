import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genesis/app/data/providers/add_desription_provider.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class EditBio extends StatefulWidget {
  const EditBio({Key? key}) : super(key: key);

  @override
  State<EditBio> createState() => _EditBioState();
}

class _EditBioState extends State<EditBio> {
  TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Decription'),
        centerTitle: true,
        backgroundColor: Color(0xff800000),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: SizedBox(
                  height: 500,
                  child: TextFormField(
                    controller: description,
                    textCapitalization: TextCapitalization.sentences,
                    autocorrect: true,
                    keyboardType: TextInputType.multiline,
                    showCursor: true,
                    expands: true,
                    maxLines: null,
                    textAlignVertical: TextAlignVertical.top,

                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration:const InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      hintText: 'Tell us about you',
                      //label: Text('Description'),
                      //labelStyle: TextStyle(color: Colors.black)
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10,),

              SizedBox(
                height: 40,
                width: 120,
                child: ElevatedButton(
                    onPressed: ()async{

                      if(description.text.isEmpty){
                        Get.back();
                      }
                      else{
                        AddDescriptionProvider().postDescription(description.text.trim(), FirebaseAuth.instance.currentUser!.uid);
                        Get.back();
                      }
                      //await Future.delayed(const Duration(seconds: 2));
                      pd.hide();
                      print(description.text.trim());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff800000),
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                    ),
                    child: const Text('Done')
                ),
              )


            ],
          ),
        )
      ),
    );
  }
}
