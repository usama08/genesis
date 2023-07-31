import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../utils/recent_chats_model.dart';
import 'package:genesis/app/data/providers/chats/get_all_chats.dart';

class InboxController extends GetxController {
  List<Widget> chatMessages = <Widget>[].obs;
  List<Doc> recentChats = <Doc>[].obs;

  // IO.Socket socket = IO.io(
  //   'https://789b-158-220-104-228.ngrok-free.app/',
  //     <String, dynamic>{
  //       'transports': ['websocket'],
  //       'path': "/custom",
  //       'forceNew': true
  //     }
  // );

  Future<void> getRecentChats()async{
    List<Doc>? data = await GetAllChatsProvider().getAllChats();
    if(data!=null){
      recentChats.clear();
      for(var x in data){
        if(x.messages!.isNotEmpty){
          recentChats.add(x);
        }
      }

    }
  }


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
