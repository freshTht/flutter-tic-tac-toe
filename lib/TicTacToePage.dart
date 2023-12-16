import 'package:flutter/material.dart';
import 'package:tic_tac_toe/tictactoe/BoardUtils.dart';

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key});

  @override
  State<StatefulWidget> createState() => _TicTacToePageState();
}

List<List<String>> initBoard() => [
  ['','',''],
  ['','',''],
  ['','',''],
];

class _TicTacToePageState extends State<TicTacToePage> {
  String? winner;
  var board = initBoard();
  var round = 0;

  void mark(int row, int col) {
    final player = round % 2 == 0 ? 'X' : 'O';
    setState(() {
      if (board[row][col] == '') {
        board[row][col] = player;
      }
      round++;
    });
  }

  void resetBoard() {
    setState(() {
      winner = null;
      round = 0;
      board = initBoard();
    });
  }

  bool isGameOver() {
    return winner != null || round >= 9;
  }

  @override
  Widget build(BuildContext context) {
    winner = BoardUtils.findWinner(board);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tic Tac Toe"),
        actions: [
          OutlinedButton(
              onPressed: () {
                resetBoard();
              },
              child: const Text("Reset"),
          )
        ],
      ),
      body: isGameOver() ? buildGameOver() : buildBoard(),
    );
  }

  Widget buildGameOver() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "GAME OVER",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                  winner != null ? "Winner: $winner" : "No Winner",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 24),
                child: OutlinedButton(
                  onPressed: resetBoard,
                  child: const Text("Play Again"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBoard() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: List.generate(board.length, (row) => buildRow(row)),
    );
  }

  Widget buildRow(int row) {
    var rowData = board[row];
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(rowData.length, (col) => buildButton(row, col)),
      ),
    );
  }

  Widget buildButton(int row, int col) {
    return Expanded(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          child: OutlinedButton(
            onPressed: board[row][col] == '' ? () {
              mark(row, col);
            } : null,
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
            ),
            child: Text(
              board[row][col],
              style: const TextStyle(
                fontSize: 150,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        )
    );
  }
}