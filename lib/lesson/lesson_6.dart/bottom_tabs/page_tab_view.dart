import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PageTabView extends HookWidget {
  const PageTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final pageCount = 3;
    final pageController = usePageController(initialPage: 0);

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
    // return PageView.builder(
    //   itemCount: pageCount,
    //   controller: pageController,
    //   //
    //   itemBuilder: (context, index) {
    //     return Center(
    //       child: Text(
    //         'Page ${pages[index]}',
    //         style: const TextStyle(fontSize: 24),
    //       ),
    //     );
    //   },
    //   onPageChanged: (index) {
    //     // ページが変更されたときの処理
    //     print('現在のページ: $index');
    //   },
    // );
  }
}
