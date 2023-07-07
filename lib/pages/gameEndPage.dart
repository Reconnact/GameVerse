import 'package:flutter/material.dart';
import 'package:gameverse/main.dart';
import 'chicagoPage.dart';
import 'startingPage.dart';

class GameEndPage extends StatelessWidget {
  const GameEndPage(this.username, this.points, {super.key});

  final String username;
  final int points;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Resultate'),
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: Table(
                      defaultColumnWidth: const FixedColumnWidth(120.0),
                      border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                      children: [
                        TableRow(children: [
                          Column(children: const [
                            Text('Benutzername', style: TextStyle(fontSize: 20.0)),
                          ]),
                          Column(children: const [
                            Text('Punkte', style: TextStyle(fontSize: 20.0))
                          ]),
                        ]),
                        TableRow(
                            children: [
                              Column(children: [Text(username)]),
                              Column(children: [Text('$points')]),
                            ]
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      side: const BorderSide(width: 1.0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp(username)),
                      );
                    },
                    child: const Text('Zum Startbildschirm zurückkehren'),
                  )
                ]
            )
        )
    );
  }
}
