import 'package:flutter/material.dart';

import '../main.dart';

class tictactoePage extends StatelessWidget {
  tictactoePage(this.username, {super.key});

  final String username;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: tictactoeGamePage("Tic Tac Toe", username),
    );
  }
}
class tictactoeGamePage extends StatefulWidget {
  tictactoeGamePage(this.title, this.username, {super.key});
  final String username;
  final String title;
  @override
  State<tictactoeGamePage> createState() => _GameState(title, username);
}


class _GameState extends State<tictactoeGamePage> {
_GameState(this.title, this.username);
final String username;
final String title;
bool oTurn = false;
bool won = false;

List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
int oScore = 0;
int xScore = 0;
int filledBoxes = 0;

@override
Widget build(BuildContext context) {
	return Scaffold(
  appBar: AppBar(
        title: Text(title),
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
	body: Column(
		children: <Widget>[
		Expanded(
			child: Row(
				mainAxisAlignment: MainAxisAlignment.center,
				children: <Widget>[
				Padding(
					padding: const EdgeInsets.all(25.0),
					child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						Text(
						'$username (X)',
						style: const TextStyle(fontSize: 20,
										fontWeight: FontWeight.bold,
										color: Color.fromARGB(255, 0, 0, 0)),
						),
						Text(
						xScore.toString(),
						style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0)),
						),
					],
					),
				),
				Padding(
					padding: const EdgeInsets.all(25.0),
					child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						const Text('Player 2 (O)', style: TextStyle(fontSize: 20,
														fontWeight: FontWeight.bold,
														color: Color.fromARGB(255, 0, 0, 0))
						),
						Text(
						oScore.toString(),
						style: const TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0)),
						),
					],
					),
				),
				],
			),
		),
		Expanded(
			flex: 4,
			child: GridView.builder(
				itemCount: 9,
				gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
					crossAxisCount: 3),
				itemBuilder: (BuildContext context, int index) {
				return GestureDetector(
					onTap: () {
					_tapped(index);
					},
					child: Container(
					decoration: BoxDecoration(
						border: Border.all(color: const Color.fromARGB(255, 0, 0, 0))),
					child: Center(
						child: Text(
						displayElement[index],
						style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 35),
						),
					),
					),
				);
				}),
		),
		],
	),
	);
}

void _tapped(int index) {
	setState(() {
	if (oTurn && displayElement[index] == '') {
		displayElement[index] = 'O';
		filledBoxes++;
	} else if (!oTurn && displayElement[index] == '') {
		displayElement[index] = 'X';
		filledBoxes++;
	}

	oTurn = !oTurn;
	_checkWinner();
	});
}

void _checkWinner() {
	
	// Checking rows
	if (displayElement[0] == displayElement[1] &&
		displayElement[0] == displayElement[2] &&
		displayElement[0] != '') {
	  _showWinDialog(displayElement[0]);
	}
	if (displayElement[3] == displayElement[4] &&
		displayElement[3] == displayElement[5] &&
		displayElement[3] != '') {
	  _showWinDialog(displayElement[3]);
	}
	if (displayElement[6] == displayElement[7] &&
		displayElement[6] == displayElement[8] &&
		displayElement[6] != '') {
	  _showWinDialog(displayElement[6]);
	}

	// Checking Column
	if (displayElement[0] == displayElement[3] &&
		displayElement[0] == displayElement[6] &&
		displayElement[0] != '') {
	  _showWinDialog(displayElement[0]);
	}
	if (displayElement[1] == displayElement[4] &&
		displayElement[1] == displayElement[7] &&
		displayElement[1] != '') {
	  _showWinDialog(displayElement[1]);
	}
	if (displayElement[2] == displayElement[5] &&
		displayElement[2] == displayElement[8] &&
		displayElement[2] != '') {
	  _showWinDialog(displayElement[2]);
	}

	// Checking Diagonal
	if (displayElement[0] == displayElement[4] &&
		displayElement[0] == displayElement[8] &&
		displayElement[0] != '') {
	  _showWinDialog(displayElement[0]);
	}
	if (displayElement[2] == displayElement[4] &&
		displayElement[2] == displayElement[6] &&
		displayElement[2] != '') {
	  _showWinDialog(displayElement[2]);
	} if (filledBoxes == 9) {
    if (!won){
	    _showDrawDialog();
    }
	}
}

void _showWinDialog(String winner) {
  won = true;
	showDialog(
		barrierDismissible: false,
		context: context,
		builder: (BuildContext context) {
		return AlertDialog(
			title: Text("\" " + winner + " \" is Winner!!!"),
			actions: [
			TextButton(
				child: Text("Play Again"),
				onPressed: () {
				_clearBoard();
        won = false;
				Navigator.of(context).pop();
				},
			)
			],
		);
		});

	if (winner == 'O') {
	oScore++;
	} else if (winner == 'X') {
	xScore++;
	}
}

void _showDrawDialog() {
	showDialog(
		barrierDismissible: false,
		context: context,
		builder: (BuildContext context) {
		return AlertDialog(
			title: Text("Draw"),
			actions: [
			TextButton(
				child: Text("Play Again"),
				onPressed: () {
				_clearBoard();
				Navigator.of(context).pop();
				},
			)
			],
		);
		});
}

void _clearBoard() {
	setState(() {
	for (int i = 0; i < 9; i++) {
		displayElement[i] = '';
	}
	});

	filledBoxes = 0;
}

void _clearScoreBoard() {
	setState(() {
	xScore = 0;
	oScore = 0;
	for (int i = 0; i < 9; i++) {
		displayElement[i] = '';
	}
	});
	filledBoxes = 0;
}
}
