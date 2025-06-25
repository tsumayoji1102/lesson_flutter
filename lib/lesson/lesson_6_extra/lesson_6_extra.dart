import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/home_tab_view.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/page_tab_view.dart';
import 'package:lesson_flutter/lesson/lesson_6/bottom_tabs/routers_view.dart';

enum Lesson6Tabs {
  home,
  page,
  routers;

  String get label {
    switch (this) {
      case home:
        return 'Home';
      case page:
        return 'Page';
      case routers:
        return 'Routers';
    }
  }

  Widget get view {
    return switch (this) {
      home => const HomeTabView(),
      page => const PageTabView(),
      routers => const RoutersView(),
    };
  }

  IconData get icon {
    return switch (this) {
      home => Icons.home,
      page => Icons.settings,
      routers => Icons.person,
    };
  }
}

class Lesson6WidgetExtra extends HookWidget {
  const Lesson6WidgetExtra({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lesson 6'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Lesson6Tabs.values[selectedTab.value].view,

      /// 画面の下部に表示されるナビゲーションバー.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab.value,
        items:
            Lesson6Tabs.values.map((tab) {
              return BottomNavigationBarItem(
                icon: Icon(tab.icon),
                label: tab.label,
              );
            }).toList(),
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
