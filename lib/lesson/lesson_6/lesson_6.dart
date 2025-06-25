import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/home_tab_view.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/page_tab_view.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/routers_view.dart';

class Lesson6Widget extends HookWidget {
  const Lesson6Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 6'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: switch (selectedTab.value) {
        0 => const HomeTabView(),
        1 => const PageTabView(),
        2 => const RoutersView(),
        _ => const Center(child: Text('Unknown Tab')),
      },

      /// 画面の下部に表示されるナビゲーションバー.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab.value,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'PageView',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Routers'),
        ],
        onTap: (index) {
          // タブがタップされたときの処理
          selectedTab.value = index;
          // タップされたときの処理
          print('タップされたインデックス: $index');
        },
      ),
    );
  }
}
