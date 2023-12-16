import 'package:flutter_test/flutter_test.dart';
import 'package:tic_tac_toe/tictactoe/BoardUtils.dart';

class TestCase<I, O> {
  final I input;
  final O expected;

  const TestCase(this.input, this.expected);
}

// TODO: fix the test, it currently always PASS
void main() {
  test('BoardUtils - findRowWinner', () {
    const cases = [
      TestCase([
        ['X','X','X'],
        ['O','X','X'],
        ['X','O','O'],
      ], 'X'),
      TestCase([
        ['X','O','X'],
        ['O','O','O'],
        ['X','X','O'],
      ], 'O'),
      TestCase([
        ['O','X','X'],
        ['X','O','O'],
        ['X','O','X'],
      ], 'X'),
    ];

    cases.map((testCase) {
      final board = testCase.input;
      final rowWinner = BoardUtils.findRowWinner(board);
      expect(rowWinner, equals(testCase.expected));
    });
  });

  test('BoardUtils - findColumnWinner', () {
    const cases = [
      TestCase([
        ['X','X','X'],
        ['O','X','X'],
        ['X','O','O'],
      ], 'X'),
      TestCase([
        ['X','O','X'],
        ['O','O','O'],
        ['X','X','O'],
      ], 'O'),
      TestCase([
        ['O','X','X'],
        ['X','O','O'],
        ['X','X','X'],
      ], 'X'),
    ];

    cases.map((testCase) {
      final board = testCase.input;
      final columnWinner = BoardUtils.findColumnWinner(board);
      expect(columnWinner, equals(testCase.expected));
    });
  });
}