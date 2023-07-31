import 'package:flutter/material.dart';
import 'package:genesis/app/modules/inbox/controllers/inbox_controller.dart';
import 'package:genesis/core/functions/create_chat.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/recent_chats_model.dart' as recent;
import 'package:get/get.dart';

class RecentChats extends StatefulWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  State<RecentChats> createState() => _RecentChatsState();
}

class _RecentChatsState extends State<RecentChats> {
  InboxController controller = Get.put(InboxController());
  @override
  void initState() {
    super.initState();
    controller.getRecentChats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Chats'),
        centerTitle: true,
        backgroundColor: const Color(0xff800000),
      ),
      body: Obx(() => SizedBox(
            height: Get.height,
            width: Get.width,
            child: RefreshIndicator(
              backgroundColor: Colors.white,
              color: const Color(0xff800000),
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                await controller.getRecentChats();
              },
              child: ListView.builder(
                itemCount: controller.recentChats.length,
                itemBuilder: (BuildContext context, index) {
                  String? receiverId =
                      controller.recentChats[index].receiver?.sId;
                  String? senderId = controller.recentChats[index].sender?.sId;
                  String sessionId = GetStorage().read('UserId');
                  return InkWell(
                    onTap: () {
                      print('------ from chat init method ------- ');
                      print('-----session user ------- $sessionId');
                      print('-----from sender doc id ------- $senderId');
                      print('-----from reciver doc id  ------- $receiverId');

                      if (receiverId != null && senderId != null) {
                        createChat(
                            receiverId == sessionId ? receiverId : senderId,
                            context);
                      }
                    },
                    child: Container(
                      height: 87,
                      width: Get.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20))),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: Image.network(
                                receiverId == sessionId
                                    ? '${controller.recentChats[index].receiver?.defaultImg?.first}'
                                    : '${controller.recentChats[index].receiver?.defaultImg?.first}',
                                fit: BoxFit.cover,
                                errorBuilder: (context, Object, StackTrace) {
                                  return const Icon(Icons.person);
                                },
                                width: 50,
                                height: 50,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                receiverId == sessionId
                                    ? '${controller.recentChats[index].receiver?.username}'
                                    : '${controller.recentChats[index].receiver?.username}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${controller.recentChats[index].messages?.last.text}',
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              //Text('\t${controller.recentChats[index].lastMessage}',style: TextStyle(fontSize: 11),)
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )),
    );
  }
}
