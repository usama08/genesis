import 'package:flutter/material.dart';

class GamesView extends StatelessWidget {
  const GamesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lets Play'),
          toolbarHeight: 80,
          backgroundColor: const Color(0xff800000),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  print('shapak');
                },
                child: Image.asset(
                  'assets/ludo-game.jpg',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset('assets/card-game.jpg'),
            ],
          ),
        ));
  }
}
