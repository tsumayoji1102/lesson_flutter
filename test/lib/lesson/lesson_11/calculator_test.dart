import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_flutter/lesson/lesson_11/calculator.dart';

void main() {
  group('Calculator', () {
    final calculator = Calculator();

    test('正常系: 足し算が正しく動作する', () {
      // Act
      final result = calculator.add(3, 5);

      // Assert
      expect(result, equals(8));
    });

    test('異常系: ゼロ除算で例外が発生する', () {
      // Act & Assert
      expect(() => calculator.divide(10, 0), throwsArgumentError);
    });

    test('分岐パターン: 成績判定 - A判定', () {
      expect(calculator.getGrade(85), equals('A'));
    });

    test('分岐パターン: 成績判定 - B判定', () {
      expect(calculator.getGrade(70), equals('B'));
    });

    test('分岐パターン: 成績判定 - C判定', () {
      expect(calculator.getGrade(50), equals('C'));
    });
  });
}
