import 'package:card_swiper/card_swiper.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:genesis/app/modules/inbox/widgets/ChatRoomModel.dart';
import 'package:get/get.dart';
import 'package:genesis/app/data/models/search_model.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';
import '../../../../core/functions/chatroom_creation.dart';
import '../../../../core/functions/check_user_firebase.dart';
import '../../../../core/values/constants.dart';
import '../../inbox/widgets/ChatRoomPage.dart';
import '../../inbox/widgets/UserModel.dart';

class SearchSingleProfile extends StatelessWidget {
  final Doc doc;
  const SearchSingleProfile({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExpandableController _controller = ExpandableController();
    SimpleFontelicoProgressDialog pd =
        SimpleFontelicoProgressDialog(context: context);
    return ExpandableTheme(
      data: const ExpandableThemeData(
        iconColor: Colors.blue,
        useInkWell: true,
      ),
      child: ExpandableNotifier(
        initialExpanded: false,
        child: Column(
          children: [
            //this will be replaced with swipper

            doc.userImages!.isNotEmpty
                ? SizedBox(
                    height: Get.height * 0.30,
                    width: Get.width,
                    child: Swiper(
                      itemCount: doc.userImages!.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          child: Image.network(
                            '$IMGURL${doc.userImages![index]}',
                            fit: BoxFit.contain,
                            errorBuilder: (context, Object, StackTrace) {
                              return const Center(
                                  child: Text('Server error\nTry again'));
                            },
                          ),
                        );
                      },
                    ),
                  )
                : SizedBox(
                    height: Get.height * 0.30,
                    width: Get.width,
                    child: Image.network(
                      'https://images.pexels.com/photos/8399659/pexels-photo-8399659.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      semanticLabel: doc.defaultImg!.isEmpty
                          ? ''
                          : doc.defaultImg!.first.toString(),
                      fit: BoxFit.contain,
                      errorBuilder: (context, Object, StackTrace) {
                        return const Center(child: Text('Image is not added'));
                      },
                    ),
                  ),

            ExpandablePanel(
                controller: _controller,
                //name of the user  in header
                header: Padding(
                  padding: const EdgeInsets.only(left: 5, top: 5),
                  child: SizedBox(
                    width: Get.width,
                    child: Wrap(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width - 90,
                          child: Text(
                            '${doc.username}, ${doc.age}, ${doc.gender}\n${doc.state} ${doc.city}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                            onTap: () async {
                              //SearchPage(userModel: widget.userModel, firebaseUser: widget.firebaseUser);
                              pd.show(
                                  message: 'Processing',
                                  type: SimpleFontelicoProgressDialogType
                                      .threelines,
                                  indicatorColor: const Color(0xff800000));
                              UserModel user = UserModel(
                                  uid: FirebaseAuth.instance.currentUser?.uid,
                                  email:
                                      FirebaseAuth.instance.currentUser?.email,
                                  fullname: FirebaseAuth
                                      .instance.currentUser?.displayName,
                                  profilepic: FirebaseAuth
                                      .instance.currentUser?.photoURL);

                              await addDocumentIfNotExists(
                                  '${doc.sId}',
                                  UserModel(
                                      uid: doc.uid,
                                      profilepic: doc.defaultImg?.first,
                                      fullname: doc.username,
                                      email: doc.email));

                              ChatRoomModel? chat = await getChatroomModel(
                                  UserModel(
                                      uid: doc.uid,
                                      profilepic: doc.defaultImg?.first,
                                      fullname: doc.username,
                                      email: doc.email));
                              pd.hide();
                              if (chat != null) {
                                Get.to(() => ChatRoomPage(
                                      targetUser: UserModel(
                                          uid: doc.uid,
                                          profilepic: doc.defaultImg?.first,
                                          fullname: doc.username,
                                          email: doc.email),
                                      chatroom: chat,
                                      firebaseUser:
                                          FirebaseAuth.instance.currentUser,
                                      userModel: user,
                                    ));
                              }
                              //createChat('${doc.sId}', context);
                            },
                            child: const SizedBox(
                              width: 50,
                              child: Icon(
                                Icons.chat,
                                size: 35,
                                color: Color(0xff800000),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
                //this will be collapsed
                collapsed: Padding(
                  padding: const EdgeInsets.only(top: 5, left: 5.0, bottom: 10),
                  child: Text(
                    'See more',
                    style: TextStyle(color: Colors.grey.shade600),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                theme: const ExpandableThemeData(
                    iconColor: Color(0xff800000),
                    useInkWell: true,
                    hasIcon: false),
                expanded: Container(
                  width: Get.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                          children: doc.hobbies!
                              .map(
                                (e) => FittedBox(
                                  child: Container(
                                    height: 40,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xff800000),
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Center(
                                      child: Text(
                                        '${e.hobby}',
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList()),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Profile for ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text: '${doc.profileFor}',
                            style: const TextStyle(color: Colors.black))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Marital status ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text: '${doc.marialStatus}',
                            style: const TextStyle(color: Colors.black))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Height ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text: '${doc.height}',
                            style: const TextStyle(color: Colors.black))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Diet ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text: '${doc.diet}',
                            style: const TextStyle(color: Colors.black))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Education ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text:
                                '${doc.qualification?.first.qualificationType}, ${doc.qualification?.first.collegeOne}, ${doc.qualification?.first.collegeTwo}',
                            style: const TextStyle(color: Colors.black))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Income ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text: '${doc.anualIncome}',
                            style: const TextStyle(color: Colors.black))
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        const TextSpan(
                            text: 'Bio ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text: '${doc.bio}',
                            style: const TextStyle(color: Colors.black))
                      ])),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
