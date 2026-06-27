class Helpers {
  static List<List<int>> copyGrid(List<List<int>> grid) {
    return grid.map((row) => List<int>.from(row)).toList();
  }

  static bool compareGrids(
      List<List<int>> a, List<List<int>> b) {
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (a[i][j] != b[i][j]) return false;
      }
    }
    return true;
  }

  static List<List<int>> emptyGrid() {
    return List.generate(4, (_) => List.filled(4, 0));
  }
}