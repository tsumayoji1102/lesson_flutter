import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_flutter/lesson/lesson_11/counter_widget.dart';

void main() {
  group('CounterWidget', () {
    testWidgets('正常系: +1ボタンでカウンターが増加する', (tester) async {
      // Arrange
      await tester.pumpWidget(MaterialApp(home: CounterWidget()));

      // Act
      await tester.tap(find.byKey(Key('increment_button')));
      await tester.pump();

      // Assert
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('正常系: リセットボタンで0に戻る', (tester) async {
      // Arrange
      await tester.pumpWidget(MaterialApp(home: CounterWidget()));

      // カウンターを増やしてからリセット
      await tester.tap(find.byKey(Key('increment_button')));
      await tester.pump();

      // Act
      await tester.tap(find.byKey(Key('reset_button')));
      await tester.pump();

      // Assert
      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('分岐パターン: 複数回タップの動作', (tester) async {
      // Arrange
      await tester.pumpWidget(MaterialApp(home: CounterWidget()));

      // Act
      await tester.tap(find.byKey(Key('increment_button')));
      await tester.tap(find.byKey(Key('increment_button')));
      await tester.tap(find.byKey(Key('increment_button')));
      await tester.pump();

      // Assert
      expect(find.text('3'), findsOneWidget);
    });
  });
}
