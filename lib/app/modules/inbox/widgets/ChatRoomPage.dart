import 'dart:developer';
import 'package:genesis/core/values/constants.dart';
import 'package:genesis/main.dart';
import 'package:get/get.dart';
import './ChatRoomModel.dart';
import './MessageModel.dart';
import './UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';

class ChatRoomPage extends StatefulWidget {
  final UserModel targetUser;
  final ChatRoomModel chatroom;
  final UserModel userModel;
  final User? firebaseUser;

  const ChatRoomPage({Key? key,
    required this.targetUser,
    required this.chatroom,
    required this.userModel,
    required this.firebaseUser
  }) : super(key: key);

  @override
  _ChatRoomPageState createState() => _ChatRoomPageState();
}

class _ChatRoomPageState extends State<ChatRoomPage> {

  TextEditingController messageController = TextEditingController();

  void sendMessage() async {
    String msg = messageController.text.trim();
    messageController.clear();

    if(msg != "") {
      // Send Message
      MessageModel newMessage = MessageModel(
          messageid: uuid.v1(),
          sender: widget.userModel.uid,
          createdon: DateTime.now(),
          text: msg,
          seen: false
      );

      FirebaseFirestore.instance.collection("chatrooms").doc(widget.chatroom.chatroomid).collection("messages").doc(newMessage.messageid).set(newMessage.toMap());

      widget.chatroom.lastMessage = msg;
      FirebaseFirestore.instance.collection("chatrooms").doc(widget.chatroom.chatroomid).set(widget.chatroom.toMap());

      log("Message Sent!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff800000),
        title: Row(
          children: [

            CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(
                  widget.targetUser.profilepic.toString().isURL?
                      widget.targetUser.profilepic.toString():
                      PERSONIMG
              ),
            ),

            const SizedBox(width: 10,),

            Text(widget.targetUser.fullname.toString()),

          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [

              // This is where the chats will go
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: StreamBuilder(
                    stream: FirebaseFirestore.instance.collection("chatrooms").doc(widget.chatroom.chatroomid).collection("messages").orderBy("createdon", descending: true).snapshots(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.active) {
                        if(snapshot.hasData) {
                          QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

                          return ListView.builder(
                            reverse: true,
                            itemCount: dataSnapshot.docs.length,
                            itemBuilder: (context, index) {
                              MessageModel currentMessage = MessageModel.fromMap(dataSnapshot.docs[index].data() as Map<String, dynamic>);

                              // return Row(
                              //   mainAxisAlignment: (currentMessage.sender == widget.userModel.uid) ? MainAxisAlignment.end : MainAxisAlignment.start,
                              //   children: [
                              //     Container(
                              //         margin: const EdgeInsets.symmetric(vertical: 2,),
                              //         padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10,),
                              //         decoration: BoxDecoration(
                              //           color: (currentMessage.sender == widget.userModel.uid) ? Colors.grey : Theme.of(context).colorScheme.secondary,
                              //           borderRadius: BorderRadius.circular(5),
                              //         ),
                              //         child: Text(
                              //           currentMessage.text.toString(),
                              //           style: TextStyle(color: Colors.white,),
                              //         )
                              //     ),
                              //   ],
                              // );

                              // if(true){
                              //   DateTime temp = DateTime.parse(currentMessage.createdon);
                              //   return DateChip(
                              //     date: DateTime(
                              //       DateTime.now().year - currentMessage.createdon.year,
                              //     ),
                              //   );
                              // }

                              return BubbleSpecialThree(
                                  text: currentMessage.text.toString(),
                                isSender: currentMessage.sender == widget.userModel.uid? true:false,
                                seen: currentMessage.seen??false,
                                tail: true,
                                delivered: true,
                              );
                            },
                          );
                        }
                        else if(snapshot.hasError) {
                          return const Center(
                            child: Text("An error occurred! Please check your internet connection."),
                          );
                        }
                        else {
                          return const Center(
                            child: Text("Say hi to your new friend"),
                          );
                        }
                      }
                      else {
                        return const Center(
                          child: CircularProgressIndicator(color: Color(0xff800000),),
                        );
                      }
                    },
                  ),
                ),
              ),

              Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: Row(
                  children: [

                    Flexible(
                      child: TextField(
                        controller: messageController,
                        maxLines: null,
                        decoration:const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter message"
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        sendMessage();
                      },
                      icon: Icon(Icons.send, color: Theme.of(context).colorScheme.secondary,),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}