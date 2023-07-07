import 'package:flutter/material.dart';
import 'dicePage.dart';
import 'tictactoePage.dart';
import 'chicagoPage.dart';

/// State for startingpage
class StartingPage extends StatelessWidget {
  const StartingPage(this.username, {super.key});

  final String username;

  /// checks if username is empty
  bool checkUsername(String username) {
    if (username == "") {
      return false;
    } else {
      return true;
    }
  }

  /// Builds the starting page
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController(text: username);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Benutzername',
            ),
          ),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(width: 1.0),
          ),
          onPressed: () {
            final String username = usernameController.text;
            if (checkUsername(username) == true) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => dicePage(username)),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("Dein Benutzername darf nicht leer sein!"),
                )
              );
            }
          },
          child: const Text('Würfel'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(width: 1.0),
          ),
          onPressed: () {
            final String username = usernameController.text;
            if (checkUsername(username) == true) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => chicagoPage(username)),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("Dein Benutzername darf nicht leer sein!"),
                )
              );
            }
          },
          child: const Text('Chicago Dice spielen'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(width: 1.0),
          ),
          onPressed: () {
            final String username = usernameController.text;
            if (checkUsername(username) == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => tictactoePage(username)
                ),
              );
            } else {
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("Dein Benutzername darf nicht leer sein!"),
                ),
              );
            }
          },
          child: const Text('Tic Tac Toe spielen'),
        ),
      ],
    );
  }
}
