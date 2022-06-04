import 'package:flutter/material.dart';
import 'package:game1/Conf/SizeConfig.dart';
import 'package:game1/Styles/TextStyle1.dart';

import 'GameScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Game"),
      ),
      body: Center(
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth*0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const MyTextStyle(
                text: "Welcome to the game",
              ),
              ElevatedButton(
                // style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(SizeConfig.screenWidth*0.2, 0, SizeConfig.screenWidth*0.2, 0) )),
                  onPressed: () async => await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const GameScreen())),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Start"),
                      Icon(Icons.play_circle_outline_rounded),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
