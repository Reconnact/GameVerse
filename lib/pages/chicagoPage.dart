import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:shake/shake.dart';
import 'gameEndPage.dart';
import 'package:gameverse/main.dart';

/// Game page 
class chicagoPage extends StatelessWidget {
  chicagoPage(this.username, {super.key});
  final String username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chicago Dice',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomeGamePage(title: 'Chicago Dice', username: username),
    );
  }
}

class HomeGamePage extends StatefulWidget {
  const HomeGamePage({super.key, required this.title, required this.username});
  final String username;
  final String title;
  @override
  State<HomeGamePage> createState() => _GameState(username);
}

class _GameState extends State<HomeGamePage> {
  _GameState(this.username);
  late ShakeDetector detector;
  final String username;
  int wurfel1 = 1;
  int wurfel2 = 1;
  int round = 1;
  int goal = 2;
  int sum = 0;
  int points = 0;
  double x=0, xBefore=0;
  bool shake = false;
  bool started = false;
  Random random = new Random();
  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
    void initState() {
      super.initState();
      detector = ShakeDetector.autoStart(
        onPhoneShake: () {
          setState(() {
            if (!shake){
              shake = true;
              _incrementCounter(random.nextInt(6) + 1, random.nextInt(6) + 1);
              sum = wurfel1 + wurfel2;
              if (sum == goal) {
                points += sum;
              }
              round++;
              goal++;
              AudioPlayer().play(AssetSource('blingbling.mp3'));
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Summe: $sum'),
                  content: Text('Punkte: $points'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => {
                        shake = false,
                        Navigator.pop(context, 'OK'),
                        if (round == 12){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => new GameEndPage(username, points)),
                            (Route<dynamic> route) => false,
                          )
                        },
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
          }
      });
    });
    }

  @override
  void dispose() {
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  void _incrementCounter(int random1, int random2) {
    setState(() {
        wurfel1 = random1;
        wurfel2 = random2;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: InkWell(
          onTap: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MyApp(username)),
              (Route<dynamic> route) => false,
            );
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black54,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Center(child: Text('Runde: $round')),
              subtitle: Center(child: Text('Ziel: $goal')),
            ),
            Image.asset('assets/wurfel$wurfel1.png', width: 150,height: 150),
            Image.asset('assets/wurfel$wurfel2.png', width: 150,height: 150),
          ],
        ),
      ),
    );
  }
}
