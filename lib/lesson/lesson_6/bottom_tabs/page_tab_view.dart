import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PageTabView extends HookWidget {
  const PageTabView({super.key});

  @override
  Widget build(BuildContext context) {
    /// PageViewを使って、ページを切り替えることができる。
    return PageView(
      children: [
        Center(child: Text('Page 1', style: const TextStyle(fontSize: 24))),
        Center(child: Text('Page 2', style: const TextStyle(fontSize: 24))),
        Center(child: Text('Page 3', style: const TextStyle(fontSize: 24))),
      ],

      /// ページが変更されたときの処理.
      onPageChanged: (value) {
        print('現在のページ: $value');
      },
    );
  }
}
