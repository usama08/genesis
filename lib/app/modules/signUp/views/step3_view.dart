import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../views/my_community.dart';
import '../controllers/sign_up_controller.dart';

class Step3View extends GetView<SignUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xff800000),
      // ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Now let\'s add your hobbies & interests',
                textAlign: TextAlign.center,
                style: TextStyle(
                  //color: Colors.grey.shade800,
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'This will help find better match',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              //creative
              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Creative',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      spacing: 5,
                      children: [
                        //writing
                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.selectedCreative
                                      .contains('Writing')
                                  ? const Color(0xff800000)
                                  : Colors.transparent,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            radius: 25,
                            onTap: () {
                              if (controller.selectedCreative
                                  .contains('Writing')) {
                                controller.selectedCreative.remove('Writing');
                              } else
                                controller.selectedCreative.add('Writing');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                    'https://img.icons8.com/external-smashingstocks-glyph-smashing-stocks/66/null/external-writting-network-and-communication-smashingstocks-glyph-smashing-stocks.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedCreative
                                            .contains('Writing')
                                        ? Colors.white
                                        : Colors.black),
                                Text(
                                  'Writing',
                                  style: TextStyle(
                                      color: controller.selectedCreative
                                              .contains('Writing')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        //cooking
                        Container(
                          height: 40,
                          width: 100,
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                              color: controller.selectedCreative
                                      .contains('Cooking')
                                  ? Color(0xff800000)
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedCreative
                                  .contains('Cooking')) {
                                controller.selectedCreative.remove('Cooking');
                              } else
                                controller.selectedCreative.add('Cooking');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                    'https://img.icons8.com/windows/32/null/cooking.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedCreative
                                            .contains('Cooking')
                                        ? Colors.white
                                        : Colors.black),
                                Text(
                                  'Cooking',
                                  style: TextStyle(
                                      color: controller.selectedCreative
                                              .contains('Cooking')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),

                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.selectedCreative
                                      .contains('Singing')
                                  ? Color(0xff800000)
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedCreative
                                  .contains('Singing')) {
                                controller.selectedCreative.remove('Singing');
                              } else
                                controller.selectedCreative.add('Singing');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                    'https://img.icons8.com/external-others-pike-picture/50/null/external-Singing-hobby-others-pike-picture.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedCreative
                                            .contains('Singing')
                                        ? Colors.white
                                        : Colors.black),
                                Text(
                                  'Singing',
                                  style: TextStyle(
                                      color: controller.selectedCreative
                                              .contains('Singing')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),

                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedCreative
                                        .contains('Photography')
                                    ? const Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedCreative
                                    .contains('Photography')) {
                                  controller.selectedCreative
                                      .remove('Photography');
                                } else
                                  controller.selectedCreative
                                      .add('Photography');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/ios-glyphs/30/null/compact-camera.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedCreative
                                            .contains('Photography')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    ' Photography',
                                    style: TextStyle(
                                        color: controller.selectedCreative
                                                .contains('Photography')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedCreative
                                        .contains('Playing Instruments')
                                    ? const Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedCreative
                                    .contains('Playing Instruments')) {
                                  controller.selectedCreative
                                      .remove('Playing Instruments');
                                } else
                                  controller.selectedCreative
                                      .add('Playing Instruments');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/ios-glyphs/30/null/guitar.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedCreative
                                            .contains('Playing Instruments')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    ' Playing Instruments',
                                    style: TextStyle(
                                        color: controller.selectedCreative
                                                .contains('Playing Instruments')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedCreative
                                        .contains('Painting')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedCreative
                                    .contains('Painting')) {
                                  controller.selectedCreative
                                      .remove('Painting');
                                } else
                                  controller.selectedCreative.add('Painting');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                      'https://img.icons8.com/windows/32/null/paint-palette-with-brush.png',
                                      height: 20,
                                      width: 20,
                                      color: controller.selectedCreative
                                              .contains('Painting')
                                          ? Colors.white
                                          : Colors.black),
                                  Text(' Painting',
                                      style: TextStyle(
                                          color: controller.selectedCreative
                                                  .contains('Painting')
                                              ? Colors.white
                                              : Colors.black))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //Fun
              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fun',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      spacing: 5,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.selectedFun.contains('Movies')
                                  ? Color(0xff800000)
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedFun.contains('Movies')) {
                                controller.selectedFun.remove('Movies');
                              } else
                                controller.selectedFun.add('Movies');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  'https://img.icons8.com/windows/32/null/film-reel--v1.png',
                                  height: 20,
                                  width: 20,
                                  color:
                                      controller.selectedFun.contains('Movies')
                                          ? Colors.white
                                          : Colors.black,
                                ),
                                Text(
                                  'Movies',
                                  style: TextStyle(
                                      color: controller.selectedFun
                                              .contains('Movies')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.selectedFun.contains('Music')
                                  ? const Color(0xff800000)
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedFun.contains('Music')) {
                                controller.selectedFun.remove('Music');
                              } else
                                controller.selectedFun.add('Music');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  'https://img.icons8.com/material/24/null/music--v1.png',
                                  height: 20,
                                  width: 20,
                                  color:
                                      controller.selectedFun.contains('Music')
                                          ? Colors.white
                                          : Colors.black,
                                ),
                                Text(
                                  'Music',
                                  style: TextStyle(
                                      color: controller.selectedFun
                                              .contains('Music')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color:
                                  controller.selectedFun.contains('Traveling')
                                      ? const Color(0xff800000)
                                      : Colors.transparent,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedFun
                                  .contains('Traveling')) {
                                controller.selectedFun.remove('Traveling');
                              } else
                                controller.selectedFun.add('Traveling');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  'https://img.icons8.com/material/24/null/around-the-globe.png',
                                  height: 20,
                                  width: 20,
                                  color: controller.selectedFun
                                          .contains('Traveling')
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Text(
                                  'Traveling',
                                  style: TextStyle(
                                      color: controller.selectedFun
                                              .contains('Traveling')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color:
                                    controller.selectedFun.contains('Reading')
                                        ? Color(0xff800000)
                                        : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedFun
                                    .contains('Reading')) {
                                  controller.selectedFun.remove('Reading');
                                } else
                                  controller.selectedFun.add('Reading');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/material/24/null/read--v1.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedFun
                                            .contains('Reading')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    ' Reading',
                                    style: TextStyle(
                                        color: controller.selectedFun
                                                .contains('Reading')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedFun.contains('Sports')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedFun.contains('Sports')) {
                                  controller.selectedFun.remove('Sports');
                                } else
                                  controller.selectedFun.add('Sports');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                      'https://img.icons8.com/material/24/null/basketball.png',
                                      height: 20,
                                      width: 20,
                                      color: controller.selectedFun
                                              .contains('Sports')
                                          ? Colors.white
                                          : Colors.black),
                                  Text(
                                    ' Sports',
                                    style: TextStyle(
                                        color: controller.selectedFun
                                                .contains('Sports')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedFun
                                        .contains('Social Media')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedFun
                                    .contains('Social Media')) {
                                  controller.selectedFun.remove('Social Media');
                                } else
                                  controller.selectedFun.add('Social Media');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                      'https://img.icons8.com/material/24/null/share-2.png',
                                      height: 20,
                                      width: 20,
                                      color: controller.selectedFun
                                              .contains('Social Media')
                                          ? Colors.white
                                          : Colors.black),
                                  Text(
                                    ' Social Media',
                                    style: TextStyle(
                                        color: controller.selectedFun
                                                .contains('Social Media')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //fitness
              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Fitness',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      spacing: 5,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color:
                                  controller.selectedFitness.contains('Running')
                                      ? Color(0xff800000)
                                      : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedFitness
                                  .contains('Running')) {
                                controller.selectedFitness.remove('Running');
                              } else
                                controller.selectedFitness.add('Running');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  'https://img.icons8.com/material/24/null/exercise--v1.png',
                                  height: 20,
                                  width: 20,
                                  color: controller.selectedFitness
                                          .contains('Running')
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Text(
                                  'Running',
                                  style: TextStyle(
                                      color: controller.selectedFitness
                                              .contains('Running')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color:
                                  controller.selectedFitness.contains('Cycling')
                                      ? Color(0xff800000)
                                      : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedFitness
                                  .contains('Cycling')) {
                                controller.selectedFitness.remove('Cycling');
                              } else
                                controller.selectedFitness.add('Cycling');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  'https://img.icons8.com/material/24/null/cycling-road.png',
                                  height: 20,
                                  width: 20,
                                  color: controller.selectedFitness
                                          .contains('Cycling')
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                Text(
                                  'Cycling',
                                  style: TextStyle(
                                      color: controller.selectedFitness
                                              .contains('Cycling')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedFitness
                                        .contains('Yoga & Meditation')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedFitness
                                    .contains('Yoga & Meditation')) {
                                  controller.selectedFitness
                                      .remove('Yoga & Meditation');
                                } else
                                  controller.selectedFitness
                                      .add('Yoga & Meditation');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                      'https://img.icons8.com/material/24/null/guru.png',
                                      height: 20,
                                      width: 20,
                                      color: controller.selectedFitness
                                              .contains('Yoga & Meditation')
                                          ? Colors.white
                                          : Colors.black),
                                  Text(
                                    'Yoga & Meditation',
                                    style: TextStyle(
                                        color: controller.selectedFitness
                                                .contains('Yoga & Meditation')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedFitness
                                        .contains('Walking')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedFitness
                                    .contains('Walking')) {
                                  controller.selectedFitness.remove('Walking');
                                } else
                                  controller.selectedFitness.add('Walking');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                      'https://img.icons8.com/material/24/null/walking--v1.png',
                                      height: 20,
                                      width: 20,
                                      color: controller.selectedFitness
                                              .contains('Walking')
                                          ? Colors.white
                                          : Colors.black),
                                  Text(
                                    ' Walking',
                                    style: TextStyle(
                                        color: controller.selectedFitness
                                                .contains('Walking')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedFitness
                                        .contains('Working out')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedFitness
                                    .contains('Working out')) {
                                  controller.selectedFitness
                                      .remove('Working out');
                                } else
                                  controller.selectedFitness.add('Working out');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/material/24/null/pushups.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedFitness
                                            .contains('Working out')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    ' Working out',
                                    style: TextStyle(
                                        color: controller.selectedFitness
                                                .contains('Working out')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedFitness
                                        .contains('Trekking')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedFitness
                                    .contains('Trekking')) {
                                  controller.selectedFitness.remove('Trekking');
                                } else
                                  controller.selectedFitness.add('Trekking');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/material/24/null/trekking.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedFitness
                                            .contains('Trekking')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    ' Trekking',
                                    style: TextStyle(
                                        color: controller.selectedFitness
                                                .contains('Trekking')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              //other interests
              Container(
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Other Interests',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Wrap(
                      spacing: 5,
                      children: [
                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.selectedOther.contains('Pets')
                                  ? Color(0xff800000)
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedOther.contains('Pets')) {
                                controller.selectedOther.remove('Pets');
                              } else
                                controller.selectedOther.add('Pets');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  'https://img.icons8.com/windows/32/null/film-reel--v1.png',
                                  height: 20,
                                  width: 20,
                                  color:
                                      controller.selectedOther.contains('Pets')
                                          ? Colors.white
                                          : Colors.black,
                                ),
                                Text(
                                  'Pets',
                                  style: TextStyle(
                                      color: controller.selectedOther
                                              .contains('Pets')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: controller.selectedOther.contains('Foodie')
                                  ? Color(0xff800000)
                                  : Colors.transparent,
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(20)),
                          child: InkWell(
                            onTap: () {
                              if (controller.selectedOther.contains('Foodie')) {
                                controller.selectedOther.remove('Foodie');
                              } else
                                controller.selectedOther.add('Foodie');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                    'https://img.icons8.com/material/24/null/dining-room.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedOther
                                            .contains('Foodie')
                                        ? Colors.white
                                        : Colors.black),
                                Text(
                                  'Foodie',
                                  style: TextStyle(
                                      color: controller.selectedOther
                                              .contains('Foodie')
                                          ? Colors.white
                                          : Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color:
                                    controller.selectedOther.contains('Vegan')
                                        ? Color(0xff800000)
                                        : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedOther
                                    .contains('Vegan')) {
                                  controller.selectedOther.remove('Vegan');
                                } else
                                  controller.selectedOther.add('Vegan');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/material/24/null/vegan-food--v1.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedOther
                                            .contains('Vegan')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    'Vegan',
                                    style: TextStyle(
                                        color: controller.selectedOther
                                                .contains('Vegan')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedOther
                                        .contains('News & Politics')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedOther
                                    .contains('News & Politics')) {
                                  controller.selectedOther
                                      .remove('News & Politics');
                                } else
                                  controller.selectedOther
                                      .add('News & Politics');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/material/24/null/news--v1.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedOther
                                            .contains('News & Politics')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    ' News & Politics',
                                    style: TextStyle(
                                        color: controller.selectedOther
                                                .contains('News & Politics')
                                            ? Colors.white
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                                color: controller.selectedOther
                                        .contains('Social Services')
                                    ? Color(0xff800000)
                                    : Colors.transparent,
                                border: Border.all(
                                  color: Colors.grey.shade300,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            child: InkWell(
                              onTap: () {
                                if (controller.selectedOther
                                    .contains('Social Services')) {
                                  controller.selectedOther
                                      .remove('Social Services');
                                } else
                                  controller.selectedOther
                                      .add('Social Services');
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    'https://img.icons8.com/material/24/null/talk-female.png',
                                    height: 20,
                                    width: 20,
                                    color: controller.selectedOther
                                            .contains('Social Services')
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  Text(
                                    ' Social Services',
                                    style: TextStyle(
                                        color: controller.selectedOther
                                                .contains('Social Services')
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 45,
                width: Get.width * 0.60,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Color(0xff800000),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23)),
                    ),
                    onPressed: () async {
                      if (controller.selectedCreative.isEmpty &&
                          controller.selectedFun.isEmpty &&
                          controller.selectedFitness.isEmpty &&
                          controller.selectedOther.isEmpty) {
                        Get.snackbar(
                            'oops', 'We can\'t proceed without interests');
                      } else {
                        final res = await controller.postSignup(context);
                        if (res == true) {
                          Get.offAll(() => MyCommunity());
                        }
                        //Get.offAll(()=>MyCommunity());
                      }
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
