import 'dart:io';

import 'package:flutter/material.dart';
import 'package:game1/Conf/SizeConfig.dart';
import 'package:game1/Styles/TextStyle1.dart';
import '../route/RouteSettings.dart'as route;

class WinScreen extends StatelessWidget {
  const WinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: SizeConfig.screenHeight,
        width: SizeConfig.screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const MyTextStyle(text: "Congrats You Won", winning: true,),
            Image.asset("assets/imgs/win.gif"),
            ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, route.Game), child: Row(children: [
              Icon(Icons.replay)
              ,Text("Restart")
            ],))  ,
            ElevatedButton(onPressed: ()=>Navigator.pushNamed(context, route.Home), child: Row(children: [
              Icon(Icons.home)
              ,Text("Home")
            ],)),
            ElevatedButton(onPressed: ()=>exit(0), child: Row(children: [

              Text("Exit")
            ],))
          
          ],
        ),
      )
    );
  }
}
