import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../app/modules/inbox/widgets/ChatRoomModel.dart';
import '../../app/modules/inbox/widgets/UserModel.dart';
import '../../main.dart';

Future<ChatRoomModel?> getChatroomModel(UserModel targetUser) async {
  ChatRoomModel? chatRoom;

  QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection("chatrooms")
      .where("participants.${FirebaseAuth.instance.currentUser?.uid}",
          isEqualTo: true)
      .where("participants.${targetUser.uid}", isEqualTo: true)
      .get();

  if (snapshot.docs.isNotEmpty) {
    // Fetch the existing one
    var docData = snapshot.docs[0].data();
    ChatRoomModel existingChatroom =
        ChatRoomModel.fromMap(docData as Map<String, dynamic>);

    chatRoom = existingChatroom;
  } else {
    // Create a new one
    ChatRoomModel newChatroom = ChatRoomModel(
      chatroomid: uuid.v1(),
      lastMessage: "",
      participants: {
        '${FirebaseAuth.instance.currentUser?.uid}': true,
        targetUser.uid.toString(): true,
      },
    );

    await FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(newChatroom.chatroomid)
        .set(newChatroom.toMap());

    chatRoom = newChatroom;

    log("New Chatroom Created!");
  }

  return chatRoom;
}
