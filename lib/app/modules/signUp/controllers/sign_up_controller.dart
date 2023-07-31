import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:genesis/app/data/providers/sign_up_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:genesis/app/data/models/signup_model.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class SignUpController extends GetxController {
  //controllers
  UserCredential? userCredential;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //data to display in dropdown
  List<String> radiosValue = ['Myself', 'My Son', 'My Daughter', 'My Brother', 'My Sister', 'My Fiend', 'My Relative'];
  List<String> martialStatus = ['Single', 'Married', 'Never Married', 'Widowed', 'Divorced', 'Its Complicated', 'I\'d rather not say'];
  List<String> diet = ['Veg', 'Non-Veg', 'Occasionally Veg', 'Occasionally non-veg'];
  //List<String> height = ['3.0\'','3.0-3.5\'','3.5-4.0\'','4.0-4.5\'','4.5-5.0\'','5.0-5.5\'','5.5-6.0\'','6.0-6.5\'','6.5-7.0\'','7.0+\''];
  List<String> height = [
    '4\'1\"',
    '4\'2\"',
    '4\'3\"',
    '4\'4\"',
    '4\'5\"',
    '4\'6\"',
    '4\'7\"',
    '4\'8\"',
    '4\'9\"',
    '4\'10\"',
    '4\'11\"',
    '5\'0\"',
    '5\'1\"',
    '5\'2\"',
    '5\'3\"',
    '5\'4\"',
    '5\'5\"',
    '5\'6\"',
    '5\'7\"',
    '5\'8\"',
    '5\'9\"',
    '5\'10\"',
    '5\'11\"',
    '6\'0\"',
    '6\'1\"',
    '6\'2\"',
    '6\'3\"',
    '6\'4\"',
    '6\'5\"',
    '6\'6\"',
    '6\'7\"',
    '6\'8\"',
    '6\'9\"',
    '6\'10\"',
    '6\'11\"',
    '7\'0\"'
  ];
  List<String> qualification = ['Metric', 'Inter', 'BS', 'MS', 'MPhil', 'PHD'];
  List<String> workWith = ['Business', 'Self Employed', 'Other'];
  List<String> workAs = [
    'Receptionist',
    'Internee',
    'Assistant',
    'Manager',
    'Auditor',
    'Account Executive',
    'Secretary',
    'Human Resource',
    'Executive Assistant',
    'Chief Executive Officer'
  ];
  List<String> salaryRange = [
    'less than 50k',
    '50-100k',
    '100-150k',
    '150-200k',
    '200-250k',
    '250-300k',
    '300-350k',
    '350-400k',
    'Grater than 400k'
  ];
  List<String> gender = ['Male', 'Female', 'Not Specified'];
  List<int> age = List.generate(75 - 18 + 1, (index) => index + 18);
  List selectedCreative = [].obs;
  List selectedFun = [].obs;
  List selectedFitness = [].obs;
  List selectedOther = [].obs;

  //selected values from the user
  var selectedRadio = ''.obs;
  var selectedCountry = ''.obs;
  var selectedGender = ''.obs;
  var selectedMartialStatus = ''.obs;
  var selectedDiet = ''.obs;
  var selectedHeight = ''.obs;
  var selectedQualification = ''.obs;
  var selectedWorkWith = ''.obs;
  var selectedWorkAs = ''.obs;
  var selectedSalary = ''.obs;
  var isLoading = false.obs;
  var selectedLat = ''.obs;
  var selectedLong = ''.obs;
  int? selectedAge;

  //nullable variables
  String? state;
  String? city;

  //text fields controllers
  TextEditingController college = TextEditingController();
  TextEditingController anotherCollege = TextEditingController();
  TextEditingController business = TextEditingController();

  //post request
  Future<bool> postSignup(BuildContext context) async {
    isLoading.value = false;
    SimpleFontelicoProgressDialog pd = SimpleFontelicoProgressDialog(context: context);
    pd.show(message: 'Processing...', type: SimpleFontelicoProgressDialogType.threelines, indicatorColor: Color(0xff800000));

    List<Hobby> hobby = [];
    selectedCreative.forEach((element) {
      Hobby hobbies = Hobby(type: 'Creative', hobby: element);
      hobbies.toJson();
      hobby.add(hobbies);
    });
    selectedFun.forEach((element) {
      Hobby hobbies = Hobby(type: 'Fun', hobby: element);
      hobbies.toJson();
      hobby.add(hobbies);
    });
    selectedFitness.forEach((element) {
      Hobby hobbies = Hobby(type: 'Fitness', hobby: element);
      hobbies.toJson();
      hobby.add(hobbies);
    });
    for (var element in selectedOther) {
      Hobby hobbies = Hobby(type: 'Other Interests', hobby: element);
      hobbies.toJson();
      hobby.add(hobbies);
    }

    Qualification qla =
        Qualification(qualificationType: selectedQualification.value, collegeOne: college.text, collegeTwo: anotherCollege.text)..toJson();

    SignupModel model = SignupModel(
      height: selectedHeight.value,
      anualIncome: selectedSalary.value,
      country: selectedCountry.value,
      age: selectedAge ?? 18,
      gender: selectedGender.value,
      state: '$state',
      city: '$city',
      //latitude: selectedLat.value,
      //longitude: selectedLong.value,
      latitude: '',
      longitude: '',
      designation: selectedWorkAs.value,
      diet: selectedDiet.value,
      email: '${userCredential?.user?.email}',
      employment: selectedWorkWith.value,
      ownBuisness: business.text.toString(),
      martialStatus: selectedMartialStatus.value,
      username: userCredential?.user?.displayName != null ? '${userCredential?.user?.displayName}' : 'Person',
      qualification: [qla],
      profileFor: selectedRadio.value,
      phone: '${userCredential?.user?.phoneNumber}',
      //workAs: selectedWorkAs.value,
      uid: '${userCredential?.user?.uid}',
      provider: 'Google',
      defaultImg: userCredential?.user?.photoURL != null ? '${userCredential?.user?.photoURL}' : '',
      hobbies: hobby,
      bio: 'Hey there am using Genesis Matrimony',
    );

    final res = await SignUpProvider().postCredentials(model);

    await _firestore.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).set({
      'name': FirebaseAuth.instance.currentUser?.displayName,
      'email': FirebaseAuth.instance.currentUser?.email,
      'uid': FirebaseAuth.instance.currentUser?.uid,
      'createdAt': DateTime.now(),
      'phone': FirebaseAuth.instance.currentUser?.phoneNumber,
      'imgUrl': FirebaseAuth.instance.currentUser?.photoURL != null ? '${FirebaseAuth.instance.currentUser?.photoURL}' : ''
    });

    pd.hide();
    isLoading.value = false;
    return res;
  }

  // Future<bool> handleLocationPermission(BuildContext context) async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Location services are disabled. Please enable the services')));
  //     return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           const SnackBar(content: Text('Location permissions are denied')));
  //       return false;
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //         content: Text('Location permissions are permanently denied, we cannot request permissions.')));
  //     return false;
  //   }
  //   return true;
  // }

  // Future<Position> currentPosition()async{
  //   return await Geolocator.getCurrentPosition();
  // }
  //
  // Future<Position> determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Test if location services are enabled.
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     // Location services are not enabled don't continue
  //     // accessing the position and request users of the
  //     // App to enable the location services.
  //     return Future.error('Location services are disabled.');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       // Permissions are denied, next time you could try
  //       // requesting permissions again (this is also where
  //       // Android's shouldShowRequestPermissionRationale
  //       // returned true. According to Android guidelines
  //       // your App should show an explanatory UI now.
  //       return Future.error('Location permissions are denied');
  //     }
  //   }
  //
  //   if (permission == LocationPermission.deniedForever) {
  //     // Permissions are denied forever, handle appropriately.
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }
  //
  //   // When we reach here, permissions are granted and we can
  //   // continue accessing the position of the device.
  //   return await Geolocator.getCurrentPosition();
  // }

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
