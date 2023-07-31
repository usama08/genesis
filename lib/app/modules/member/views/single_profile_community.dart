import 'package:flutter/material.dart';
import 'package:genesis/core/functions/create_chat.dart';
import 'package:genesis/core/values/constants.dart';
import 'package:get/get.dart';
import 'package:expandable/expandable.dart';
import 'package:genesis/app/data/models/all_connects_model.dart';
import 'package:card_swiper/card_swiper.dart';

class SingleProfile extends StatelessWidget {
  final Filtercommunity doc;
  const SingleProfile({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExpandableController _controller = ExpandableController();

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

            doc.uid!.defaultImg!.isNotEmpty
                ? SizedBox(
                    height: Get.height * 0.30,
                    width: Get.width,
                    child: Swiper(
                      itemCount: doc.uid!.userImages!.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          child: Image.network(
                            '$IMGURL${doc.uid!.userImages![index]}',
                            fit: BoxFit.contain,
                            errorBuilder: (context, Object, StackTrace) {
                              return Center(
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
                      //'https://images.pexels.com/photos/8399659/pexels-photo-8399659.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                      doc.uid!.defaultImg!.first.toString(),
                      fit: BoxFit.contain,
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
                            '${doc.uid!.username}, ${doc.uid!.age}, ${doc.uid!.gender}\n${doc.uid!.state} ${doc.uid!.city}',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        InkWell(
                            onTap: () async {
                              //Get.to(()=>SingleChat(),binding: InboxBinding());
                              createChat('${doc.uid?.sId}', context);
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
                          children: doc.uid!.hobbies!
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
                            text: '${doc.uid!.profileFor}',
                            style: TextStyle(color: Colors.black))
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
                            text: '${doc.uid!.marialStatus}',
                            style: TextStyle(color: Colors.black))
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
                            text: '${doc.uid!.height}',
                            style: TextStyle(color: Colors.black))
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
                            text: '${doc.uid!.diet}',
                            style: TextStyle(color: Colors.black))
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
                                '${doc.uid!.qualification?.first.qualificationType}, ${doc.uid!.qualification!.first.collegeOne}, ${doc.uid!.qualification!.first.collegeTwo}',
                            style: TextStyle(color: Colors.black))
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
                            text: '${doc.uid!.anualIncome}',
                            style: TextStyle(color: Colors.black))
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
                            text: '${doc.uid!.bio}',
                            style: TextStyle(color: Colors.black))
                      ])),
                      // Wrap(children: [
                      //   const Text('Bio',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                      //   Text('${doc.bio}',)
                      // ],)
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
