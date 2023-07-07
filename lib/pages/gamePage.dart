/*import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'gameEndPage.dart';

/// Game page 
class GamePage extends StatelessWidget {
  GamePage(this.username, {super.key});

  final String username;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shake to Number!',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: const HomeGamePage(title: 'Shake to Number!'),
    );
  }
}

/*
class HomeGamePage extends StatefulWidget {
  const HomeGamePage({super.key, required this.title});
  final String title;
  @override
  State<HomeGamePage> createState() => _GameState();
}

class _GameState extends State<HomeGamePage> {
  int _counter = 1;
  double x=0, xBefore=0;
  bool shake = false;
  Random random = new Random();

  @override
    void initState() {
      super.initState();
      accelerometerEvents.listen(
        (event) {
          setState(() {
            xBefore = x;
            x = event.x;
            if (xBefore != x && shake == false) {
              shake = true;
              _incrementCounter();
            }
          });
        }
      );
    }

    @override
    void dispose() {
      super.dispose();
    }

  void _incrementCounter() {
    setState(() async {
      _counter = await random.nextInt(6) + 1; 
      AudioPlayer().play(AssetSource('blingbling.mp3'));
      await Future.delayed(Duration(seconds: 3));
      shake = false;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/wurfel$_counter.png')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => new GameEndPage("username")),
            (Route<dynamic> route) => false,
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.face_retouching_off_rounded),
      ), 
    );
  }
}

*/*/