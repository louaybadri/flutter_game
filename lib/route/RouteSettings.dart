import 'package:flutter/material.dart';
import 'package:game1/Screens/GameScreen.dart';
import 'package:game1/Screens/HomeScreen.dart';
import 'package:game1/Screens/WinScreen.dart';
const Home="Home";
const Win="Win";
const Game="Game";
// const Home="Home";
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case Home:
      return MaterialPageRoute(builder: (context) => const HomeScreen());

    case Win:
      return MaterialPageRoute(
        builder: (context) => WinScreen(),

      );
    case Game:
      return MaterialPageRoute(builder: (context) => const GameScreen());

    // case parentSettings:
    //   return MaterialPageRoute(
    //     builder: (context) => const ParentSettingsScreen(
    //       name: "abbes",
    //     ),
    //   );
    //
    // case coursesList:
    //   return MaterialPageRoute(
    //     builder: (context) => CompletedCourses(
    //       subject: settings.arguments as List<Subject>,
    //     ),
    //   );
    //
    // case completeAddChild:
    //   return MaterialPageRoute(
    //       builder: (context) => LoginCompleted(name: "name", code: "123456"));
    //
    // case parentLogin:
    //   return MaterialPageRoute(builder: (context) => const ParentLoginScreen());
    //
    // case parentNotif:
    //   return MaterialPageRoute(
    //       builder: (context) => const ParentNotifications());

    default:
      throw ('This route name does not exit');
  }
}