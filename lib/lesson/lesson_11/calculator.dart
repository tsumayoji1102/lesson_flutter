class Calculator {
  int add(int a, int b) => a + b;

  int divide(int a, int b) {
    if (b == 0) throw ArgumentError('ゼロ除算です');
    return a ~/ b;
  }

  String getGrade(int score) {
    if (score >= 80) return 'A';
    if (score >= 60) return 'B';
    return 'C';
  }
}
