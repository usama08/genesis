import 'package:flutter/material.dart';
import 'package:genesis/app/data/providers/my_details_provider(post).dart';
import 'package:genesis/app/data/providers/prefrences_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PartnerPreferences extends StatefulWidget {
  const PartnerPreferences({Key? key}) : super(key: key);

  @override
  State<PartnerPreferences> createState() => _PartnerPreferencesState();
}

class _PartnerPreferencesState extends State<PartnerPreferences> {
  PartnerPreferencesController controller = Get.put(PartnerPreferencesController());
  int? minAge;
  int? maxAge;
  String? minHeight;
  String? maxHeight;
  String? maritialStatus;
  String? religion;
  String? community;
  String? motherTongue;
  Map packedData = {};

  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const SizedBox(height: 65,),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const Text('Recommended Partner Preferences',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),),
                    const SizedBox(height: 10,),
                    Text(
                      'We have set these Preferences to show you the best Matches for your Profile',
                      style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 18
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 20,),

              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Basic Details',style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 20
                    ),),
                    const Divider(thickness: 1,),
                    ListTile(
                      onTap: (){
                        //bottom sheet
                        Get.bottomSheet(
                            StatefulBuilder(
                                builder:  (context,setState){
                                  return Container(
                                      height: Get.height*0.50,
                                      width: Get.width,
                                      color: Colors.white,
                                      child: Column(
                                        children: [
                                          const Text('Select the age range ',style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 23
                                          ),),
                                          const SizedBox(height: 10,),
                                          const Text('Minimum age can be 18',style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16
                                          ),),
                                          const SizedBox(height: 10,),

                                          SizedBox(
                                            width: 200,
                                            child: DropdownButtonFormField<int>(
                                                decoration: const InputDecoration(
                                                    border: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.black)
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.black)
                                                    )
                                                ),
                                                value: minAge,
                                                hint: Text('Select min age'),
                                                style: TextStyle(color: Colors.black),
                                                menuMaxHeight: Get.height*0.20,
                                                icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                                                elevation: 5,
                                                items: controller.minAgeRange.map((e) =>
                                                    DropdownMenuItem<int>(
                                                        value: e,
                                                        child: Text(e.toString(),style: TextStyle(color: Colors.black),)
                                                    )
                                                ).toList(),
                                                onChanged: (value){
                                                  setState(() {
                                                    minAge=value;
                                                  });
                                                  controller.minAge.value = '$minAge';
                                                  print(minAge);
                                                }
                                            ),
                                          ),
                                          const SizedBox(height: 10,),
                                          const Text('Maximum age 35',style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 16
                                          ),),

                                          SizedBox(height: 10,),

                                          SizedBox(
                                            width: 200,
                                            child: DropdownButtonFormField<int>(
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)
                                                )
                                              ),
                                                value: maxAge,
                                                hint: Text('Select max age'),
                                                style: TextStyle(color: Colors.black),
                                                menuMaxHeight: Get.height*0.20,
                                                icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),

                                                items: controller.maxAgeRange.map((e) =>
                                                    DropdownMenuItem<int>(
                                                        value: e,
                                                        child: Text(e.toString(),style: TextStyle(color: Colors.black),)
                                                    )
                                                ).toList(),
                                                onChanged: (value){
                                                  setState(() {
                                                    maxAge=value;
                                                  });
                                                  controller.maxAge.value='$maxAge';
                                                  print(maxAge);
                                                }
                                            ),
                                          ),
                                          SizedBox(height: 20,),


                                          ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff800000),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(23)
                                              ),
                                            ),
                                              onPressed: (){
                                                Get.back();
                                              },
                                              child: Text('Done')
                                          )
                                        ],
                                      ),
                                  );
                                }
                            )
                        );

                      },
                      leading: Image.network(
                          'https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/null/external-age-range-dating-app-flaticons-lineal-color-flat-icons-2.png',
                        height: 40,
                        width: 40,
                      ),
                      title: const Text('Age Range'),
                      subtitle: Obx(()=>
                          Text(
                              controller.maxAge.value!='' || controller.minAge.value!=''?
                              '${controller.minAge.value} to ${controller.maxAge.value}':'Select age range'
                          ),
                      ),
                      trailing:const Icon(Icons.arrow_forward_ios),

                    ),
                    const Divider(thickness: 1,),
                    //height range
                    ListTile(
                      onTap: (){
                        Get.bottomSheet(
                          StatefulBuilder(
                              builder: (context,setState){
                                return Container(
                                  height: Get.height*0.50,
                                  width: Get.width,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      const Text('Select the height range ',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 23
                                      ),),
                                      const SizedBox(height: 10,),
                                      const Text('Minimum height can be 4\'5',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16
                                      ),),
                                      const SizedBox(height: 10,),

                                      //min height range
                                      SizedBox(
                                        width: 200,
                                        child: DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)
                                                )
                                            ),
                                            value: minHeight,
                                            hint: Text('Select min height'),
                                            style: TextStyle(color: Colors.black),
                                            menuMaxHeight: Get.height*0.20,
                                            icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                                            items: controller.minHeightRange.map((e) =>
                                                DropdownMenuItem<String>(
                                                    value: e,
                                                    child: Text(e.toString(),style: TextStyle(color: Colors.black),)
                                                )
                                            ).toList(),
                                            onChanged: (value){
                                              setState(() {
                                                minHeight=value;
                                              });
                                              print(minHeight);
                                            }
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      const Text('Maximum height 7\'0',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 16
                                      ),),
                                      const SizedBox(height: 10,),

                                      //max height range
                                      SizedBox(
                                        width: 200,
                                        child: DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)
                                                )
                                            ),
                                            value: maxHeight,
                                            hint: Text('Select max height'),
                                            style: TextStyle(color: Colors.black),
                                            menuMaxHeight: Get.height*0.20,
                                            icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                                            items: controller.maxHeightRange.map((e) =>
                                                DropdownMenuItem<String>(
                                                    value: e,
                                                    child: Text(e.toString(),style: TextStyle(color: Colors.black),)
                                                )
                                            ).toList(),
                                            onChanged: (value){
                                              setState(() {
                                                maxHeight=value;
                                              });
                                              print(maxHeight);
                                            }
                                        ),
                                      ),

                                      const SizedBox(height: 20,),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff800000),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(23)
                                            ),
                                          ),
                                          onPressed: (){
                                            Get.back();
                                          },
                                          child: const Text('Done')
                                      )

                                    ],
                                  ),
                                );
                              }
                          )
                        );
                      },
                      leading: Image.network('https://img.icons8.com/color/48/null/height.png',height: 40,width: 40,),
                      title: const Text('Height Range'),
                      subtitle: Text(
                        controller.minHeight.value!='' || controller.maxHeight.value!=''?
                        '$minHeight to $maxHeight':'Select height range'
                      ),
                      trailing:const Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(thickness: 1,),
                    ListTile(
                      onTap: (){
                        Get.bottomSheet(
                          StatefulBuilder(
                              builder: (context,setState){
                                return Container(
                                  height: Get.height*0.50,
                                  width: Get.width,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10,),
                                      const Text('Select the Maritial status ',style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 23
                                      ),),
                                      const SizedBox(height: 20,),

                                      SizedBox(
                                        width: 200,
                                        child: DropdownButtonFormField<String>(
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(color: Colors.black)
                                                )
                                            ),
                                            value: maritialStatus,
                                            hint: const Text('Select Maritial status'),
                                            style: const TextStyle(color: Colors.black),
                                            menuMaxHeight: Get.height*0.20,
                                            icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                                            items: controller.martialStatus.map((e) =>
                                                DropdownMenuItem<String>(
                                                    value: e,
                                                    child: Text(e.toString(),style: TextStyle(color: Colors.black),)
                                                )
                                            ).toList(),
                                            onChanged: (value){
                                              setState(() {
                                                maritialStatus=value;
                                              });
                                              controller.selectedMartialStatus.value='$maritialStatus';
                                              print(maritialStatus);
                                            }
                                        ),
                                      ),
                                      const SizedBox(height: 20,),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xff800000),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(23)
                                            ),
                                          ),
                                          onPressed: (){
                                            Get.back();
                                          },
                                          child: const Text('Done')
                                      )
                                    ],
                                  ),
                                );
                              }
                          )
                        );
                      },
                      leading: Image.network('https://img.icons8.com/emoji/48/null/ring.png',height: 40,width: 40,),
                      title: Text('Maritial Status'),
                      subtitle: Obx(() => Text(
                          controller.selectedMartialStatus.value!=''?
                          '$maritialStatus':'Select status'
                      ),
                      ),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),

              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Community',style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20
                    ),),
                    const Divider(thickness: 1,),
                    ListTile(
                      onTap: (){
                        Get.bottomSheet(
                            StatefulBuilder(
                                builder: (context,setState){
                                  return Container(
                                    height: Get.height*0.50,
                                    width: Get.width,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10,),
                                        const Text('Select Religion',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23
                                        ),),
                                        const SizedBox(height: 20,),

                                        SizedBox(
                                          width: 200,
                                          child: DropdownButtonFormField<String>(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black)
                                                  )
                                              ),
                                              value: religion,
                                              hint: const Text('Select Religion'),
                                              style: const TextStyle(color: Colors.black),
                                              menuMaxHeight: Get.height*0.30,
                                              icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                                              items: controller.religion.map((e) =>
                                                  DropdownMenuItem<String>(
                                                      value: e,
                                                      child: Text(e.toString(),style: TextStyle(color: Colors.black),)
                                                  )
                                              ).toList(),
                                              onChanged: (value){
                                                setState(() {
                                                  religion=value;
                                                });
                                                controller.selectedCommunity.value = '$religion';
                                                print(religion);
                                              }
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff800000),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(23)
                                              ),
                                            ),
                                            onPressed: (){
                                              Get.back();
                                            },
                                            child: const Text('Done')
                                        )
                                      ],
                                    ),
                                  );
                                }
                            )
                        );
                      },
                      leading: Image.network(
                          'https://img.icons8.com/external-flaticons-lineal-color-flat-icons/64/null/external-religions-religion-flaticons-lineal-color-flat-icons.png',
                        height: 40,
                        width: 40,
                      ),
                      title:const Text('Religion'),
                      subtitle: Obx(()=>
                          Text(
                              controller.selectedReligion.value!=''?
                              '$religion':'Select Religion'
                          )
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(thickness: 1,),
                    ListTile(
                      onTap: (){
                        Get.bottomSheet(
                            StatefulBuilder(
                                builder: (context,setState){
                                  return Container(
                                    height: Get.height*0.50,
                                    width: Get.width,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10,),
                                        const Text('Select Community',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23
                                        ),),
                                        const SizedBox(height: 20,),

                                        SizedBox(
                                          width: 200,
                                          child: DropdownButtonFormField<String>(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black)
                                                  )
                                              ),
                                              value: community,
                                              hint: const Text('Select Community'),
                                              style: const TextStyle(color: Colors.black),
                                              menuMaxHeight: Get.height*0.30,
                                              icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                                              items: controller.community.map((e) =>
                                                  DropdownMenuItem<String>(
                                                      value: e,
                                                      child: Text(e.toString(),style: TextStyle(color: Colors.black),)
                                                  )
                                              ).toList(),
                                              onChanged: (value){
                                                setState(() {
                                                  community=value;
                                                });
                                                controller.selectedCommunity.value = '$community';
                                                print(community);
                                              }
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff800000),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(23)
                                              ),
                                            ),
                                            onPressed: (){
                                              Get.back();
                                            },
                                            child: const Text('Done')
                                        )
                                      ],
                                    ),
                                  );
                                }
                            )
                        );
                      },
                      leading: Image.network('https://img.icons8.com/ios-filled/50/null/multicultural-people.png',height: 40,width: 40,),
                      title: const Text('Community'),
                      subtitle: Obx(() => Text(
                          controller.selectedCommunity.value!=''?
                          '$community':'Select Community'
                      )),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(thickness: 1,),
                    ListTile(
                      onTap: (){
                        Get.bottomSheet(
                            StatefulBuilder(
                                builder: (context,setState){
                                  return Container(
                                    height: Get.height*0.50,
                                    width: Get.width,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10,),
                                        const Text('Select MotherTongue',style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 23
                                        ),),
                                        const SizedBox(height: 20,),

                                        SizedBox(
                                          width: 200,
                                          child: DropdownButtonFormField<String>(
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black)
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black)
                                                  )
                                              ),
                                              value: motherTongue,
                                              hint: const Text('Select MotherTongue'),
                                              style: const TextStyle(color: Colors.black),
                                              menuMaxHeight: Get.height*0.30,
                                              icon: const Icon(Icons.arrow_drop_down,color: Colors.black,),
                                              items: controller.motherTongue.map((e) =>
                                                  DropdownMenuItem<String>(
                                                      value: e,
                                                      child: Text(e.toString(),style: TextStyle(color: Colors.black),)
                                                  )
                                              ).toList(),
                                              onChanged: (value){
                                                setState(() {
                                                  motherTongue=value;
                                                });
                                                controller.selectedTongue.value='$motherTongue';
                                                print(motherTongue);
                                              }
                                          ),
                                        ),
                                        const SizedBox(height: 20,),
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(0xff800000),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(23)
                                              ),
                                            ),
                                            onPressed: (){
                                              Get.back();
                                            },
                                            child: const Text('Done')
                                        )
                                      ],
                                    ),
                                  );
                                }
                            )
                        );
                      },
                      leading: Image.network('https://img.icons8.com/color/48/null/language-skill.png',height: 40,width: 40,),
                      title: Text('Mother Tounge'),
                      subtitle: Obx(() => Text(
                          controller.selectedTongue!=''?
                          '$motherTongue':'Select Mother Tongue'
                      )),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                height: 50,
                width: Get.width*0.40,
                child: ElevatedButton(
                  onPressed: ()async {
                    pd.show(message: 'Saving', type: SimpleFontelicoProgressDialogType.threelines, indicatorColor: const Color(0xff800000));
                    //await Future.delayed(const Duration(seconds: 2));

                    if(maxAge!=null && minAge!=null){
                      packedData.addAll({'startage':'$minAge'});
                      packedData.addAll({'endAge':'$maxAge'});
                    }
                    if(maxHeight!=null && minHeight!=null){
                      packedData.addAll({'startHeight':'$minHeight'});
                      packedData.addAll({'endHeight':'$maxHeight'});
                    }
                    if(maritialStatus!=null){
                      packedData.addAll({'preferedMartialStatus':'$maritialStatus'});
                    }
                    if(religion!=null){
                      packedData.addAll({'preferedReligion':'$religion'});
                    }
                    if(community!=null){
                      packedData.addAll({'preferedCommunity':'$community'});
                    }
                    if(motherTongue!=null){
                      packedData.addAll({'preferedMotherTongue':'$motherTongue'});
                    }
                    PreferencesProvider().updatePreferences(packedData);

                    pd.hide();
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff800000),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30)))
                  ),
                  child:const Text('Done',style: TextStyle(fontSize: 18),),
                ),
              ),
              const SizedBox(height: 20,),

            ],
          ),
        ),
      ),
    );
  }
}
class PartnerPreferencesController extends GetxController{
  List minAgeRange = [18,19,20,21,22,23,24,25,26,27,28,29,30];
  List maxAgeRange = [21,22,23,24,25,26,27,28,29,30,31,32,33,34,35];
  List minHeightRange = ['4\'1\"','4\'2\"','4\'3\"','4\'4\"','4\'5\"','4\'6\"','4\'7\"','4\'8\"','4\'9\"',
    '5\'0\"','5\'1\"','5\'2\"','5\'3\"','5\'4\"','5\'5\"','5\'6\"','5\'7\"','5\'8\"','5\'9\"','6\'0\"','6\'1\"','6\'2\"','6\'3\"'];
  List maxHeightRange = ['5\'0\"','5\'1\"','5\'2\"','5\'3\"','5\'4\"','5\'5\"','5\'6\"','5\'7\"','5\'8\"','5\'9\"','6\'0\"','6\'1\"','6\'2\"','6\'3\"',
  '6\'4\"','6\'5\"','6\'6\"','6\'7\"','6\'8\"','6\'9\"','7\'0\"'];

  List martialStatus = ['Single','Never Married','Widowed','Divorced'];

  List religion = ['Catholicism','Christianity'];

  List community = ['Punjabi','Sindhi','Balochi','Pashtoon'];
  List motherTongue = ['Punjabi','Sindhi','Balochi','Pashto','English'];

  var minAge = ''.obs;
  var maxAge = ''.obs;
  var minHeight = ''.obs;
  var maxHeight = ''.obs;
  var selectedMartialStatus = ''.obs;
  var selectedReligion = ''.obs;
  var selectedCommunity = ''.obs;
  var selectedTongue = ''.obs;

}
