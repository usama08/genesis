import 'package:flutter/material.dart';
import 'package:genesis/app/data/providers/chats/init_chat.dart';
import 'package:genesis/app/modules/inbox/utils/init_chat_model.dart';
import 'package:get_storage/get_storage.dart';

void createChat(String receiverId, BuildContext context) async {
  Doc? doc = await InitChat().initializeChat(receiverId);
  print('chat is initialized with chatId: ${doc?.sId}');
  String? docSender = doc?.sender?.sId;
  String sessionUser = GetStorage().read('UserId');
  String? docReciever = doc?.receiver?.uid;

  if (doc != null && docSender != null && docReciever != null) {
    String whoAreYou = '';
    if (docSender == sessionUser) {
      whoAreYou = 'sender';
    } else {
      whoAreYou = 'receiver';
    }

    print('from chat init method');
    print('-----------------WhoAreYou: $whoAreYou-----------------------');
    print(
        '-----------------SenderName: ${doc.sender?.username}-----------------------');
    print(
        '-----------------ReciverName: ${doc.receiver?.username}-----------------------');
    print('-----------------ChatId: ${doc.sId}-----------------------');

    // Get.to(()=>SingleChat(
    //   chatId: doc.sId.toString(),
    //   prevMsg: doc.messages?? [],
    //   whoAmI: whoAreYou,
    //   image: docReciever==sessionUser?
    //   '${doc.receiver?.defaultImg?.first}':
    //       '${doc.receiver?.defaultImg?.first}',
    //
    //   name: docReciever==sessionUser?
    //   '${doc.receiver?.username}':
    //   '${doc.receiver?.username}',
    // ));
  }
}
