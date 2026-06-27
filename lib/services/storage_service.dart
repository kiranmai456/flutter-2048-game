
// ignore: depend_on_referenced_packages
class ScoreStorage {
  int _bestScore = 0;

  Future<int> getBestScore() async {
    return _bestScore;
  }

  Future<void> saveBestScore(int score) async {
    if (score > _bestScore) {
      _bestScore = score;
    }
  }
}