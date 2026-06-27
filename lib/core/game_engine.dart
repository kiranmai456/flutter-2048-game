import 'dart:math';
import '../models/game_state.dart';
import 'constants.dart';

class GameEngine {
  List<List<int>> grid;
  int score;

  final List<GameState> _history = [];
  final Random _random = Random();

  GameEngine()
      : grid = List.generate(
            Constants.size,
            (_) => List.filled(Constants.size, 0)),
        score = 0 {
    _saveState();
    addRandomTile();
    addRandomTile();
  }

  void reset() {
    grid = List.generate(
        Constants.size,
        (_) => List.filled(Constants.size, 0));
    score = 0;
    _history.clear();
    _saveState();
    addRandomTile();
    addRandomTile();
  }

  void _saveState() {
    _history.add(
      GameState(
        grid: grid.map((r) => List<int>.from(r)).toList(),
        score: score,
      ),
    );
  }

  void undo() {
    if (_history.length <= 1) return;

    _history.removeLast();

    final prev = _history.last;

    grid = prev.grid.map((r) => List<int>.from(r)).toList();
    score = prev.score;
  }

  List<int> _slide(List<int> row) {
    final filtered = row.where((e) => e != 0).toList();

    while (filtered.length < Constants.size) {
      filtered.insert(0, 0);
    }

    return filtered;
  }

  List<int> _merge(List<int> row) {
    for (int i = Constants.size - 1; i > 0; i--) {
      if (row[i] != 0 && row[i] == row[i - 1]) {
        row[i] *= 2;
        score += row[i];
        row[i - 1] = 0;
      }
    }
    return row;
  }

  List<int> operateRow(List<int> row) {
    row = _slide(row);
    row = _merge(row);
    return _slide(row);
  }

  void moveLeft() {
    _saveState();
    for (int i = 0; i < Constants.size; i++) {
      grid[i] = operateRow(grid[i]);
    }
    addRandomTile();
  }

  void moveRight() {
    _saveState();
    for (int i = 0; i < Constants.size; i++) {
      grid[i] =
          operateRow(grid[i].reversed.toList()).reversed.toList();
    }
    addRandomTile();
  }

  void moveUp() {
    _saveState();
    _transpose();
    moveLeft();
    _transpose();
  }

  void moveDown() {
    _saveState();
    _transpose();
    moveRight();
    _transpose();
  }

  void _transpose() {
    for (int i = 0; i < Constants.size; i++) {
      for (int j = i; j < Constants.size; j++) {
        final temp = grid[i][j];
        grid[i][j] = grid[j][i];
        grid[j][i] = temp;
      }
    }
  }

  void addRandomTile() {
    final empty = <List<int>>[];

    for (int i = 0; i < Constants.size; i++) {
      for (int j = 0; j < Constants.size; j++) {
        if (grid[i][j] == 0) {
          empty.add([i, j]);
        }
      }
    }

    if (empty.isEmpty) return;

    final pos = empty[_random.nextInt(empty.length)];
    grid[pos[0]][pos[1]] =
        _random.nextInt(10) == 0 ? 4 : 2;
  }

  bool isWin() {
    return grid.expand((e) => e).contains(2048);
  }

  bool isGameOver() {
    if (grid.expand((e) => e).contains(0)) return false;

    for (int i = 0; i < Constants.size; i++) {
      for (int j = 0; j < Constants.size; j++) {
        if (i < 3 && grid[i][j] == grid[i + 1][j]) return false;
        if (j < 3 && grid[i][j] == grid[i][j + 1]) return false;
      }
    }
    return true;
  }
}