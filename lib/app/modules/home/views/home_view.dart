import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
          snackBar: const SnackBar(
            content: Text('Tap back again to leave'),
          ),
          child: Obx(() => controller.pages[controller.index.value])),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.index.value,
          backgroundColor: Colors.white,

          onTap: (index) {
            controller.index.value = index;
          },

          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xff013331),
          //selectedItemColor: Color(0xff800000),
          selectedFontSize: 12,
          unselectedFontSize: 10,
          selectedLabelStyle: TextStyle(color: Color(0xff800000)),

          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                  size: 30,
                ),
                label: 'Inbox'),
            // BottomNavigationBarItem(
            //     icon: ImageIcon(AssetImage('assets/Matches-transparent.png'),size: 50,),
            //     label: 'Matches',
            //     //activeIcon: ImageIcon(AssetImage('assets/matches-transformed.png'),color: Colors.white,size: 30,)
            // ),
            BottomNavigationBarItem(
                icon:
                    //  Icon(
                    //   Icons.add,
                    //   color: Colors.black,
                    // ),
                    ImageIcon(
                  AssetImage('assets/matches-transformed.png'),
                  size: 30,
                ),
                label: 'Matches'),
            // BottomNavigationBarItem(icon: Icon(Icons.games,size: 30,),label: 'Games'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.workspace_premium,
                  size: 30,
                ),
                label: 'Plan'),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     controller.index.value = 2;
      //   },
      //   elevation: 0,
      //   backgroundColor: Color(0xff800000),
      //   child: ImageIcon(
      //     AssetImage('assets/matches-transformed.png'),
      //     size: 50,
      //   ),
      // ),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
