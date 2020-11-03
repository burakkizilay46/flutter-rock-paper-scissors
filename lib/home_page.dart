import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tas_kagit_makas/winnerpage_computer.dart';
import 'package:tas_kagit_makas/winnerpage_gamer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

List<Image> imgHands = [
  Image.asset('images/rock_hand.png'),
  Image.asset('images/paper_hand.png'),
  Image.asset('images/scissors_hand.png')
];
Image randomImage = Image.asset('images/android_icon.png');

var tappedIndex;
var randomIndex;
String gameFinish = 'Start Game';

var gameNumber = 0;
var skorComp = 0;
var skorGamer = 0;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rock - Paper - Scissors Game"),
      ),
      body: Center(
          child: Container(
        margin: EdgeInsets.only(top: 25),
        child: Column(
          children: <Widget>[
            Text(
              gameFinish,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Game Counter : ' + '$gameNumber',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              'Computer   ' + '$skorComp' + ' - ' + '$skorGamer' + '    Gamer',
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 50),
            SizedBox(
              child: randomImage,
              height: 160,
              width: 120,
            ),
            SizedBox(height: 25),
            RaisedButton(
              child: Text('Game'),
              color: Colors.indigoAccent,
              onPressed: () {
                setState(() {
                  randomIndex = RndImage() as int;
                  randomImage = imgHands[randomIndex];
                  whoWon(randomIndex + 1, tappedIndex);
                  if (gameFinished() == true) {
                    resetGame();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WinnerPageComputer()));
                  } else if (gameFinished() == false) {
                    resetGame();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WinnerPageGamer()));
                  }
                });
              },
            ),
            RaisedButton(
              child: Text('Reset'),
              color: Colors.indigoAccent,
              onPressed: () {
                setState(() {
                  resetGame();
                });
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: InkWell(
                    child: Container(
                      child: imgHands[0],
                      width: 100,
                      height: 100,
                    ),
                    onTap: () {
                      setState(() {
                        tappedIndex = 1;
                      });
                    },
                  ),
                  color: tappedIndex == 1 ? Colors.green : Colors.red,
                  width: 120,
                ),
                Container(
                  child: InkWell(
                    child: Container(
                      child: imgHands[1],
                      width: 100,
                      height: 100,
                    ),
                    onTap: () {
                      setState(() {
                        tappedIndex = 2;
                      });
                    },
                  ),
                  color: tappedIndex == 2 ? Colors.green : Colors.red,
                  width: 120,
                ),
                Container(
                  child: InkWell(
                      child: Container(
                        child: imgHands[2],
                        width: 100,
                        height: 100,
                      ),
                      onTap: () {
                        setState(() {
                          tappedIndex = 3;
                        });
                      }),
                  color: tappedIndex == 3 ? Colors.green : Colors.red,
                  width: 120,
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

int RndImage() {
  var rnd = new Random();

  var rand_num;
  rand_num = rnd.nextInt(3);

  return rand_num;
}

void whoWon(int compIndex, int gamerIndex) {
  gameNumber++;

  if (compIndex == gamerIndex) {
    gameFinish = 'Scoreless!';
  } else {
    if (compIndex == 1) {
      if (gamerIndex == 2) {
        gameFinish = 'Gamer Win!';
        skorGamer++;
      } else {
        gameFinish = 'Computer Win!';
        skorComp++;
      }
    } else if (compIndex == 2) {
      if (gamerIndex == 1) {
        gameFinish = 'Computer Win!';
        skorComp++;
      } else {
        gameFinish = 'Gamer Win!';
        skorGamer++;
      }
    } else {
      if (gamerIndex == 1) {
        gameFinish = 'Gamer Win!';
        skorGamer++;
      } else {
        gameFinish = 'Computer Win!';
        skorComp++;
      }
    }
  }
}

void resetGame() {
  randomImage = Image.asset('images/android_icon.png');
  gameFinish = 'Start Game';
  tappedIndex = 0;
  gameNumber = 0;
  skorComp = 0;
  skorGamer = 0;
}

// İf Winner Computer = true;
//İf Winner Gamer = false;

bool gameFinished() {
  if (skorComp == 5 || skorGamer == 5) {
    if (skorComp == 5) {
      return true;
    } else {
      return false;
    }
  }
}




