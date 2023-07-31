// import 'package:flutter/scheduler.dart';
//
// import '../utils/message_reciver.dart';
// import '../utils/init_chat_model.dart'as init;
// import 'package:flutter/material.dart';
// import 'package:genesis/app/modules/inbox/controllers/inbox_controller.dart';
// import 'package:get/get.dart';
// import 'package:chat_bubbles/chat_bubbles.dart';
// import 'package:get_storage/get_storage.dart';
//
//
// class SingleChat extends StatefulWidget {
//   final String chatId;
//   final List<init.Messages> prevMsg;
//   final String name;
//   final String image;
//   final String whoAmI;
//   //sender
//   //reciver
//   const SingleChat({Key? key,required this.chatId,required this.prevMsg,required this.name,
//     required this.image, required this.whoAmI
//   }) : super(key: key);
//
//   @override
//   State<SingleChat> createState() => _SingleChatState();
// }
//
// class _SingleChatState extends State<SingleChat> {
//   InboxController controller = Get.put(InboxController());
//   IO.Socket socket = IO.io(
//       'https://789b-158-220-104-228.ngrok-free.app/',
//       <String, dynamic>{
//         'transports': ['websocket'],
//         'path': "/custom",
//         'forceNew': true
//       }
//   );
//   ScrollController scrollController = ScrollController();
//
//
//   @override
//   void initState() {
//     super.initState();
//     populatemsgs();
//     //connecting socket
//     socket.connect();
//     socket.onConnect((data) => print('conected'));
//     socket.onConnectError((data) => print(data));
//     socket.on('connection', (data) {
//       print(data);
//     });
//     socket.on('messageSent', (data){
//       //receiving the all messages here
//
//       MessageReceiver receiver = MessageReceiver.fromJson(data);
//
//       Messages? lastText = receiver.data?.messages?.last;
//       if(lastText!=null){
//         controller.chatMessages.add(
//             BubbleSpecialThree(
//               text: "${receiver.data?.messages?.last.text}",
//               tail: true,
//               isSender: lastText.sender == GetStorage().read('UserId')?
//               true: false,
//               delivered: true,
//             )
//         );
//       }
//     } );//socket on end
//
//     // SchedulerBinding.instance.addPostFrameCallback((_) {
//     //   scrollController.animateTo(
//     //       scrollController.position.minScrollExtent,
//     //       duration: const Duration(milliseconds: 1),
//     //       curve: Curves.fastOutSlowIn);
//     // });
//
//   }
//
//   @override
//   void dispose() {
//     controller.chatMessages.clear();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             CircleAvatar(
//               radius: 20.0,
//               backgroundImage:
//               NetworkImage("${widget.image}"),
//               backgroundColor: Colors.transparent,
//             ),
//             Text(' ${widget.name}',softWrap: false,maxLines: 1,overflow: TextOverflow.ellipsis,),
//           ],
//         ),
//
//         centerTitle: true,
//         backgroundColor:const Color(0xff800000),
//       ),
//       body: Container(
//         child: Stack(
//           children: [
//             Positioned(
//                 child: Obx(() =>
//                     SizedBox(
//                       height: Get.height-150,
//                       width: Get.width,
//                       child: ListView(
//                         controller: scrollController,
//                         physics: const BouncingScrollPhysics(),
//                         reverse: false,
//                         shrinkWrap: true,
//                         children: controller.chatMessages,
//                       ),
//                     )
//                 )
//             ),
//             Positioned(
//                 child: MessageBar(
//                   onSend: (text){
//                     sendMessage(text);
//                   },
//                 )
//             )
//           ],
//         ),
//       ),
//     );
//   }
//   void sendMessage(String text){
//     //
//     Map data= {
//       "id":widget.chatId,
//       "messageType":0,
//       "messageSender": widget.whoAmI,
//       "sender":"${GetStorage().read('UserId')}",
//       "text": text
//     };
//     socket.emit('newMessage',data);
//     //after emit i have to receive the packet back and then show in ui
//
//   }
//
//   void populatemsgs(){
//     //fetch the prevmsg from init route and populate the ui
//     for(var x in widget.prevMsg){
//       controller.chatMessages.add(
//           BubbleSpecialThree(
//             text: x.text.toString(),
//             tail: true,
//             isSender: x.sender == GetStorage().read('UserId')?
//             true:
//             false,
//             delivered: true,
//           )
//       );
//     }
//   }
//   void _openChatBox() {
//     // Your code to open the chat box
//     scrollController.animateTo(
//       scrollController.position.maxScrollExtent,
//       duration: Duration(milliseconds: 500),
//       curve: Curves.easeOut,
//     );
//   }
//
// }
//
