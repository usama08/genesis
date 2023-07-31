// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:chat_bubbles/chat_bubbles.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// class ChatScreen extends StatefulWidget {
//   const ChatScreen({Key? key}) : super(key: key);
//
//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   ChatScreenController controller = Get.put(ChatScreenController());
//
//   late IO.Socket socket;
//
//   @override
//   void initState() {
//     super.initState();
//     socket = IO.io('https://genesisapi.leafsols.com');
//     socket.connect();
//     socket.onConnect((data) => print('conected'));
//     socket.onConnectError((data) => print(data));
//     socket.on('connecteddd', (data) {
//       print(data);
//     });
//     //controller.initSocket();
//   }
//   @override
//   void dispose() {
//     super.dispose();
//     //socket.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xff800000),
//       ),
//       body: SizedBox(
//         height: Get.height,
//         width: Get.width,
//         child: Stack(
//           children: [
//             Positioned(
//               child: SizedBox(
//                 width: Get.width,
//                 child:Obx(
//                     ()=>
//                         Column(
//                           children: controller.messages,
//                         )
//                 )
//               ),
//             ),
//
//             Positioned(
//               child: MessageBar(
//                 sendButtonColor: const Color(0xff800000),
//                 onSend: (message){
//                   print(message);
//                   // controller.sendMessage(message,true);
//                   Map messageMap = {'success':'client'};
//                   // controller.socket?.emit('mehdi',messageMap);
//                   //controller.socket.emit('connection',messageMap);
//
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (){
//
//
//         },
//       ),
//     );
//   }
// }
// class ChatScreenController extends GetxController{
//   List<Widget> messages = <Widget>[].obs;
//
//   Rx<IO.Socket> socket = IO.io(
//       'https://genesisapi.leafsols.com',
//       // <String, dynamic>{
//       //   'autoConnect': true,
//       //   'transports': ['websocket'],
//       // }
//   ).obs;
//
//   void initSocket()async{
//     socket.value.connect();
//     socket.value.onConnect((data) {
//       print('connected ');
//     });
//     socket.value.onConnectError((data) => print(data));
//   }
//
//
//
//   // void initSocket(){
//   //   socket = IO.io(
//   //         'https://genesisapi.leafsols.com',
//   //   <String, dynamic>{
//   //   'autoConnect': true,
//   //   'transports': ['websocket'],
//   //       }
//   //   );
//   //   socket.connect();
//   //   socket.onConnect((_) {
//   //     print('connect');
//   //     //socket.emit('msg', 'test');
//   //   });
//   //   socket.onConnectError((err) => print(err));
//   // }
//
//   //when sending message from my side
//   //when receiving message from server side
//
//
//   void sendMessage(String text,bool sender){
//     messages.add(
//         BubbleSpecialThree(
//           text: text,
//           color: const Color(0xff800000),
//           tail: true,
//           textStyle: const TextStyle(color: Colors.white, fontSize: 16),
//         )
//     );
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
// }
