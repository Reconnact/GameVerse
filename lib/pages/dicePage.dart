import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:shake/shake.dart';
import 'package:gameverse/main.dart';
import 'gameEndPage.dart';

/// Game page 
class dicePage extends StatelessWidget {
  dicePage(this.username, {super.key});
  final String username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Würfel',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: diceGamePage(title: 'Würfel', username: username),
    );
  }
}

class diceGamePage extends StatefulWidget {
  const diceGamePage({super.key, required this.title, required this.username});
  final String username;
  final String title;
  @override
  State<diceGamePage> createState() => _GameState(username);
}

class _GameState extends State<diceGamePage> {
  _GameState(this.username);
  final String username;
  late ShakeDetector detector;
  int wurfel1 = 1;
  int round = 1;
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
            _incrementCounter(random.nextInt(6) + 1);
            round++;
            wait();
          });
        }
      );
    }

    @override
    void dispose() {
      for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
        subscription.cancel();
      }
      super.dispose();
    }

  void _incrementCounter(int random1) {
    setState(() {
      wurfel1 = random1;
    });
  }

  void wait() async {
    AudioPlayer().play(AssetSource('blingbling.mp3'));
    await Future.delayed(Duration(seconds: 3));
    shake = false;
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
          child: Icon(
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
            ),
            Image.asset('assets/wurfel$wurfel1.png', width: 150,height: 150),
          ],
        ),
      ),
    );
  }
}
