import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_flutter/lesson/lesson_11/test_example/toggle_widget.dart';

void main() {
  group('ToggleWidget', () {
    group('正常系', () {
      testWidgets('スイッチタップで状態が変わる', (tester) async {
        await tester.pumpWidget(MaterialApp(home: ToggleWidget()));
        await tester.tap(find.byKey(Key('toggle_switch')));
        await tester.pump();
        expect(find.text('オンです'), findsOneWidget);
      });

      testWidgets('ボタンタップで状態が変わる', (tester) async {
        await tester.pumpWidget(MaterialApp(home: ToggleWidget()));
        await tester.tap(find.byKey(Key('toggle_button')));
        await tester.pump();
        expect(find.text('オンです'), findsOneWidget);
      });
    });

    group('分岐パターン', () {
      testWidgets('オンからオフに切り替わる', (tester) async {
        await tester.pumpWidget(MaterialApp(home: ToggleWidget()));
        await tester.tap(find.byKey(Key('toggle_button')));
        await tester.pump();
        await tester.tap(find.byKey(Key('toggle_button')));
        await tester.pump();
        expect(find.text('オフです'), findsOneWidget);
      });
    });
  });
}
