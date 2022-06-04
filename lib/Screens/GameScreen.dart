import 'dart:math';

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game1/Conf/SizeConfig.dart';

import '../route/RouteSettings.dart'as route;

class GameScreen extends StatefulWidget {

  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<int> _numbers = [];

  _GameScreenState(){
      _numbers = generateNum(16);

  }

  List<int> generateNum(int length) {
    List<int> nums = [];
    for (int i = 0; i < length; i += 1) {
      int random = Random().nextInt(length);
      if (!nums.contains(random)) {
        nums.add(random);
      } else {
        i = i - 1;
      }
    }
    print(nums);
    return nums;
  }

  void up() {
    final int zeroIndex = _numbers.indexOf(0);
    if (zeroIndex > 12) {
      return;
    } else {
      _numbers[zeroIndex] = _numbers[zeroIndex + 4];
      _numbers[zeroIndex + 4] = 0;
    }
  }

  void down() {
    final int zeroIndex = _numbers.indexOf(0);
    if (zeroIndex < 4) {
      return;
    } else {
      _numbers[zeroIndex] = _numbers[zeroIndex - 4];
      _numbers[zeroIndex - 4] = 0;
    }
  }

  void left() {
    final int zeroIndex = _numbers.indexOf(0);
    if (zeroIndex % 4 == 3) {
      return;
    } else {
      _numbers[zeroIndex] = _numbers[zeroIndex + 1];
      _numbers[zeroIndex + 1] = 0;
    }
  }

  void right() {
    final int zeroIndex = _numbers.indexOf(0);
    if (zeroIndex % 4 == 0) {
      return;
    } else {
      _numbers[zeroIndex] = _numbers[zeroIndex - 1];
      _numbers[zeroIndex - 1] = 0;
    }
  }

  void move(int integer) {
    final int integerIndex = _numbers.indexOf(integer);
    final int zeroIndex = _numbers.indexOf(0);
    switch (integerIndex - zeroIndex) {
      case 1:
        {
          print("left");
          setState(() {
            left();
          });
          break;
        }


      case -1:
        {
          print("right");
          setState(() {
            right();
          });

          break;
        }
      case 4:
        {print("up");
        setState(() {
          up();
        });


        break;}

      case -4:
        {
          print("down");
          setState(() {
            down();
          });
          break;
        }


      default:
        return;
    }
    check();
  }

  bool check(){
    for (int i=0; i<=14;i+=1){
      if((i+1)!=_numbers.elementAt(i)){
        print (i);
        print(_numbers.elementAt(i));
        print("not yet");
        return false;
      }
    }
    print("jawk behy");
    Navigator.pushNamed(context, route.Win );
    return true;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: const Text("Good Luck"),
    ),
    body:Container(
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight*.7,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child:GridView.count(
              crossAxisCount: 4,
              children: List.generate(16, (index) {
                if (_numbers.elementAt(index) == 0) {
                  return (Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      )));
                } else {
                  return InkWell(
                    onTap: () {
                      print("tapped");
                      print('\n Height : ${SizeConfig.screenHeight} \n Width: ${SizeConfig.screenWidth}');
                      move(_numbers.elementAt(index));

                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Text(
                          _numbers.elementAt(index).toString(),
                          style:
                          Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  );
                }
              }),
            )


          ),
          InkWell(child: Text("Press Here To Change Grid"),
          onTap: ()=>Navigator.pushNamed(context, route.Game),),
          InkWell(child: Text("Win"),
            onTap: ()=>Navigator.pushNamed(context, route.Win),)


        ],
      ),
    ));
  }
}
