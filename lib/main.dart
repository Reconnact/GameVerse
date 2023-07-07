import 'package:flutter/material.dart';
import 'pages/startingPage.dart';
import 'package:dcdg/dcdg.dart';

/// main function
void main() async {
  runApp(const MyApp(""));
}

/// StatelessWidget for header
class MyApp extends StatelessWidget {
  const MyApp(this.username, {super.key});
  final String username;
  @override
  Widget build(BuildContext context) {
    const appTitle = 'GameVerse';
    return MaterialApp(
        title: appTitle,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(appTitle),
          ),
          body: SingleChildScrollView(child: StartingPage(username),),
        )
    );
  }
}




