class PlayerStats {
  int _total = 0;
  int _numRoundsWon = 0;

  int get total => _total;

  void incNumRoundsWon() {
    _numRoundsWon++;
  }

  void addPoints(int points) {
    _total += points;
  }

  void clear() {
    _total = 0;
  }

  String toString() {
    return 'points: $_total, rounds: $_numRoundsWon';
  }
}
