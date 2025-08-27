import 'package:flutter_test/flutter_test.dart';
import 'package:lesson_flutter/lesson/lesson_11/test_example/shopping_cart.dart';

void main() {
  /// groupを使うことで、テストをグループ化できる。
  group('ShoppingCart', () {
    late ShoppingCart cart;

    setUp(() {
      cart = ShoppingCart();
    });

    /// 正常系: ただしい動作をすることを確認する.
    group('正常系', () {
      test('アイテムが正しく追加される', () {
        cart.addItem('りんご');
        expect(cart.itemCount, equals(1));
      });
    });

    /// 異常系: 不正な操作を行った場合の挙動を確認する.
    group('異常系', () {
      test('空文字列で例外が発生する', () {
        expect(() => cart.addItem(''), throwsArgumentError);
      });
    });

    /// 分岐: ステータスに応じた動作を確認する.
    group('分岐', () {
      test('ステータス - 空', () {
        expect(cart.getStatus(), equals('空'));
      });

      test('ステータス - 使用中', () {
        cart.addItem('りんご');
        expect(cart.getStatus(), equals('使用中'));
      });

      test('ステータス - フル', () {
        for (int i = 0; i < 5; i++) {
          cart.addItem('商品$i');
        }
        expect(cart.getStatus(), equals('フル'));
      });
    });
  });
}
