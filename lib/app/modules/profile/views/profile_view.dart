import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:genesis/app/modules/premium/bindings/premium_binding.dart';
import 'package:genesis/app/modules/premium/views/premium_view.dart';
import 'package:genesis/app/modules/profile/views/gender_sheet.dart';
import 'package:genesis/app/modules/profile/widgets/full_screen_image.dart';
import 'package:genesis/app/modules/profile_setup/my_community.dart';
import 'package:genesis/app/modules/profile_setup/partner_preferences.dart';
import 'package:genesis/app/modules/signIn/bindings/sign_in_binding.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/functions/gallery_permissions.dart';
import '../../../../core/values/constants.dart';
import '../../profile_setup/edit_bio.dart';
import '../../profile_setup/my_details.dart';
import '../../signIn/views/sign_in_view.dart';
import '../controllers/profile_controller.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = Get.put(ProfileController());
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // if(await isApproved()){
      //   Get.snackbar(
      //       'Oops',
      //       'Your profile is not approved by admin yet!',
      //     backgroundColor: Colors.orange,
      //     snackPosition: SnackPosition.TOP,
      //     duration: const Duration(seconds: 5)
      //   );
      //   //BottomLoginSheet();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor: const Color(0xff800000),
      ),
      body: SizedBox(
        height: 100.h,
        width: 100.0.w,
        child: RefreshIndicator(
          backgroundColor: Colors.white,
          color: const Color(0xff800000),
          onRefresh: () async {
            await controller.getMyDetails();
          },
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //first box of profile
                Card(
                  child: Container(
                    height: 190,
                    width: Get.width,
                    color: const Color(0xff800000),
                    child: Obx(
                      () => controller.isLoading.isTrue
                          ? const Center(
                              child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: Color(0xff800000),
                            ))
                          : Stack(
                              children: [
                                //image of the person
                                Positioned(
                                  top: 15,
                                  left: 5,
                                  child: CircleAvatar(
                                    radius: 70,
                                    child: ClipOval(
                                        // ignore: prefer_is_empty
                                        child: controller.profile?.userImages
                                                    ?.length !=
                                                0
                                            ? InkWell(
                                                onTap: () {
                                                  List? x = controller
                                                      .profile?.userImages;
                                                  if (x != null) {
                                                    Get.to(() =>
                                                        FullScreenImage(
                                                            images: x));
                                                  }
                                                },
                                                child: Image.network(
                                                  //user!.photoURL.toString(),
                                                  '$IMGURL${controller.profile?.userImages?.last}',
                                                  height: 140,
                                                  width: 140,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (BuildContext,
                                                      Object, StackTrace) {
                                                    return const Center(
                                                      child:
                                                          Text('Server Error'),
                                                    );
                                                  },
                                                  // loadingBuilder: (BuildContext context, Widget child,
                                                  //     ImageChunkEvent? loadingProgress) {
                                                  //   if (loadingProgress == null) {
                                                  //     return child;
                                                  //   }
                                                  //   return Center(
                                                  //     child: CircularProgressIndicator(
                                                  //       value: loadingProgress.expectedTotalBytes != null
                                                  //           ? loadingProgress.cumulativeBytesLoaded /
                                                  //           loadingProgress.expectedTotalBytes!
                                                  //           : null,
                                                  //     ),
                                                  //   );
                                                  // },
                                                ),
                                              )
                                            : Image.network(
                                                '${controller.profile?.defaultImg![0]}',
                                                height: 140,
                                                width: 140,
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext,
                                                    Object, StackTrace) {
                                                  return const Center(
                                                    child:
                                                        Text('Network Error'),
                                                  );
                                                },
                                              )),
                                  ),
                                ),

                                Positioned(
                                  top: 135,
                                  left: 100,
                                  child: InkWell(
                                      onTap: () async {
                                        bool check = await galleryPermissions();
                                        print(
                                            'handle permission return value: $check');
                                        if (check) {
                                          XFile? img = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          if (img != null) {
                                            if (user != null) {
                                              pd.show(
                                                  message: 'Saving',
                                                  type:
                                                      SimpleFontelicoProgressDialogType
                                                          .threelines,
                                                  indicatorColor:
                                                      const Color(0xff800000));
                                              await controller.postImage(
                                                  img, user!.uid.toString());
                                              controller.getMyDetails();
                                              pd.hide();
                                            }
                                          } else {
                                            Get.snackbar('oops', 'Try again',
                                                backgroundColor: Colors.orange,
                                                snackPosition:
                                                    SnackPosition.BOTTOM);
                                          }
                                        }
                                      },
                                      child: const Icon(
                                        Icons.add_a_photo_rounded,
                                        color: Colors.white,
                                      )),
                                ),

                                //column consisting of name
                                Positioned(
                                    top: 10,
                                    left: 150,
                                    child: SizedBox(
                                      width: Get.width - Get.width * 0.45,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          //FirebaseAuth.instance.currentUser!.displayName.toString()
                                          SizedBox(
                                            width: Get.width,
                                            child: Text(
                                              '${controller.profile?.username}',
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                              width: Get.width,
                                              child: Text(
                                                '${controller.profile?.marialStatus}, ${controller.profile?.age}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              )),
                                          SizedBox(
                                              width: Get.width,
                                              child: Text(
                                                '${controller.profile?.gender}, ${controller.profile?.height}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              )),

                                          SizedBox(
                                              width: Get.width,
                                              child: Text(
                                                '${controller.profile?.state}, ${controller.profile?.city}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              )),
                                          //controller.profile?.annualIncome
                                          SizedBox(
                                              width: Get.width,
                                              child: Text(
                                                '${controller.profile?.qualification![0].qualificationType}, ${controller.profile?.qualification![0].collegeOne}, ${controller.profile?.qualification![0].collegeTwo}',
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                softWrap: false,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              )),
                                          Text(
                                            '${controller.profile?.anualIncome}',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),

                                          if (controller
                                                  .doc?.community?.religion !=
                                              null)
                                            Text(
                                                '${controller.doc?.community?.religion}, ${controller.doc?.community?.communityType}',
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          Text(
                                              controller.doc?.community
                                                          ?.motherTounge ==
                                                      null
                                                  ? ''
                                                  : '${controller.doc?.community?.motherTounge} Speaking',
                                              style: const TextStyle(
                                                  color: Colors.white)),

                                          const SizedBox(
                                            height: 10,
                                          ),

                                          SizedBox(
                                            height: 30,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          20)))),
                                              child: RichText(
                                                  text: TextSpan(children: [
                                                WidgetSpan(
                                                    child: Image.network(
                                                  'https://img.icons8.com/color/48/null/medieval-crown.png',
                                                  height: 20,
                                                  width: 20,
                                                )),
                                                const TextSpan(
                                                    text: ' Plan Features',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff800000),
                                                        fontWeight:
                                                            FontWeight.w400)),
                                              ])),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  width: Get.width,
                  margin:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey.shade500)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Bio',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      // Text(
                      //   '${controller.profile?.bio}',
                      //   style: const TextStyle(color: Colors.black,fontSize: 15),
                      // ),

                      Obx(
                        () => controller.isLoading.isTrue
                            ? const Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  color: Color(0xff800000),
                                ),
                              )
                            : Text(
                                '${controller.profile?.bio}',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                //preferences tile
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(() => const PartnerPreferences());
                    },
                    title: const Text('Preferences'),
                    leading: const Icon(
                      Icons.tune,
                      size: 25,
                    ),
                    subtitle: const Text(
                        'Set your preferences according to your choice'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                //edit description
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(() => const EditBio());
                    },
                    leading: const Icon(Icons.text_snippet),
                    title: const Text('Edit Description'),
                    subtitle: const Text('Add bio to your profile'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                //gender
                Card(
                  child: ListTile(
                    onTap: () {
                      genderSheet(controller);
                    },
                    leading: const Icon(Icons.transgender),
                    title: const Text('Gender'),
                    subtitle: const Text('Set your gender'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                //basic details
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(() => const MyDetails());
                    },
                    leading: Image.network(
                      'https://img.icons8.com/windows/32/null/details-pane.png',
                      height: 35,
                      width: 35,
                      color: Colors.grey,
                      errorBuilder: (BuildContext, Object, StackTrace) {
                        return const Center(
                          child: Text('Network Error'),
                        );
                      },
                    ),
                    title: const Text('Basic Details'),
                    subtitle: const Text('Age, Height, Maritial Status'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(() => const MyCommunity());
                    },
                    leading: Image.network(
                      'https://img.icons8.com/ios-filled/50/null/multicultural-people.png',
                      height: 35,
                      width: 35,
                      color: Colors.grey,
                      errorBuilder: (BuildContext, Object, StackTrace) {
                        return const Center(
                          child: Text('Network Error'),
                        );
                      },
                    ),
                    title: const Text('Community'),
                    subtitle: const Text('Religion, Community, Mother Tongue'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                //packages
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.to(() => const PremiumView(),
                          binding: PremiumBinding());
                    },
                    title: const Text('Packages'),
                    leading: const Icon(
                      Icons.local_offer,
                      size: 25,
                    ),
                    subtitle: const Text('Subscribe to get best matches'),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //faq tile
                Card(
                  child: ListTile(
                    onTap: () {
                      Get.bottomSheet(
                          isScrollControlled: true,
                          Container(
                            height: Get.height * 0.90,
                            width: Get.width,
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'FAQ \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                Text(
                                  'Q: How long have you been open?',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    'A: Genesis Matrimony has been launched in April 2023.\n'),
                                Text(
                                  'Q: Is this online forum for men or women?',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'A: This forum is for both men and women equally.\n',
                                ),
                                Text(
                                  'Q: Do women pay for registration?',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'A: Women like men are people, so Yes, they pay too.\n',
                                ),
                                Text(
                                  'Q: How much does registration cost?',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'A: The tariff details are mentioned in payment section.\n',
                                ),
                                Text(
                                  'Q: Why don\'t you show all photos?',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'A: We show profile picture and person’s general details as we prefer people should focus '
                                  'on interests, on intrinsic and unique qualities of each other. Although after getting '
                                  'registered you can access all photographs and core details of each profile.\n',
                                ),
                                Text(
                                  'Q: What are the age groups you cover?',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'A: The age of those involved ranges from around 18 to 70. Dreams have No age. \n',
                                ),
                              ],
                            ),
                          ));
                    },
                    subtitle: const Text('Related Questions'),
                    title: const Text('FAQ'),
                    leading: const Icon(
                      Icons.filter_list_alt,
                      size: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                //logout functionality
                Card(
                  child: InkWell(
                    onTap: () async {
                      pd.show(
                          message: 'SigningOut...',
                          type: SimpleFontelicoProgressDialogType.threelines,
                          indicatorColor: Colors.orange);
                      await Future.delayed(const Duration(seconds: 1));
                      await FirebaseAuth.instance.signOut();

                      pd.hide();
                      Get.offAll(() => const SignInView(),
                          binding: SignInBinding());
                    },
                    child: const ListTile(
                      title: Text('Logout'),
                      leading: Icon(
                        Icons.logout,
                        size: 25,
                      ),
                    ),
                  ),
                ),

                Card(
                  child: InkWell(
                    onTap: () async {
                      pd.show(
                          message: 'Deleting Account...',
                          type: SimpleFontelicoProgressDialogType.threelines,
                          indicatorColor: Colors.red);
                      await Future.delayed(const Duration(seconds: 1));

                      var r = await post(
                        Uri.parse(
                            'https://789b-158-220-104-228.ngrok-free.app/admin/deleteUser'),
                        body: {
                          "userid": FirebaseAuth.instance.currentUser!.uid
                        },
                      ).then((value) async {
                        final collection =
                            FirebaseFirestore.instance.collection('users');
                        collection
                            .doc(FirebaseAuth.instance.currentUser!
                                .uid) // <-- Doc ID to be deleted.
                            .delete() // <-- Delete
                            .then((_) => print('Deleted'))
                            .catchError(
                                (error) => print('Delete failed: $error'));
                      });
                      FirebaseAuth.instance.currentUser!.delete();
                      await FirebaseAuth.instance.signOut();
                      pd.hide();
                      Get.offAll(() => const SignInView(),
                          binding: SignInBinding());
                    },
                    child: const ListTile(
                      title: Text(
                        'Delete my Account',
                        style: TextStyle(color: Colors.red),
                      ),
                      leading: Icon(
                        Icons.delete,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Container(
                  height: 100,
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors.grey.shade300,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //launch the web of privacy and policy conditions
                          Get.bottomSheet(isScrollControlled: true,
                              StatefulBuilder(builder: (context, setState) {
                            return Container(
                              height: Get.height * 0.90,
                              width: Get.width,
                              color: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: const SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Privacy \n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                    //const Text('Q: How long have you been open?',style: TextStyle(fontWeight: FontWeight.w500),),
                                    Text(
                                        'Please note that when signing up to the App, you are also subject to the terms and conditions of the privacy notices, as well as the terms of service and privacy policies of third-party hosts, when applicable.  Do not send or post personal information via our social media sites. Never disclose any financial or personal information on the App. The management will never ask you for your private information, account information, passwords, PINs or other personally identifiable information via social media or email. You acknowledge that you assume all responsibility related to the security, privacy and risks inherent in sending any content over the Internet.\n'),

                                    Text(
                                      'Monitoring\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The management has no obligation to monitor the use of App by users. You acknowledge and agree that the management reserves the right to, and may from time to time, monitor any and all information transmitted or received through App for operational and other purposes.  During monitoring, information may be examined, recorded, copied, and used for authorized purposes. Use of App constitutes consent to such monitoring. Furthermore, the management also reserves the right at all times to disclose any information posted on any portion of the App as necessary to satisfy any law, regulation or governmental request, or to refuse to post, or to remove, any information or materials, in whole or in part, that in the sole opinion of management and absolute discretion are objectionable or in violation of this Agreement.\n'),

                                    Text(
                                      'Copyright/Use License\n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The content provided on App is owned or licensed by the management, unless otherwise indicated. Unless expressly noted otherwise, everything on the App is protected by intellectual property rights held by the management or other parties that have allowed by the management to use their materials.  All rights not expressly granted are reserved. Permission is granted to temporarily download copy of content permitted of management for personal, non-commercial use only. This is the grant of a license, not a transfer of title, and under this license you may not:\n'),
                                    Text(
                                        '1. Modify or copy the content except as otherwise provided;\n'),
                                    Text(
                                        '2. Use the content for any commercial purpose, or for any public display (commercial or non-commercial);\n'),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                        '3. Remove any copyright or other proprietary notices from the content; or\n'),
                                    Text(
                                        '4. Transfer the content to another person or “mirror” the content on any other server.\n'),
                                    Text(
                                        'This license shall automatically terminate if you violate any of these restrictions and may be terminated by the management at any time. Upon completing your review of the content or upon the termination of this license, you must destroy any downloaded materials in your possession, whether in electronic or printed format.\n'),

                                    Text(
                                      'Copyright Policy and Copyright Agent \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The management may remove content that appears in its sole discretion to infringe the intellectual property rights of others.  The management also has a policy of terminating the accounts of repeat infringers in appropriate circumstances. If you believe that content available on or through the sites infringes one or more of your intellectual property rights, please immediately notify the management (“Notification”) providing the information described below.  A copy of your Notification will be sent to the person who posted or stored the material addressed in the Notification.\nPlease be advised that pursuant to prevalent Laws of the relevant Country you may be held liable for damages if you make material misrepresentations in a Notification.  Thus, if you are not sure that content located on or linked to by the App infringes your rights, you should consider first the legal implications.\n'),

                                    Text(
                                      'Disclaimers \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The management makes no warranties, expressed or implied, and hereby disclaims and negates all warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, and non-infringement of intellectual property or other violation of rights. Further, the management does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on the App or otherwise relating to such materials or on any App/sites linked to that.  The management does not guarantee that the App will be without errors or viruses, or that any technical defects will be corrected, even if the management is aware of them.  The information and content provided on the App, including without limitation text, graphics and images, are for informational purposes only, not as an offer to sell or the solicitation or any other issuer or company. The management is not responsible for any content posted by users, including posts made by employees or agents who are not authorized administrators of the App. Content posted by others is not edited by the management and does not necessarily represent the views or positions of the management. \n'),

                                    Text(
                                      'Limitations \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The use of App is entirely at your own risk, and in no event shall the management its affiliates or its suppliers be liable for any direct, indirect, incidental, consequential, special, exemplary, punitive or any other monetary or other damages, fees, fines, penalties, or liabilities (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of or relating to the App, your use or inability to use the content on the App even if the management has been notified orally or in writing of the possibility of such damage.  Your sole and exclusive remedy for dissatisfaction with the App is to stop using the App. The management will not be responsible in any way for loss or damage that results from your failure to comply with these terms or other applicable guidelines, or from any technical, human or software errors or failures found in working of App.\n'),

                                    Text(
                                      'Indemnification \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'You agree to indemnify, defend, and hold harmless the owner, management and its employees, and agents from any and all losses, damages, liabilities, and costs of every nature incurred by any of them in connection with any claim, damage, or loss related to your use of the App or any materials contained on the App, or the breach or alleged breach by you of these terms.'),

                                    Text(
                                      'Third-Party Links \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The management has not reviewed all of the third-party sites/apps linked to the App and is not responsible for the contents of any such linked sites/apps. The inclusion of any third-party link does not imply endorsement by the management. Use of any such linked web site/app is at the user’s own risk. You understand that when going to a third-party web site/app, that site is governed by the third party’s privacy policy and terms of use, and the third party is solely responsible for the content and offerings presented on its website.\n'),

                                    Text(
                                      'Site Modification or Termination \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The management may modify the features, content and functionality of the App or terminate entirely the App or any of its particular feature at any time without prior notice or liability to you. Modification or termination of these terms will not affect, or result in the termination or modification, of any other existing agreements you may have with the management.\n'),

                                    Text(
                                      'Social Media Terms of Use Modifications \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The management may revise these terms of use at any time without notice. These terms of use may be updated at any time and/or each time a social networking site/app updates their terms of use.  By using the App you are agreeing to be bound by the then current version of these terms of use. Any modifications to these terms shall be effective as of the date posted. We encourage you to periodically review these terms. \n'),

                                    Text(
                                      'Relationship \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'Your accessing or signing in to the App in no way shall be deemed to create an agency or employee-employer relationship of any kind between you and the management, nor do these terms extend rights to any third party. You also agree that in the course of your accessing and using the App, that no relationship is formed between you and the management that is either confidential or fiduciary in nature beyond any existing relationship you may have with us.'),

                                    Text(
                                      'Termination of Use \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'The management may, in its sole discretion, terminate your use of App at any time.  Further, the management also reserves the right to change, suspend or discontinue all or any aspects of the App at any time without prior notice. \n'),

                                    Text(
                                      'Jurisdiction and Miscellaneous \n',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                        'This Agreement shall be construed and enforced in accordance with the laws of Islamic Republic of Pakistan and such other international conventions, treaties, pacts and Laws of relevant state, wherever found to have been breached without regard to the principles of conflicts of law.  This Agreement is a personal agreement between you and the management and no one shall be a third party beneficiary to this Agreement. Although you acknowledge that the management will have the ability to enforce its rights in any court of competent jurisdiction, you hereby acknowledge and agree that the courts of  Pakistan shall have exclusive jurisdiction over any dispute relating to these terms and your use of App, that you shall submit to that jurisdiction and those courts, and that you expressly waive any and all rights you may have, or that may hereafter arise, to contest the propriety of such choice of jurisdiction and venue, including issues of forum non conveniens.\nYou acknowledge and agree that you may not bring a claim against the management relating to your use of App after more than one year has passed since the event occurred that gave rise to the claim, while there is no such limitation on the management’s right to bring claims against you. You acknowledge and agree that the disclaimers, including the warranty disclaimers, and the liability and remedy limitations in this Agreement are material terms of this Agreement and that they have been taken into account in the decision by the management to provide the App hereunder.\nNo waiver of any provision or any right granted hereunder will be effective unless set forth in a written instrument signed by the waiving party. No waiver by either party of any breach or default hereunder shall be deemed a waiver of any subsequent breach or default. The titles and subtitles used in this Agreement are used for convenience only and are not to be considered in construing or interpreting this Agreement. \n'),
                                  ],
                                ),
                              ),
                            );
                          }));
                        },
                        child: const Text(
                          'Terms&Conditions',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text('Version 1.3.0'),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text('Copyrights 2022-2023 genesismatrimony.com'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     print(GetStorage().read('UserId'));
      //   },
      // ),
    );
  }
}
