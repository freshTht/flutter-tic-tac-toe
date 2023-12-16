class BoardUtils {
  static String? findWinner(List<List<String>> board) => (
      findRowWinner(board)
          ?? findColumnWinner(board)
          ?? findDiagonalWinner(board)
  );

  static String? findRowWinner(List<List<String>> board) {
    // for (int y = 0; y < board.length; y++) {
    //   var row = board[y];
    //   var isWin = row.every((item) => item.isNotEmpty && item == row[0]);
    //   if (isWin) {
    //     return row[0];
    //   }
    // }
    // return null;
    final winnerForRows = board.map((row) => findWinnerForBoxGroup(row));
    return winnerForRows.firstWhere((winner) => winner != null, orElse: () => null);
  }

  static String? findColumnWinner(List<List<String>> board) {
    // for (int x = 0; x < board[0].length; x++) {
    //   var isWin = board.every((row) => row[x].isNotEmpty && row[x] == board[0][x]);
    //   if (isWin) {
    //     return board[0][x];
    //   }
    // }
    // return null;
    final columns = List.generate(board[0].length, (col) {
      return List.generate(board.length, (row) => board[row][col]);
    });
    final winnerForColumns = columns.map((col) => findWinnerForBoxGroup(col));
    return winnerForColumns.firstWhere((winner) => winner != null, orElse: () => null);
  }

  static String? findDiagonalWinner(List<List<String>> board) {
    final diag1 = List.generate(board.length, (i) => board[i][i]);
    final diag2 = List.generate(board.length, (i) => board[board.length - i - 1][i]);

    return findWinnerForBoxGroup(diag1) ?? findWinnerForBoxGroup(diag2);
  }

  static String? findWinnerForBoxGroup(List<String> boxes) =>
      boxes.every((box) => box.isNotEmpty && box == boxes.first) ? boxes.first : null;
}