import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxView extends StatelessWidget {
  const InboxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff800000),
        title: const Text('Chat History'),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                //Get.to(()=>FireBaseChat());
              },
              child: Container(
                height: 87,
                width: Get.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.network(
                          'https://images.pexels.com/photos/2106685/pexels-photo-2106685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                          fit: BoxFit.cover,
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
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Arminder Gill',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            ' Hi, we have talked previously about our match...'),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\t5 hours ago',
                          style: TextStyle(fontSize: 11),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class InboxView extends GetView<InboxController> {
//   const InboxView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Chat History'),
//         centerTitle: true,
//         backgroundColor: Color(0xff800000),
//       ),
//       body: SingleChildScrollView(
//         physics: BouncingScrollPhysics(),
//         child: Column(
//           children: [
//             const SizedBox(height: 20,),
//
//             Container(
//               height: 100,
//               width: Get.width,
//               padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//               margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300,),
//                   borderRadius: BorderRadius.all(Radius.circular(20))
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 25,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(45),
//                       child: Image.network('https://images.pexels.com/photos/2106685/pexels-photo-2106685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',fit: BoxFit.cover,width: 50,height: 50,),
//                     ),
//                   ),
//                   const SizedBox(width: 5,),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 10,),
//                       Text('Shawn Mendas',style: TextStyle(fontWeight: FontWeight.w500),),
//                       SizedBox(height: 5,),
//                       Text(' Hi, we have talked previously about our match...'),
//                       SizedBox(height: 5,),
//                       Text('\t5 hours ago',style: TextStyle(fontSize: 11),)
//                     ],)
//                 ],
//               ),
//             ),
//             Container(
//               height: 100,
//               width: Get.width,
//               padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//               margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300,),
//                   borderRadius: BorderRadius.all(Radius.circular(20))
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 25,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(45),
//                       child: Image.network('https://images.pexels.com/photos/2106685/pexels-photo-2106685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',fit: BoxFit.cover,width: 50,height: 50,),
//                     ),
//                   ),
//                   const SizedBox(width: 5,),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 10,),
//                       Text('Quratul Ain Baloch',style: TextStyle(fontWeight: FontWeight.w500),),
//                       SizedBox(height: 5,),
//                       Text(' Hi, we have talked previously about our match...'),
//                       SizedBox(height: 5,),
//                       Text('\t5 hours ago',style: TextStyle(fontSize: 11),)
//                     ],)
//                 ],
//               ),
//             ),
//             Container(
//               height: 100,
//               width: Get.width,
//               padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//               margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade300,),
//                   borderRadius: BorderRadius.all(Radius.circular(20))
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 25,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(45),
//                       child: Image.network('https://images.pexels.com/photos/2106685/pexels-photo-2106685.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',fit: BoxFit.cover,width: 50,height: 50,),
//                     ),
//                   ),
//                   const SizedBox(width: 5,),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 10,),
//                       Text('Winston Churchill',style: TextStyle(fontWeight: FontWeight.w500),),
//                       SizedBox(height: 5,),
//                       Text(' Hi, we have talked previously about our match...'),
//                       SizedBox(height: 5,),
//                       Text('\t5 hours ago',style: TextStyle(fontSize: 11),)
//                     ],)
//                 ],
//               ),
//             ),
//
//           ],
//         ),
//       )
//     );
//   }
// }
